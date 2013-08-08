package com.jxt.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxt.common.Pager;
import com.jxt.dao.BusiOrderDao;
import com.jxt.entity.Admin;
import com.jxt.entity.BusiOrder;
import com.jxt.service.BusiOrderService;

@Service(value="busiOrderServiceImpl")
public class BusiOrderServiceImpl extends BaseServiceImpl<BusiOrder, Long> implements BusiOrderService {
	@Resource(name="busiOrderDaoImpl")
	private BusiOrderDao busiOrderDao;
	
	@Resource(name="busiOrderDaoImpl") 
	public void setBaseDao(BusiOrderDao busiOrderDao) {
		// TODO Auto-generated method stub
		super.setBaseDao(busiOrderDao);
	}

	@Transactional(readOnly=true)
	public Pager getAllBusiOrders(Admin admin, Pager pager) {
		return busiOrderDao.getAllBusiOrderByAdmin(admin,pager);
	}
}
