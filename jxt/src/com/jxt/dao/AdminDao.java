package com.jxt.dao;

import com.jxt.entity.Admin;


public interface AdminDao extends GenericDao<Admin, Long> {
	
	/**
	 * 根据用户名判断此管理员是否存在（不区分大小写）
	 * 
	 */
	public boolean isExistByUsername(String username);
	
	/**
	 * 根据用户名获取管理员,若管理员不存在,则返回null（不区分大小写）
	 * 
	 */
	public Admin getAdminByUsername(String username);

}