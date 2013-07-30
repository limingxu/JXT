package com.jxt.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jxt.dao.SmsStatusDao;
import com.jxt.entity.SmsStatus;
import com.jxt.service.SmsStatusService;


@Service("smsStatusServiceImpl")
public class SmsStatusServiceImpl extends BaseServiceImpl<SmsStatus, Long> implements SmsStatusService {
	@Resource(name="smsStatusDaoImpl") 
	SmsStatusDao smsStatusDao;

	@Resource(name="smsStatusDaoImpl") 
	public void setBaseDao(SmsStatusDao smsStatusDao) {
		super.setBaseDao(smsStatusDao);
	}
	
}