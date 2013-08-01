package com.jxt.dao;


import com.jxt.common.Pager;
import com.jxt.entity.Admin;
import com.jxt.entity.Classes;

public interface ClassesDao extends GenericDao<Classes,Long> {
	 Pager getAllClassedByAdmin(Admin admin, Pager pager);
}
