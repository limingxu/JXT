package com.jxt.dao.impl;

import org.springframework.stereotype.Repository;

import com.jxt.common.Pager;
import com.jxt.dao.ClassesDao;
import com.jxt.entity.Admin;
import com.jxt.entity.BaseEntity;
import com.jxt.entity.Classes;
import com.jxt.hql.HqlParams;
import com.jxt.hql.HqlUtil;
import com.jxt.hql.Pagination;
import com.jxt.util.StringUtil;

@Repository(value="classesDaoImpl")
public class ClassesDaoImpl extends GenericDaoImpl<Classes,Long> implements ClassesDao {
	
	private static final String get_all_school_by_admin = 
		" select s from Classes c,AdminSchool a where c.school.id =a.school.id and a.admin.id=:id and s.status=:status";
	
	@Override
	public Pager getAllClassedByAdmin(Admin admin, Pager pager) {
		String property = pager.getSearchBy();
		String value = pager.getKeyword();
		String hql = "";
		if(property==null || property.trim().equals("")){
			hql = get_all_school_by_admin;
		}else{
			hql=get_all_school_by_admin+ " and "+property+" like :key";
		}
		HqlParams params = new HqlParams();
		params.add("id",admin.getId());
		params.add("status",BaseEntity.ACTIVE);
		params.add("key","%"+StringUtil.escapeMysqlLikeStr(value)+"%");
		String countHql = HqlUtil.generateCountHql(hql);
		
		Pagination<Classes> pagination =  getPagination(countHql, hql, params.getProperties(),pager.getPageNumber(), pager.getPageSize());
		
		return Pager.pagination2pager(pagination, pager);
	}

}
