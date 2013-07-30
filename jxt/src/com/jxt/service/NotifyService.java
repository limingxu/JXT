package com.jxt.service;

import java.util.List;

import com.jxt.entity.Notice;



/**
 * Coder AutoGenerator generate.
 *
 * @author Coder AutoGenerator by Xing,XiuDong
 * @date 2013-07-20 19:16:28
 */
public interface NotifyService {

	Long createNotification(Notice t);

	int modifyNotification(Notice t);

	int removeNotification(Notice t);

	Notice getNotification(Notice t);

	List<Notice> getNotificationList(Notice t);

	Long getNotificationCount(Notice t);

	List<Notice> getNotificationPaginatedList(Notice t);

}