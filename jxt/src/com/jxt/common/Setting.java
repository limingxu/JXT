package com.jxt.common;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.jxt.entity.BusiStatus;
import com.jxt.entity.City;
import com.jxt.entity.District;
import com.jxt.entity.SmsStatus;
import com.jxt.util.CommonUtil;


public class Setting {
	
	// 货币种类(人民币、美元、欧元、英磅、加拿大元、澳元、卢布、港币、新台币、韩元、新加坡元、新西兰元、日元、马元、瑞士法郎、瑞典克朗、丹麦克朗、兹罗提、挪威克朗、福林、捷克克朗、葡币)
	public enum CurrencyType {
		CNY, USD, EUR, GBP, CAD, AUD, RUB, HKD, TWD, KRW, SGD, NZD, JPY, MYR, CHF, SEK, DKK, PLZ, NOK, HUF, CSK, MOP
	};
	
	// 小数位精确方式(四舍五入、向上取整、向下取整)
	public enum RoundType {
		roundHalfUp, roundUp, roundDown
	}
	
	// 运算符(加、减、乘、除)
	public enum Operator {
		add, subtract, multiply, divide
	}

	public static final String HOT_SEARCH_SEPARATOR = ",";// 热门搜索分隔符

	private String systemName;// 系统名称
	private String systemVersion;// 系统版本
	private String systemDescription;// 系统描述
	private String contextPath;// 虚拟路径
	private String imageUploadPath;// 图片上传路径
	private String imageBrowsePath;// 图片浏览路径
	private String adminLoginUrl;// 后台登录URL
	private String adminLoginProcessingUrl;// 后台登录处理URL
	private CurrencyType currencyType;// 货币种类
	private String currencySign;// 货币符号
	private String currencyUnit;// 货币单位
	private Integer priceScale;// 价格精确位数
	private RoundType priceRoundType;// 价格精确方式
	private Boolean isLoginFailureLock; // 是否开启登录失败锁定账号功能
	private Integer loginFailureLockCount;// 同一账号允许连续登录失败的最大次数,超出次数后将锁定其账号
	private Integer loginFailureLockTime;// 账号锁定时间(单位: 分钟,0表示永久锁定)
	private Boolean isGzipEnabled;// 是否开启GZIP功能
	
	private  List<City> cityList;
	private  List<District> districtList;
	private  List<BusiStatus> busiStatusList ;
	private  List<SmsStatus> smsStatusList ;
	
	public String getSystemName() {
		return systemName;
	}

	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}

	public String getSystemVersion() {
		return systemVersion;
	}

	public void setSystemVersion(String systemVersion) {
		this.systemVersion = systemVersion;
	}

	public String getSystemDescription() {
		return systemDescription;
	}

	public void setSystemDescription(String systemDescription) {
		this.systemDescription = systemDescription;
	}

	public String getContextPath() {
		return contextPath;
	}

	public void setContextPath(String contextPath) {
		this.contextPath = contextPath;
	}

	public String getImageUploadPath() {
		return imageUploadPath;
	}

	public void setImageUploadPath(String imageUploadPath) {
		this.imageUploadPath = StringUtils.removeEnd(imageUploadPath, "/");
	}
	
	public String getImageBrowsePath() {
		return imageBrowsePath;
	}

	public void setImageBrowsePath(String imageBrowsePath) {
		this.imageBrowsePath = StringUtils.removeEnd(imageBrowsePath, "/");
	}

	public String getAdminLoginUrl() {
		return adminLoginUrl;
	}

	public void setAdminLoginUrl(String adminLoginUrl) {
		this.adminLoginUrl = adminLoginUrl;
	}

	public String getAdminLoginProcessingUrl() {
		return adminLoginProcessingUrl;
	}

	public void setAdminLoginProcessingUrl(String adminLoginProcessingUrl) {
		this.adminLoginProcessingUrl = adminLoginProcessingUrl;
	}


	public CurrencyType getCurrencyType() {
		return currencyType;
	}

	public void setCurrencyType(CurrencyType currencyType) {
		this.currencyType = currencyType;
	}

	public String getCurrencySign() {
		return currencySign;
	}

	public void setCurrencySign(String currencySign) {
		this.currencySign = currencySign;
	}

	public String getCurrencyUnit() {
		return currencyUnit;
	}

	public void setCurrencyUnit(String currencyUnit) {
		this.currencyUnit = currencyUnit;
	}

	public Integer getPriceScale() {
		return priceScale;
	}

	public void setPriceScale(Integer priceScale) {
		this.priceScale = priceScale;
	}

	public RoundType getPriceRoundType() {
		return priceRoundType;
	}

	public void setPriceRoundType(RoundType priceRoundType) {
		this.priceRoundType = priceRoundType;
	}

	public Boolean getIsLoginFailureLock() {
		return isLoginFailureLock;
	}

	public void setIsLoginFailureLock(Boolean isLoginFailureLock) {
		this.isLoginFailureLock = isLoginFailureLock;
	}

	public Integer getLoginFailureLockCount() {
		return loginFailureLockCount;
	}

	public void setLoginFailureLockCount(Integer loginFailureLockCount) {
		this.loginFailureLockCount = loginFailureLockCount;
	}

	public Integer getLoginFailureLockTime() {
		return loginFailureLockTime;
	}

	public void setLoginFailureLockTime(Integer loginFailureLockTime) {
		this.loginFailureLockTime = loginFailureLockTime;
	}


	public Boolean getIsGzipEnabled() {
		return isGzipEnabled;
	}

	public void setIsGzipEnabled(Boolean isGzipEnabled) {
		this.isGzipEnabled = isGzipEnabled;
	}

	// 获取图片上传真实路径
	public String getImageUploadRealPath() {
		return CommonUtil.getPreparedStatementPath(imageUploadPath);
	}

	public List<City> getCityList() {
		return cityList;
	}

	public List<District> getDistrictList() {
		return districtList;
	}

	public List<BusiStatus> getBusiStatusList() {
		return busiStatusList;
	}

	public List<SmsStatus> getSmsStatusList() {
		return smsStatusList;
	}
}