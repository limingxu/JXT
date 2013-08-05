package com.jxt.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AdminType{
	public static final Map<String,String> adminTypes = new HashMap<String,String>();
	public static final String ROLE_SYS_ADMIN = "ROLE_SYS_ADMIN";
	public static final String ROLE_SYS_SERVER = "ROLE_SYS_SERVER";
	public static final String ROLE_UNION_SERVER = "ROLE_UNION_SERVER";
	public static final String ROLE_AGENT_ADMIN = "ROLE_AGENT_ADMIN";
	public static final String ROLE_AGENT_SERVER = "ROLE_AGENT_SERVER";
	public static final String ROLE_SCHOOL_ADMIN = "ROLE_SCHOOL_ADMIN";
	public static final String ROLE_TEACHER = "ROLE_TEACHER";
	public static final String ROLE_PARENT = "ROLE_PARENT";
	private String key;
	private String value;
	
	static{
		adminTypes.put(ROLE_SYS_ADMIN,"系统管理员");//系统管理员
		adminTypes.put(ROLE_SYS_SERVER,"系统客服");//系统客服
		adminTypes.put(ROLE_UNION_SERVER,"联通客服");//联通客服
		adminTypes.put(ROLE_AGENT_ADMIN,"代理商管理员");//代理商管理员
		adminTypes.put(ROLE_AGENT_SERVER,"代理商客服");//代理商客服
		adminTypes.put(ROLE_SCHOOL_ADMIN,"学校信息管理员");//学校信息管理员
		adminTypes.put(ROLE_TEACHER,"老师");//老师
	}
	
	public AdminType(String key,String Val){
		this.key=key;
		this.value=Val;
	}
	
	public static String getNameText(String key){
		return adminTypes.get(key);
	}
	
	public static boolean contains(String key){
		return adminTypes.containsKey(key);
	}
	
	public static List<AdminType> getCanAddAdminType(String loginAdminType){
		if(!adminTypes.containsKey(loginAdminType))
			return null;
		List<AdminType> types = new ArrayList<AdminType>();
		if(loginAdminType.equals(ROLE_SYS_ADMIN)){
			types.add(new AdminType(ROLE_SYS_SERVER,adminTypes.get(ROLE_SYS_SERVER)));
		}else if(loginAdminType.equals(ROLE_SYS_SERVER)){
			types.add(new AdminType(ROLE_UNION_SERVER,adminTypes.get(ROLE_UNION_SERVER)));
		}else if(loginAdminType.equals(ROLE_UNION_SERVER)){
			types.add(new AdminType(ROLE_AGENT_ADMIN,adminTypes.get(ROLE_AGENT_ADMIN)));
		}else if(loginAdminType.equals(ROLE_AGENT_ADMIN)){
			types.add(new AdminType(ROLE_AGENT_SERVER,adminTypes.get(ROLE_AGENT_SERVER)));
		}else if(loginAdminType.equals(ROLE_AGENT_SERVER)){
			types.add(new AdminType(ROLE_SCHOOL_ADMIN,adminTypes.get(ROLE_SCHOOL_ADMIN)));
		}else if(loginAdminType.equals(ROLE_SCHOOL_ADMIN)){
			types.add(new AdminType(ROLE_TEACHER,adminTypes.get(ROLE_TEACHER)));
		}else if(loginAdminType.equals(ROLE_TEACHER)){
			types.add(new AdminType(ROLE_PARENT,adminTypes.get(ROLE_PARENT)));
		}else {
			
		}
		return types;
	}
	
	public static boolean isCanAddAdminType(String loginAdminType,String addAdminType ){
		List<AdminType> types = getCanAddAdminType(loginAdminType);
		if(types==null|| types.size()==0)
			return false;
		boolean b = false;
		for(AdminType type : types){
			if(type.getKey().equals(addAdminType)){
				b = true;
				break;
			}
		}
		return b;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}


