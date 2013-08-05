package com.jxt.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jxt.dao.StudentDao;
import com.jxt.entity.Student;
import com.jxt.service.StudentService;
@Service("studentServiceImpl")
public class StudentServiceImpl extends BaseServiceImpl<Student, Long> implements StudentService {

	@Resource(name = "studentDaoImpl")
	private StudentDao studentDao;
	
	@Resource(name = "studentDaoImpl")
	public void setBaseDao(StudentDao studentDao) {
		super.setBaseDao(studentDao);
	}

}
