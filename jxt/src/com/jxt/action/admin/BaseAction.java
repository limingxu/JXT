package com.jxt.action.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.security.context.SecurityContextHolder;

import com.jxt.common.Pager;
import com.jxt.common.Setting;
import com.jxt.entity.Admin;
import com.jxt.entity.BusiStatus;
import com.jxt.entity.City;
import com.jxt.entity.District;
import com.jxt.entity.Grade;
import com.jxt.entity.SmsStatus;
import com.jxt.service.AdminService;
import com.jxt.util.JsonUtil;
import com.jxt.util.SettingUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class BaseAction extends ActionSupport {

	private static final long serialVersionUID = 6718838822334455667L;
	
	private static final String HEADER_ENCODING = "UTF-8";
	private static final boolean HEADER_NO_CACHE = true;
	private static final String HEADER_TEXT_CONTENT_TYPE = "text/plain";
	private static final String HEADER_JSON_CONTENT_TYPE = "text/plain";
	
	public static final String VIEW = "view";
	public static final String LIST = "list";
	public static final String SUCCESS = "success";
	public static final String ERROR = "error";
	public static final String REDIRECT = "redirect";
	@Resource(name="adminServiceImpl")
	private AdminService adminService;
	
	public static final String STATUS_PARAMETER_NAME = "status";// 操作状�?参数名称
	public static final String MESSAGE_PARAMETER_NAME = "message";// 操作消息参数名称
	
	protected static List<BusiStatus> busiStatusList = new ArrayList<BusiStatus>();
	protected static List<SmsStatus> smsStatusList = new ArrayList<SmsStatus>();
	/**行政区域请使用city.districts*/
	protected static List<City> cityList = new ArrayList<City>();
	protected static List<Grade> gradeList = new ArrayList<Grade>();
	protected static List<District> districtList = new ArrayList<District>();
	
	protected static Map<String,BusiStatus> busiStatusMap = new HashMap<String,BusiStatus>();
	protected static Map<String,SmsStatus> smsStatusMap = new HashMap<String,SmsStatus>();
	protected static Map<Long,City> cityMap = new HashMap<Long,City>();
	protected static Map<Long,Grade> gradeMap = new HashMap<Long,Grade>();
	protected static Map<Long,District> districtMap = new HashMap<Long,District>();
	
	// 操作状态（警告,错误、成功）
	public enum Status {
		warn, error, success
	}
	
	protected Long id;
	protected Long[] ids;
	protected Pager pager = new Pager();
	protected String logInfo;// 日志记录信息
	protected String redirectUrl;// 跳转URL
	
	public String input() {
		return NONE;
	}
	
	public Admin getLoginAdmin(){
		Admin loginAdmin = (Admin)SecurityContextHolder.getContext()
			    .getAuthentication()
			    .getPrincipal();
		return adminService.get(loginAdmin.getId());
	}
	
	// 获取系统配置信息
	public Setting getSetting() {
		return SettingUtil.getSetting();
	}
	
	// 获取货币格式字符�?
	public String getCurrencyFormat() {
		return SettingUtil.getCurrencyFormat();
	}
	
	// 判断是否为添�?
	public Boolean getIsAddAction() {
		if (id == null) {
			return true;
		} else {
			return false;
		}
	}
	
	// 判断是否为编�?
	public Boolean getIsEditAction() {
		if (id != null) {
			return true;
		} else {
			return false;
		}
	}
	
	// 获取Request
	protected HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}

	// 获取Response
	protected HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}

	// 获取ServletContext
	protected ServletContext getServletContext() {
		return ServletActionContext.getServletContext();
	}

	// 获取Attribute
	protected Object getAttribute(String name) {
		return ServletActionContext.getRequest().getAttribute(name);
	}

	// 设置Attribute
	protected void setAttribute(String name, Object value) {
		ServletActionContext.getRequest().setAttribute(name, value);
	}

	// 获取Parameter
	protected String getParameter(String name) {
		return ServletActionContext.getRequest().getParameter(name);
	}

	// 获取Parameter数组
	protected String[] getParameterValues(String name) {
		return ServletActionContext.getRequest().getParameterValues(name);
	}

	// 获取Session
	protected Object getSession(String name) {
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		return session.get(name);
	}
	
	// 设置Session
	protected void setSession(String name, Object value) {
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		session.put(name, value);
	}

	// 移除Session
	protected void removeSession(String name) {
		ActionContext actionContext = ActionContext.getContext();
		Map<String, Object> session = actionContext.getSession();
		session.remove(name);
	}
	
	// 获取Cookie
	protected String getCookie(String name) {
		Cookie cookies[] = ServletActionContext.getRequest().getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (name.equals(cookie.getName())) {
					return cookie.getValue();
				}
			}
		}
		return null;
	}
	
	// 设置Cookie
	protected void setCookie(String name, String value) {
		Cookie cookie = new Cookie(name, value);
		cookie.setPath(ServletActionContext.getRequest().getContextPath() + "/");
 		ServletActionContext.getResponse().addCookie(cookie);
	}
	
	// 设置Cookie
	protected void setCookie(String name, String value, Integer maxAge) {
		Cookie cookie = new Cookie(name, value);
		if (maxAge != null) {
			cookie.setMaxAge(maxAge);
		}
		cookie.setPath(ServletActionContext.getRequest().getContextPath() + "/");
 		ServletActionContext.getResponse().addCookie(cookie);
	}

	// 移除Cookie
	protected void removeCookie(String name) {
		Cookie cookie = new Cookie(name, null);
		cookie.setMaxAge(0);
		cookie.setPath(ServletActionContext.getRequest().getContextPath() + "/");
		ServletActionContext.getResponse().addCookie(cookie);
	}

	// 获取真实路径
	protected String getRealPath(String path) {
		return ServletActionContext.getServletContext().getRealPath(path);
	}
	
	// 获取ContextPath
	protected String getContextPath() {
		return ServletActionContext.getRequest().getContextPath();
	}

	// AJAX输出
	protected String ajax(String content, String contentType) {
		try {
			HttpServletResponse response = initResponse(contentType);
			response.getWriter().write(content);
			response.getWriter().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return NONE;
	}

	// 根据文本内容输出AJAX
	protected String ajax(String text) {
		return ajax(text, HEADER_TEXT_CONTENT_TYPE);
	}
	
	// 根据操作状�?输出AJAX
	protected String ajax(Status status) {
		HttpServletResponse response = initResponse(HEADER_JSON_CONTENT_TYPE);
		try {
			Map<String, String> jsonMap = new HashMap<String, String>();
			jsonMap.put(STATUS_PARAMETER_NAME, status.toString());
			JsonUtil.getMapper().writeValue(response.getWriter(), jsonMap);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		return NONE;
	}
	
	// 根据操作状�?、消息内容输出AJAX
	protected String ajax(Status status, String message) {
		HttpServletResponse response = initResponse(HEADER_JSON_CONTENT_TYPE);
		try {
			Map<String, String> jsonMap = new HashMap<String, String>();
			jsonMap.put(STATUS_PARAMETER_NAME, status.toString());
			jsonMap.put(MESSAGE_PARAMETER_NAME, message);
			JsonUtil.getMapper().writeValue(response.getWriter(), jsonMap);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		return NONE;
	}
	
	// 根据Object输出AJAX
	protected String ajax(Object object) {
		HttpServletResponse response = initResponse(HEADER_JSON_CONTENT_TYPE);
		try {
			JsonUtil.getMapper().writeValue(response.getWriter(), object);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		return NONE;
	}
	
	// 根据boolean状�?输出AJAX
	protected String ajax(boolean booleanStatus) {
		HttpServletResponse response = initResponse(HEADER_JSON_CONTENT_TYPE);
		try {
			Map<String, Object> jsonMap = new HashMap<String, Object>();
			jsonMap.put(STATUS_PARAMETER_NAME, booleanStatus);
			JsonUtil.getMapper().writeValue(response.getWriter(), jsonMap);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		return NONE;
	}
	
	private HttpServletResponse initResponse(String contentType) {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType(contentType + ";charset=" + HEADER_ENCODING);
		if (HEADER_NO_CACHE) {
			response.setDateHeader("Expires", 1L);
			response.addHeader("Pragma", "no-cache");
			response.setHeader("Cache-Control", "no-cache, no-store, max-age=0");
		}
		return response;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long[] getIds() {
		return ids;
	}

	public void setIds(Long[] ids) {
		this.ids = ids;
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public String getLogInfo() {
		return logInfo;
	}

	public void setLogInfo(String logInfo) {
		this.logInfo = logInfo;
	}

	public String getRedirectUrl() {
		return redirectUrl;
	}

	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}

	public List<BusiStatus> getBusiStatusList() {
		return busiStatusList;
	}

	public static  void setBusiStatusList(List<BusiStatus> busiStatusList) {
		BaseAction.busiStatusList = busiStatusList;
	}

	public List<SmsStatus> getSmsStatusList() {
		return smsStatusList;
	}

	public static  void setSmsStatusList(List<SmsStatus> smsStatusList) {
		BaseAction.smsStatusList = smsStatusList;
	}

	public List<City> getCityList() {
		return cityList;
	}

	public static  void setCityList(List<City> cityList) {
		BaseAction.cityList = cityList;
	}

	public Map<String, BusiStatus> getBusiStatusMap() {
		return busiStatusMap;
	}

	public static  void setBusiStatusMap(Map<String, BusiStatus> busiStatusMap) {
		BaseAction.busiStatusMap = busiStatusMap;
	}

	public Map<String, SmsStatus> getSmsStatusMap() {
		return smsStatusMap;
	}

	public static  void setSmsStatusMap(Map<String, SmsStatus> smsStatusMap) {
		BaseAction.smsStatusMap = smsStatusMap;
	}

	public Map<Long, City> getCityMap() {
		return cityMap;
	}

	public static void setCityMap(Map<Long, City> cityMap) {
		BaseAction.cityMap = cityMap;
	}

	public  List<Grade> getGradeList() {
		return gradeList;
	}

	public static void setGradeList(List<Grade> gradeList) {
		BaseAction.gradeList = gradeList;
	}

	public  List<District> getDistrictList() {
		return districtList;
	}

	public static void setDistrictList(List<District> districtList) {
		BaseAction.districtList = districtList;
	}

	public static Map<Long, Grade> getGradeMap() {
		return gradeMap;
	}

	public static void setGradeMap(Map<Long, Grade> gradeMap) {
		BaseAction.gradeMap = gradeMap;
	}

	public static Map<Long, District> getDistrictMap() {
		return districtMap;
	}

	public static void setDistrictMap(Map<Long, District> districtMap) {
		BaseAction.districtMap = districtMap;
	}
	
}