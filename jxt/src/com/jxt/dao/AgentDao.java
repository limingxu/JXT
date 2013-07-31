package com.jxt.dao;


import com.jxt.entity.Admin;
import com.jxt.entity.Agent;


public interface AgentDao extends GenericDao<Agent,Long> {
	Agent getAgentByAdmin(Admin admin);
}
