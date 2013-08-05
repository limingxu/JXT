package com.jxt.dao.impl;

import org.springframework.stereotype.Repository;

import com.jxt.dao.BusiOrderDao;
import com.jxt.entity.BusiOrder;

@Repository(value="busiOrderDaoImpl")
public class BusiOrderDaoImpl extends GenericDaoImpl<BusiOrder,Long> implements BusiOrderDao {

}
