package com.jxt.dao;


import java.util.List;

import com.jxt.entity.City;

public interface CityDao extends GenericDao<City,Long> {
	public List<City> getAllJoinDistricts();
}
