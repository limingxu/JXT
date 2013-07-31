package com.jxt.dao.impl;

import java.util.List;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Repository;

import com.jxt.dao.CityDao;
import com.jxt.entity.City;

@Repository(value="cityDaoImpl")
public class CityDaoImpl extends GenericDaoImpl<City,Long> implements CityDao {

	@Override
	public List<City> getAllJoinDistricts() {
		List<City> citys = getAll();
		if(citys==null || citys.size()==0)
			return citys;
		for(City city : citys){
			Hibernate.initialize(city);
		}
		return citys;
	}
}
