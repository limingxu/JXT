package com.jxt.service;

import com.jxt.common.Pager;
import com.jxt.entity.Admin;
import com.jxt.entity.Classes;


public interface ClassesService extends BaseService<Classes, Long> {
	 void saveClasses(Classes classes,Admin admin);
	 
	 Pager getAllClasses(Admin admin,Pager pager);
}



