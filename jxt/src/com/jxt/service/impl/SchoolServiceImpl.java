package com.jxt.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxt.common.Pager;
import com.jxt.dao.AdminSchoolDao;
import com.jxt.dao.SchoolDao;
import com.jxt.entity.Admin;
import com.jxt.entity.AdminSchool;
import com.jxt.entity.School;
import com.jxt.service.SchoolService;
@Service("schoolServiceImpl")
public class SchoolServiceImpl extends BaseServiceImpl<School, Long> implements SchoolService {

	@Resource(name = "schoolDaoImpl")
	private SchoolDao schoolDao;
	
	@Resource(name="adminSchoolDaoImpl")
	private AdminSchoolDao adminSchoolDao;
	
	@Resource(name = "schoolDaoImpl")
	public void setBaseDao(SchoolDao schoolDao) {
		super.setBaseDao(schoolDao);
	}

	@Transactional
	public void saveSchool(School school, Admin admin) {
		schoolDao.save(school);
		
		AdminSchool adminSchool = new AdminSchool();
		adminSchool.setAdmin(admin);
		adminSchool.setSchool(school);
		
		adminSchoolDao.save(adminSchool);
	}

	@Override
	public Pager getAllSchools(Admin admin, Pager pager) {
		 pager = schoolDao.getAllSchoolByAdmin(admin,pager);
		return pager;
	}
}
