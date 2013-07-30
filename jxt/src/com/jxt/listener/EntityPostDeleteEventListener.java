package com.jxt.listener;

import org.hibernate.event.PostDeleteEvent;
import org.hibernate.event.PostDeleteEventListener;
import org.hibernate.persister.entity.EntityPersister;
import org.springframework.stereotype.Component;

@Component("entityPostDeleteEventListener")
public class EntityPostDeleteEventListener extends AbstractEventListener implements PostDeleteEventListener {
	
	private static final long serialVersionUID = 616415776098455744L;

	public void onPostDelete(PostDeleteEvent event) {
		EntityPersister entityPersister = event.getPersister();
		String entityName = entityPersister.getEntityName();
		String id = String.valueOf(event.getId());
		
	}
}