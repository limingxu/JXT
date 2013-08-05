package com.jxt.dao.impl;

import org.springframework.stereotype.Repository;

import com.jxt.dao.StudentDao;
import com.jxt.entity.BaseEntity;
import com.jxt.entity.Student;
import com.jxt.hql.HqlParams;

@Repository(value="studentDaoImpl")
public class StudentDaoImpl extends GenericDaoImpl<Student, Long> implements StudentDao {
	
	@Override
	public Student checkStuIDNum(Student student) {
		String hql=" select s from Student s where s.status=:status and s.stdNum=:stdNum and s.classes.id=:classesId";
		
		HqlParams params = new HqlParams();
		params.add("status",BaseEntity.ACTIVE);
		params.add("stdNum",student.getStdNum());
		params.add("classesId",student.getClasses().getId());
		
		return (Student) getUniqueResult(hql, params.getProperties());
	}

}
