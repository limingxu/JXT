package com.jxt.dao.impl;

import org.springframework.stereotype.Repository;

import com.jxt.dao.SmsDao;
import com.jxt.entity.Sms;

@Repository(value="smsInfoDaoImpl")
public class SmsDaoImpl extends GenericDaoImpl<Sms,Long> implements SmsDao {

}
