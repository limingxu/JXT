package com.jxt.dao.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jxt.common.Pager;
import com.jxt.dao.ClassesDao;
import com.jxt.entity.Admin;
import com.jxt.entity.BaseEntity;
import com.jxt.entity.Classes;
import com.jxt.entity.School;
import com.jxt.hql.HqlParams;
import com.jxt.hql.HqlUtil;
import com.jxt.hql.Pagination;
import com.jxt.util.ObjectUtil;
import com.jxt.util.StringUtil;

@Repository(value="classesDaoImpl")
public class ClassesDaoImpl extends GenericDaoImpl<Classes,Long> implements ClassesDao {
	
	private static final String get_all_school_by_admin = "select c from Classes c,AdminSchool a where c.school.id =a.school.id and a.admin.id=:id and c.status=:status";
	
	@Override
	public Pager getAllClassedByAdmin(Admin admin, Pager pager) {
		String property = pager.getSearchBy();
		String value = pager.getKeyword();
		Map<String,Object> conditions = pager.getConditions();
		
		String hql = get_all_school_by_admin;
		
		HqlParams params = new HqlParams();
		params.add("id",admin.getId());
		params.add("status",BaseEntity.ACTIVE);
		
		if(conditions!=null && conditions.size()>0){
			Classes classes = (Classes) conditions.get("classes");
			
			if(!ObjectUtil.isEmpty(classes) && !ObjectUtil.isEmpty(classes.getSchool())	){
				School school =classes.getSchool();
				if(school.getCity() !=null && school.getCity().getId() !=null){
					hql +=" and c.school.city.id=:city_id  ";
					params.add("city_id",school.getCity().getId());
				}
				
				if(school.getDistrict() !=null && school.getDistrict().getId() != null){
					hql +=" and c.school.district.id=:district_id ";
					params.add("district_id",school.getDistrict().getId());
				}
				
				if(school.getName()!=null && school.getName().trim().length()>0){
					hql +=" and c.school.name =:school_name and status =1 ";
					params.add("school_name",school.getName());
				}
			}
		}
		
		if(property !=null && property.trim().length()>0){
			hql+= " and "+property+" like :key ";
		}
		
		params.add("key","%"+StringUtil.escapeMysqlLikeStr(value)+"%");
		String countHql = HqlUtil.generateCountHql(hql);
		
		Pagination<Classes> pagination =  getPagination(countHql, hql, params.getProperties(),pager.getPageNumber(), pager.getPageSize());
		
		return Pager.pagination2pager(pagination, pager);
	}

}
