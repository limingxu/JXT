package com.jxt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxt.dao.CityDao;
import com.jxt.entity.City;
import com.jxt.service.CityService;


@Service("cityServiceImpl")
public class CityServiceImpl extends BaseServiceImpl<City, Long> implements CityService {
	@Resource(name="cityDaoImpl") 
	CityDao cityDao;

	@Resource(name="cityDaoImpl") 
	public void setBaseDao(CityDao cityDao) {
		super.setBaseDao(cityDao);
	}
	
	@Transactional(readOnly=true)
	public List<City> getAll(){
		return cityDao.getAllJoinDistricts();
	}
}