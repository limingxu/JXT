package com.jxt.dao.impl;


import org.springframework.stereotype.Repository;

import com.jxt.dao.AgentDao;
import com.jxt.entity.Admin;
import com.jxt.entity.Agent;
import com.jxt.hql.HqlParams;
import com.jxt.hql.Hqls;


@Repository("agentDaoImpl")
public class AgentDaoImpl extends GenericDaoImpl<Agent, Long> implements AgentDao {

	@Override
	public Agent getAgentByAdmin(Admin admin) {
		String hql = Hqls.AdminHqls.check_unique_username;
		HqlParams params = new HqlParams();
		params.add("id", admin.getId());
		Agent agent = (Agent)getUniqueResult(hql,params.getProperties());
		return agent;
	}
	
}