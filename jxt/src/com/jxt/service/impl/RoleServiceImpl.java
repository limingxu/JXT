package com.jxt.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jxt.dao.RoleDao;
import com.jxt.entity.Role;
import com.jxt.service.RoleService;


@Service("roleServiceImpl")
public class RoleServiceImpl extends BaseServiceImpl<Role, Long> implements RoleService {
	
	@Resource(name = "roleDaoImpl")
	RoleDao roleDao;

	@Resource(name = "roleDaoImpl")
	public void setBaseDao(RoleDao roleDao) {
		super.setBaseDao(roleDao);
	}

}