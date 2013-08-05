package com.jxt.dao.impl;

import org.springframework.stereotype.Repository;

import com.jxt.dao.StudentDao;
import com.jxt.entity.Student;

@Repository(value="studentDaoImpl")
public class StudentDaoImpl extends GenericDaoImpl<Student, Long> implements StudentDao {

}
