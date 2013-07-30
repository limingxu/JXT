package com.jxt.service;

import java.util.List;

import com.jxt.entity.Sms;



/**
 * Coder AutoGenerator generate.
 *
 * @author Coder AutoGenerator by Xing,XiuDong
 * @date 2013-07-20 19:16:28
 */
public interface SmsService {

	Long createSmsInfo(Sms t);

	int modifySmsInfo(Sms t);

	int removeSmsInfo(Sms t);

	Sms getSmsInfo(Sms t);

	List<Sms> getSmsInfoList(Sms t);

	Long getSmsInfoCount(Sms t);

	List<Sms> getSmsInfoPaginatedList(Sms t);

}