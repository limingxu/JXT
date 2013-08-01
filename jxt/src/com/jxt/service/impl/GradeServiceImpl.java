package com.jxt.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jxt.dao.GradeDao;
import com.jxt.entity.Grade;
import com.jxt.service.GradeService;
@Service("gradeServiceImpl")
public class GradeServiceImpl extends BaseServiceImpl<Grade, Long> implements GradeService {

	@Resource(name = "gradeDaoImpl")
	private GradeDao gradeDao;
	
	@Resource(name = "gradeDaoImpl")
	public void setBaseDao(GradeDao gradeDao) {
		super.setBaseDao(gradeDao);
	}
}
