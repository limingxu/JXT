package com.jxt.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxt.dao.AgentDao;
import com.jxt.entity.Admin;
import com.jxt.entity.Agent;
import com.jxt.service.AgentService;


@Service("agentServiceImpl")
public class AgentServiceImpl extends BaseServiceImpl<Agent, Long> implements AgentService {

	@Resource(name = "agentDaoImpl")
	private AgentDao agentDao;
	
	@Resource(name = "agentDaoImpl")
	public void setBaseDao(AgentDao agentDao) {
		super.setBaseDao(agentDao);
	}
	
}
