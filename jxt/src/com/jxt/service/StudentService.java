package com.jxt.service;

import com.jxt.entity.BusiOrder;
import com.jxt.entity.Student;


public interface StudentService extends BaseService<Student, Long> {
	boolean checkStuIDNum(Student student);

	void save(Student student, BusiOrder busiOrder);
}



