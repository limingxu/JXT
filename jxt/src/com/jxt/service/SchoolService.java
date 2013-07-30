package com.jxt.service;

import com.jxt.entity.Admin;
import com.jxt.entity.School;


public interface SchoolService extends BaseService<School, Long> {
	public void saveSchool(School school,Admin admin);
}



