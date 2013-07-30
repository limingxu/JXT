package com.jxt.dao;

import java.util.List;

import com.jxt.entity.Admin;
import com.jxt.entity.School;
public interface SchoolDao extends GenericDao<School,Long> {
	public List<School> getAllSchoolByAdmin(Admin admin);
}
