package com.jxt.listener;

import org.hibernate.event.PostInsertEvent;
import org.hibernate.event.PostInsertEventListener;
import org.hibernate.persister.entity.EntityPersister;
import org.springframework.stereotype.Component;

@Component("entityPostInsertEventListener")
public class EntityPostInsertEventListener extends AbstractEventListener implements PostInsertEventListener {
	
	private static final long serialVersionUID = -6010867340759752487L;
	
//	public HtmlService getHtmlServiceImpl(){
//		return (HtmlService)SpringUtil.getBean("htmlServiceImpl");
//	}

	public void onPostInsert(PostInsertEvent event) {
		EntityPersister entityPersister = event.getPersister();
		String entityName = entityPersister.getEntityName();
		String id = String.valueOf(event.getId());
		
		
	}
}