package com.jxt.dao;


import com.jxt.common.Pager;
import com.jxt.entity.Admin;
import com.jxt.entity.BusiOrder;

public interface BusiOrderDao extends GenericDao<BusiOrder,Long> {

	Pager getAllBusiOrderByAdmin(Admin admin, Pager pager);

}
