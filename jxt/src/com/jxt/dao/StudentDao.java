package com.jxt.dao;


import com.jxt.entity.Student;

public interface StudentDao extends GenericDao<Student,Long> {

	Student checkStuIDNum(Student student);

}
