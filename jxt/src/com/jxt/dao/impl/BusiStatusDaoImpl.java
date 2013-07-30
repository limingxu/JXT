package com.jxt.dao.impl;

import org.springframework.stereotype.Repository;

import com.jxt.dao.BusiStatusDao;
import com.jxt.entity.BusiStatus;

@Repository(value="busiStatusDaoImpl")
public class BusiStatusDaoImpl extends GenericDaoImpl<BusiStatus,Long> implements BusiStatusDao {
	
}
