package com.jxt.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jxt.dao.SchoolDao;
import com.jxt.entity.Admin;
import com.jxt.entity.School;

/**
 * Coder AutoGenerator generate.
 *
 * @author Coder AutoGenerator by Xing,XiuDong
 * @date 2013-07-20 19:16:27
 */
@Repository(value="schoolDaoImpl")
public class SchoolDaoImpl extends GenericDaoImpl<School,Long> implements SchoolDao {

	@Override
	public List<School> getAllSchoolByAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return null;
	}

}
