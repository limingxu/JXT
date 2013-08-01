package com.jxt.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jxt.common.Pager;
import com.jxt.dao.SchoolDao;
import com.jxt.entity.Admin;
import com.jxt.entity.BaseEntity;
import com.jxt.entity.School;
import com.jxt.hql.HqlParams;
import com.jxt.hql.HqlUtil;
import com.jxt.hql.Pagination;
import com.jxt.util.StringUtil;


@Repository(value="schoolDaoImpl")
public class SchoolDaoImpl extends GenericDaoImpl<School,Long> implements SchoolDao {
	
	private static final String get_all_school_by_admin = " select s from School s , AdminSchool a where a.school.id=s.id and a.admin.id=:id and s.status=:status";
	
	
	@Override
	public Pager getAllSchoolByAdmin(Admin admin,Pager pager) {
		
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
		
		Pagination<School> pagination =  getPagination(countHql, hql, params.getProperties(),pager.getPageNumber(), pager.getPageSize());
		
		return Pager.pagination2pager(pagination, pager);
	}


	@Override
	public List<School> getAllSchool(Long cityId, Long districtId) {
		String hql = "select s from School s where s.city.id=:cityid and s.district.id=:disid and status=:status";
		HqlParams params = new HqlParams();
		params.add("cityid",cityId);
		params.add("disid",districtId);
		params.add("status",BaseEntity.ACTIVE);
		
		List<School> schoolList=findByHql(hql, params.getProperties());
		return schoolList;
		
	}
	
}
