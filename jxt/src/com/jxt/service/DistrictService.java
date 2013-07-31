package com.jxt.service;

import java.util.List;

import com.jxt.entity.City;
import com.jxt.entity.District;

public interface DistrictService extends BaseService<District, Long> {
	List<District> getAllDistricts(City city);
	
}
