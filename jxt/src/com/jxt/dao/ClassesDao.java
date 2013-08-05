package com.jxt.dao;


import java.util.List;

import com.jxt.common.Pager;
import com.jxt.entity.Admin;
import com.jxt.entity.Classes;

public interface ClassesDao extends GenericDao<Classes,Long> {
	 Pager getAllClassedByAdmin(Admin admin, Pager pager);

	List<Classes> getAllClassedByAdmin(Admin admin);
}
