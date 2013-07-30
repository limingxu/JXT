package com.jxt.dao.impl;

import org.springframework.stereotype.Repository;

import com.jxt.dao.NotificationDao;
import com.jxt.entity.Notice;

@Repository(value="notificationDaoImpl")
public class NoticeDaoImpl extends GenericDaoImpl<Notice,Long> implements NotificationDao {

}
