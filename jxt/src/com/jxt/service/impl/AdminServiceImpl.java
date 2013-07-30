package com.jxt.service.impl;

import javax.annotation.Resource;

import org.springframework.security.Authentication;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxt.dao.AdminDao;
import com.jxt.dao.RoleDao;
import com.jxt.entity.Admin;
import com.jxt.service.AdminService;


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
	
	/**
	@Override
	@Transactional
	public Admin saveShoper(Admin admin, Shop shop) {
		admin.setIsShopkeeper(true);
		admin.setUsername(admin.getUsername().toLowerCase());
		admin.setLoginFailureCount(0);
		admin.setIsAccountLocked(false);
		admin.setIsAccountExpired(false);
		admin.setIsCredentialsExpired(false);
		admin.setPassword(DigestUtils.md5Hex(admin.getPassword()));
		shop.setStatus(Shop.SHOP_STATUS_UNUSABLE);
		shopDao.save(shop);
		admin.setShop(shop);
		List<Role> roleList = new ArrayList<Role>();
		Role role = roleDao.get(Role.ROLE_SHOPER_ID);
		roleList.add(role);
		admin.setRoleSet(new HashSet<Role>(roleList));
		adminDao.save(admin);
		return admin;
	}
	*/
}