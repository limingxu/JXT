package com.jxt.dao.impl;

import org.springframework.stereotype.Repository;

import com.jxt.dao.GradeDao;
import com.jxt.entity.Grade;

@Repository(value="gradeDaoImpl")
public class GradeDaoImpl extends GenericDaoImpl<Grade,Long> implements GradeDao {

}
