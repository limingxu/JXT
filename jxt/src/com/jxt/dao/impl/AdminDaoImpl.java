package com.jxt.dao.impl;


import org.springframework.stereotype.Repository;

import com.jxt.common.Pager;
import com.jxt.dao.AdminDao;
import com.jxt.entity.Admin;
import com.jxt.hql.HqlParams;
import com.jxt.hql.HqlUtil;
import com.jxt.hql.Hqls;
import com.jxt.hql.Pagination;
import com.jxt.util.StringUtil;


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

	@Override
	public Pager getAdminByParentAdminId(Long adminId,Pager pager) {
		String property = pager.getSearchBy();
		String value = pager.getKeyword();
		String hql = "";
		if(property==null || property.trim().equals("")){
			hql = "select a from Admin a where a.parent.id=:id";
		}else{
			hql = "select a from Admin a where a."+property+" like :key and "+" a.parent.id=:id";
		}
		HqlParams params = new HqlParams();
		params.add("id",adminId);
		params.add("key","%"+StringUtil.escapeMysqlLikeStr(value)+"%");
		String countHql = HqlUtil.generateCountHql(hql);
		Pagination<Admin> pagination =  getPagination(countHql, hql, params.getProperties(),pager.getPageNumber(), pager.getPageSize());
		return Pager.pagination2pager(pagination, pager);
	}
}