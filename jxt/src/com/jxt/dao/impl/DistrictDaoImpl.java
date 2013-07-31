
package com.jxt.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jxt.dao.DistrictDao;
import com.jxt.entity.City;
import com.jxt.entity.District;
import com.jxt.hql.HqlParams;
import com.jxt.hql.Param;

@Repository(value="districtDaoImpl")
public class DistrictDaoImpl extends GenericDaoImpl<District,Long> implements DistrictDao {

	@Override
	public List<District> getAllDistricts(City city) {
		String hql =" from District d where d.city.id = :cid";
		
		HqlParams hqlParams = new HqlParams();
		hqlParams.add(new Param("cid", city.getId()));
		
		List<District> districtList = super.findByHql(hql,hqlParams.getProperties());
		
		return districtList;
	}
}
