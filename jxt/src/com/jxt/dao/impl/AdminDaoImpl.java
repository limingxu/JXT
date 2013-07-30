package com.jxt.dao.impl;


import org.springframework.stereotype.Repository;

import com.jxt.dao.AdminDao;
import com.jxt.entity.Admin;
import com.jxt.hql.HqlParams;
import com.jxt.hql.Hqls;


@Repository("adminDaoImpl")
public class AdminDaoImpl extends GenericDaoImpl<Admin, Long> implements AdminDao {
	
	public boolean isExistByUsername(String username) {
		String hql = Hqls.AdminHqls.check_unique_username;
		HqlParams params = new HqlParams();
		params.add("username", username);
		Admin admin = (Admin)getUniqueResult(hql,params.getProperties());
		return admin!=null;
	}
	
	public Admin getAdminByUsername(String username) {
		String hql = Hqls.AdminHqls.get_login_admin_by_username;
		HqlParams params = new HqlParams();
		params.add("username", username);
		Admin admin = (Admin)getUniqueResult(hql,params.getProperties());
		return admin;
	}
}