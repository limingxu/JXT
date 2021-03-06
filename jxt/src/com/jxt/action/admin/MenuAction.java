package com.jxt.action.admin;

import org.apache.struts2.convention.annotation.ParentPackage;


@ParentPackage("admin")
public class MenuAction extends BaseAction {

	private static final long serialVersionUID = 6465259795235263493L;

	// 商店配置
	public String setting() {
		return "setting";
	}
	
	// 会员
	public String member() {
		return "member";
	}
	
	// 商品
	public String goods() {
		return "goods";
	}
	
	// 页面管理
	public String content() {
		return "content";
	}
	
	// 订单管理
	public String order() {
		return "order";
	}
	
	// 管理�?
	public String admin() {
		return "admin";
	}

	// 主体
	public String main() {
		return "main";
	}

	// 头部
	public String header() {
		return "header";
	}

}