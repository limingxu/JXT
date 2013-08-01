package com.jxt.service;

import java.util.List;

import com.jxt.common.Pager;
import com.jxt.entity.Admin;
import com.jxt.entity.School;


public interface SchoolService extends BaseService<School, Long> {
	 void saveSchool(School school,Admin admin);
	 
	 Pager getAllSchools(Admin admin,Pager pager);

	 List<School> getAllSchools(Long cityId, Long districtId);
}



