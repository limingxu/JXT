package com.jxt.action.admin;

import javax.annotation.Resource;


import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.views.freemarker.FreemarkerManager;

import com.jxt.service.BusiOrderService;
import com.opensymphony.oscache.general.GeneralCacheAdministrator;

import freemarker.template.TemplateException;


@ParentPackage("admin")
public class CacheAction extends BaseAction {

	private static final long serialVersionUID = 3290111140770511789L;

	@Resource(name = "cacheServiceImpl")
	private BusiOrderService cacheService;
	@Resource(name = "cacheManager")
	private GeneralCacheAdministrator cacheManager;
	@Resource(name = "freemarkerManager")
	private FreemarkerManager freemarkerManager;
	
	// 刷新�?��缓存
	public String flush() {
		cacheManager.flushAll();
		cacheService.flushAllPageCache(getRequest());
		try {
			freemarkerManager.getConfiguration(getServletContext()).clearTemplateCache();
		} catch (TemplateException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

}