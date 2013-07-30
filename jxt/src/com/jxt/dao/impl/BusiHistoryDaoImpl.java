package com.jxt.dao.impl;

import org.springframework.stereotype.Repository;

import com.jxt.dao.ChargeHistoryDao;
import com.jxt.entity.BusiHistory;

@Repository(value="chargeHistoryDaoImpl")
public class BusiHistoryDaoImpl extends GenericDaoImpl<BusiHistory,Long> implements ChargeHistoryDao {

}
