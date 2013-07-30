package com.jxt.dao.impl;

import org.springframework.stereotype.Repository;

import com.jxt.dao.ClassesDao;
import com.jxt.entity.Classes;

@Repository(value="classDaoImpl")
public class ClassesDaoImpl extends GenericDaoImpl<Classes,Long> implements ClassesDao {

}
