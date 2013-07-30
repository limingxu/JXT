package com.jxt.dao.impl;

import org.springframework.stereotype.Repository;

import com.jxt.dao.SmsOptHistoryDao;
import com.jxt.entity.SmsBatchHistory;

@Repository(value="smsOperationHistoryDaoImpl")
public class SmsBatchHistoryDaoImpl extends GenericDaoImpl<SmsBatchHistory,Long> implements SmsOptHistoryDao {

}
