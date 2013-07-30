package com.jxt.common;

import javax.servlet.ServletContext;

import com.jxt.directive.CheckboxDirective;
import com.jxt.directive.PaginationDirective;
import com.jxt.directive.SubstringMethod;
import com.jxt.util.SpringUtil;

import freemarker.ext.beans.BeansWrapper;
import freemarker.template.TemplateException;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateModelException;

public class FreemarkerManager extends org.apache.struts2.views.freemarker.FreemarkerManager {

	public synchronized freemarker.template.Configuration getConfiguration(ServletContext servletContext) throws TemplateException {
		freemarker.template.Configuration config = (freemarker.template.Configuration) servletContext.getAttribute(CONFIG_SERVLET_CONTEXT_KEY);
		if (config == null) {
			config = createConfiguration(servletContext);
			// config.setTemplateExceptionHandler(TemplateExceptionHandler.IGNORE_HANDLER);
			
			SubstringMethod substringMethod = (SubstringMethod) SpringUtil.getBean("substringMethod");
			CheckboxDirective checkboxDirective = (CheckboxDirective) SpringUtil.getBean("checkboxDirective");
			PaginationDirective paginationDirective = (PaginationDirective) SpringUtil.getBean("paginationDirective");
			
			config.setSharedVariable(SubstringMethod.TAG_NAME, substringMethod);
			config.setSharedVariable(CheckboxDirective.TAG_NAME, checkboxDirective);
			config.setSharedVariable(PaginationDirective.TAG_NAME, paginationDirective);
			
			servletContext.setAttribute(CONFIG_SERVLET_CONTEXT_KEY, config);
		}
		
		config.setWhitespaceStripping(true);
		return config;
	}
	
	public void loadSettings(ServletContext servletContext, freemarker.template.Configuration configuration) {
		super.loadSettings(servletContext, configuration);

		try {
			BeansWrapper wrapper = BeansWrapper.getDefaultInstance();
			TemplateHashModel staticModels = wrapper.getStaticModels();
			TemplateHashModel configkeys = (TemplateHashModel) staticModels.get("com.jxt.common.ConfigKeys");
			TemplateHashModel htmlUtil = (TemplateHashModel) staticModels.get("com.jxt.util.HtmlUtil");
			TemplateHashModel adminTypes = (TemplateHashModel) staticModels.get("com.jxt.common.AdminType");
			
			// System keys
			configuration.setSharedVariable("htmlUtil", htmlUtil);
			configuration.setSharedVariable("ckey", configkeys);
			configuration.setSharedVariable("adminTypes", adminTypes);
			
			// Domain constant
			//configuration.setSharedVariable("SysAds", sysAds);
		} catch (TemplateModelException e) {
			e.printStackTrace();
		}
	}
}