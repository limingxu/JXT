package com.jxt.dao;

import java.util.List;

import com.jxt.entity.City;
import com.jxt.entity.District;
public interface DistrictDao extends GenericDao<District,Long> {
	List<District> getAllDistricts(City city);
}
