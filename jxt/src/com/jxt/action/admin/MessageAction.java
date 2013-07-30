package com.jxt.action.admin;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.jxt.entity.Admin;


@ParentPackage("admin")
public class MessageAction extends BaseAction {

	private static final long serialVersionUID = -6296393115930477663L;
	
	private Admin admin;
	
	public String send(){
		return "send";
	}
	
	

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	
	
}