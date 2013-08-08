package com.jxt.dao.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.jxt.common.Pager;
import com.jxt.dao.BusiOrderDao;
import com.jxt.entity.Admin;
import com.jxt.entity.BaseEntity;
import com.jxt.entity.BusiOrder;
import com.jxt.entity.Classes;
import com.jxt.entity.School;
import com.jxt.hql.HqlParams;
import com.jxt.hql.HqlUtil;
import com.jxt.hql.Pagination;
import com.jxt.util.ObjectUtil;
import com.jxt.util.StringUtil;

@Repository(value="busiOrderDaoImpl")
public class BusiOrderDaoImpl extends GenericDaoImpl<BusiOrder,Long> implements BusiOrderDao {
	private static final String get_all_school_by_admin = "select busiOrder from BusiOrder busiOrder,AdminSchool a where busiOrder.student.classes.school.id =a.school.id " +
			" and a.admin.id=:id and busiOrder.status=:status";
	
	@Override
	public Pager getAllBusiOrderByAdmin(Admin admin, Pager pager) {
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
				if(school !=null && school.getId() !=null){
					hql +=" and c.school.id=:school_id  ";
					params.add("school_id",school.getCity().getId());
				}
				
				if(school !=null && school.getDistrict().getId() != null){
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
		
		Pagination<BusiOrder> pagination =  getPagination(countHql, hql, params.getProperties(),pager.getPageNumber(), pager.getPageSize());
		
		return Pager.pagination2pager(pagination, pager);
	}

}
