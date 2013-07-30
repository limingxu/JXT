package com.jxt.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jxt.dao.BusiStatusDao;
import com.jxt.entity.BusiStatus;
import com.jxt.service.BusiStatusService;


@Service("busiStatusServiceImpl")
public class BusiStatusServiceImpl extends BaseServiceImpl<BusiStatus, Long> implements BusiStatusService {
	@Resource(name="busiStatusDaoImpl") 
	BusiStatusDao busiStatusDao;

	@Resource(name="busiStatusDaoImpl") 
	public void setBaseDao(BusiStatusDao busiStatusDao) {
		super.setBaseDao(busiStatusDao);
	} 
	
}