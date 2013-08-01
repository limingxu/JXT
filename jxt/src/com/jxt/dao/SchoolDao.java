package com.jxt.dao;

import java.util.List;

import com.jxt.common.Pager;
import com.jxt.entity.Admin;
import com.jxt.entity.School;
public interface SchoolDao extends GenericDao<School,Long> {
	 Pager getAllSchoolByAdmin(Admin admin, Pager pager);

	 List<School> getAllSchool(Long cityId, Long districtId);
}
