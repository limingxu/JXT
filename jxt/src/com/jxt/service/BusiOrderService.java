package com.jxt.service;

import com.jxt.common.Pager;
import com.jxt.entity.Admin;

public interface BusiOrderService {
	Pager getAllBusiOrders(Admin admin,Pager pager);
}