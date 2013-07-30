package com.jxt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jxt.common.Pager;
import com.jxt.dao.SchoolDao;
import com.jxt.entity.Admin;
import com.jxt.entity.School;
import com.jxt.service.SchoolService;
@Service("schoolServiceImpl")
public class SchoolServiceImpl extends BaseServiceImpl<School, Long> implements SchoolService {

	@Resource(name = "schoolDaoImpl")
	private SchoolDao schoolDao;
	
	@Resource(name = "schoolDaoImpl")
	public void setBaseDao(SchoolDao schoolDao) {
		super.setBaseDao(schoolDao);
	}
	
	public void getAllSchoolListByAdmin(Admin admin,Pager pager){
		List<School> schoolList = schoolDao.getAllSchoolByAdmin(admin);
		pager.setResult(schoolList);
		pager.setTotalCount(schoolList.size());
	}
	
	
}
