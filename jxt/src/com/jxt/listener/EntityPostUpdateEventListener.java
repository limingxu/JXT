package com.jxt.listener;

import org.hibernate.event.PostUpdateEvent;
import org.hibernate.event.PostUpdateEventListener;
import org.hibernate.persister.entity.EntityPersister;
import org.springframework.stereotype.Component;

@Component("entityPostUpdateEventListener")
public class EntityPostUpdateEventListener extends AbstractEventListener implements PostUpdateEventListener {
	
	private static final long serialVersionUID = -5981524888794053786L;

	public void onPostUpdate(PostUpdateEvent event) {
		EntityPersister entityPersister = event.getPersister();
		String entityName = entityPersister.getEntityName();
		String id = String.valueOf(event.getId());
		
		
	}

}