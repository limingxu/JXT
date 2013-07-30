package com.jxt.action.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.jxt.entity.Admin;
import com.jxt.entity.Agent;
import com.jxt.entity.BusiStatus;
import com.jxt.entity.City;
import com.jxt.entity.District;
import com.jxt.entity.School;
import com.jxt.entity.SmsStatus;
import com.jxt.service.SchoolService;
import com.jxt.util.SettingUtil;
import com.opensymphony.oscache.general.GeneralCacheAdministrator;


@ParentPackage("admin")
public class SchoolAction extends BaseAction {

	private static final long serialVersionUID = -6296393115930477663L;
	
	private Admin admin;
	
	private School school;
	
	private Agent agent;
	
	@Resource(name = "schoolServiceImpl")
	private SchoolService schoolService;
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	// 列表
	public String list() {
		admin = this.getLoginAdmin();
		
		if(admin ==null ){
			return ERROR;
		}
		this.setAttribute("admin",admin);
		logger.info("登陆用户角色："+admin.getRoleType());
		
		return LIST;
	}
	
	public String save() {
		admin = this.getLoginAdmin();
		agent = admin.getAgent();
		//pager = adminService.pagerByPropertyLike(pager);
		
		return INPUT;
	}
	
	public String edit() {
		admin = this.getLoginAdmin();
		//pager = adminService.pagerByPropertyLike(pager);
		return INPUT;
	}
	
	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public School getSchool() {
		return school;
	}

	public void setSchool(School school) {
		this.school = school;
	}
	
}