package com.jxt.entity;

import javax.persistence.Column;
import javax.persistence.Entity;


/**
 * @author Administrator
 * sms状态
 */
@Entity
public class SmsStatus extends BaseEntity implements
		java.io.Serializable {

	private static final long serialVersionUID = -660040815294102547L;
	
	private String name;
	
	@Column(length = 40)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
}