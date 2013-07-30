package com.jxt.service.impl;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxt.dao.AdminDao;
import com.jxt.dao.RoleDao;
import com.jxt.entity.Admin;
import com.jxt.entity.Role;
import com.jxt.service.AdminService;
import com.jxt.util.DecryptUtil;


@Service("adminServiceImpl")
public class AdminServiceImpl extends BaseServiceImpl<Admin, Long> implements AdminService {

	@Resource(name = "adminDaoImpl")
	private AdminDao adminDao;
	
	@Resource(name = "roleDaoImpl")
	private RoleDao roleDao;
	
	@Resource(name = "adminDaoImpl")
	public void setBaseDao(AdminDao adminDao) {
		super.setBaseDao(adminDao);
	}
	
	@Transactional(readOnly = true)
	public boolean isExistByUsername(String username) {
		return adminDao.isExistByUsername(username);
	}
	
	@Transactional(readOnly = true)
	public Admin getAdminByUsername(String username) {
		return adminDao.getAdminByUsername(username);
	}

	@Override
	@Transactional
	public void saveAdmin(Admin admin) {
		admin.setUsername(admin.getUsername());
		Set<Role> roleList = new HashSet<Role>();
		Long roleId = Role.roleTypes.get(admin.getRoleType());
		Role role = roleDao.get(roleId);
		roleList.add(role);
		admin.setRoleSet(roleList);
		String passwordDes =  DecryptUtil.getInstance().encrypt(admin.getPassword());
		admin.setPassword(passwordDes);
		adminDao.save(admin);
	}

	@Override
	public boolean canOperateAdmin(Long loginAdminId, Long adminId) {
		Admin loginAdmin = adminDao.get(loginAdminId);
		Set<Admin> childern = loginAdmin.getChildern();
		if(childern==null || childern.size()==0)
			return false;
		for(Admin admin : childern){
			if(admin.getId().equals(adminId)){
				return true;
			}
		}
		return false;
	}
}