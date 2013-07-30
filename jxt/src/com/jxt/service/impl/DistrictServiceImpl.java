package com.jxt.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jxt.dao.DistrictDao;
import com.jxt.entity.District;
import com.jxt.service.DistrictService;


@Service("districtServiceImpl")
public class DistrictServiceImpl extends BaseServiceImpl<District, Long> implements DistrictService {
	@Resource(name="districtDaoImpl") 
	DistrictDao districtDao;

	@Resource(name="districtDaoImpl") 
	public void setBaseDao(DistrictDao districtDao) {
		super.setBaseDao(districtDao);
	}
	
	
	
}