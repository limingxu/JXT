package com.jxt.dao.impl;

import org.springframework.stereotype.Repository;

import com.jxt.dao.SmsStatusDao;
import com.jxt.entity.SmsStatus;

@Repository(value="smsStatusDaoImpl")
public class SmsStatusDaoImpl extends GenericDaoImpl<SmsStatus,Long> implements SmsStatusDao {

}
