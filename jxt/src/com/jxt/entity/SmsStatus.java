package com.jxt.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;


/**
 * @author Administrator
 * sms状态
 */
@Entity
public class SmsStatus implements
		java.io.Serializable {

	private static final long serialVersionUID = -660040815294102547L;
	
	private String id;// ID
	
	private String name;

	@Id
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	@Column(length = 40)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
}