package com.jxt.entity;

import javax.persistence.Column;
import javax.persistence.Entity;

/**
 * @author Administrator
 * 业务状态
 */
@Entity
public class BusiStatus extends BaseEntity implements java.io.Serializable {

	private static final long serialVersionUID = -830056706927596729L;
	
	private String name;

	
	@Column(length = 40)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
}