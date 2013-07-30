package com.jxt.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jxt.dao.CityDao;
import com.jxt.entity.City;
import com.jxt.hql.Hqls;

@Repository(value="cityDaoImpl")
public class CityDaoImpl extends GenericDaoImpl<City,Long> implements CityDao {

	@Override
	public List<City> getAllJoinDistricts() {
		String hql = Hqls.CityHqls.all_join_district;
		List<City> citys = findByHql(hql,null);
		return citys;
	}
}
