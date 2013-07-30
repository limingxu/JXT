package com.jxt.dao.impl;


import org.springframework.stereotype.Repository;

import com.jxt.dao.RoleDao;
import com.jxt.entity.Role;


@Repository("roleDaoImpl")
public class RoleDaoImpl extends GenericDaoImpl<Role, Long> implements RoleDao {

	// 忽略isSystem=true的对象
	@Override
	public void delete(Role role) {
		if (role.getIsSystem()) {
			return;
		}
		super.delete(role);
	}

	// 忽略isSystem=true的对象
	@Override
	public void delete(Long id) {
		Role role = load(id);
		this.delete(role);
	}

	// 忽略isSystem=true的对象
	@Override
	public void delete(Long[] ids) {
		if (ids != null && ids.length > 0) {
			for (Long id : ids) {
				this.delete(id);
			}
		}
	}

	// 设置isSystem=false
	@Override
	public Long save(Role role) {
		role.setIsSystem(false);
		return super.save(role);
	}

	// 忽略isSystem=true的对象
	@Override
	public void update(Role role) {
		if (role.getIsSystem()) {
			return;
		}
		super.update(role);
	}

}