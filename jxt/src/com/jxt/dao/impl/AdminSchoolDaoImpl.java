package com.jxt.dao.impl;


import org.springframework.stereotype.Repository;

import com.jxt.dao.AdminSchoolDao;
import com.jxt.entity.AdminSchool;


@Repository("adminSchoolDaoImpl")
public class AdminSchoolDaoImpl extends GenericDaoImpl<AdminSchool, Long> implements AdminSchoolDao {
}