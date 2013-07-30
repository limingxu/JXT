package com.jxt.service.impl;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.security.GrantedAuthority;
import org.springframework.security.GrantedAuthorityImpl;
import org.springframework.security.userdetails.UserDetailsService;
import org.springframework.security.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxt.dao.AdminDao;
import com.jxt.entity.Admin;
import com.jxt.entity.Role;


@Service("adminDetailsServiceImpl")
public class AdminDetailsServiceImpl implements UserDetailsService {

	@Resource(name = "adminDaoImpl")
	private AdminDao adminDao;

	@Transactional
	public Admin loadUserByUsername(String username) throws UsernameNotFoundException, DataAccessException {
		Admin admin = adminDao.getAdminByUsername(username);
		if (admin == null) {
			throw new UsernameNotFoundException("管理员[" + username + "]不存在!");
		}
		//Setting setting = SettingUtil.getSetting();
		admin.setAuthorities(getGrantedAuthorities(admin));
		return admin;
	}

	private GrantedAuthority[] getGrantedAuthorities(Admin admin) {
		Set<GrantedAuthority> grantedAuthorities = new HashSet<GrantedAuthority>();
		for (Role role : admin.getRoleSet()) {
			for (String authority : role.getAuthorityList()) {
				grantedAuthorities.add(new GrantedAuthorityImpl(authority));
			}
		}
		return grantedAuthorities.toArray(new GrantedAuthority[grantedAuthorities.size()]);
	}

}