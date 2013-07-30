package com.jxt.directive;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.RecoverableDataAccessException;
import org.springframework.security.providers.encoding.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.jxt.util.DecryptUtil;
@Component("DESPasswordEncoder")
public class DESPasswordEncoder implements PasswordEncoder {

	@Override
	public String encodePassword(String rawPass, Object salt) throws DataAccessException {
		try{
			String encPass = DecryptUtil.getInstance().encrypt(rawPass);
			return encPass;
		}catch(Exception e){
			throw new RecoverableDataAccessException(e.getMessage(),e);
		}
	}

	@Override
	public boolean isPasswordValid(String encPass, String rawPass, Object salt)
			throws DataAccessException {
		
		if(encPass.equals(encodePassword(rawPass,salt))){
			return true;
		}
		
		return false;
	}

}
