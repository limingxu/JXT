package com.jxt.dao.impl;

import org.springframework.stereotype.Repository;

import com.jxt.dao.DistrictDao;
import com.jxt.entity.District;

@Repository(value="districtDaoImpl")
public class DistrictDaoImpl extends GenericDaoImpl<District,Long> implements DistrictDao {

}
