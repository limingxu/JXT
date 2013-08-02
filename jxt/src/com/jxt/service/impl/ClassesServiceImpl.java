package com.jxt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxt.common.Pager;
import com.jxt.dao.ClassesDao;
import com.jxt.entity.Admin;
import com.jxt.entity.Classes;
import com.jxt.service.ClassesService;
import com.jxt.util.ValidateUtil;
@Service("classesServiceImpl")
public class ClassesServiceImpl extends BaseServiceImpl<Classes, Long> implements ClassesService {

	@Resource(name = "classesDaoImpl")
	private ClassesDao classesDao;
	
	@Resource(name = "classesDaoImpl")
	public void setBaseDao(ClassesDao classesDao) {
		super.setBaseDao(classesDao);
	}

	@Transactional
	public void saveClasses(Classes classes, Admin admin) {
		classesDao.save(classes);
	}

	@Transactional(readOnly=true)
	public Pager getAllClasses(Admin admin, Pager pager) {
		pager = classesDao.getAllClassedByAdmin(admin, pager);
		return pager;
	}
}
