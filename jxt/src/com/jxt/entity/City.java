package com.jxt.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;

/**
 * @author Administrator
 * 城市
 */
@Entity
public class City extends com.jxt.entity.BaseEntity implements
		java.io.Serializable {

	private static final long serialVersionUID = 5547222154932079621L;
	private String name;
	private Set<District> districts =  new HashSet<District>();

	@Column(nullable = false, length = 40)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@OneToMany(fetch = FetchType.LAZY,mappedBy="city")
	public Set<District> getDistricts() {
		return districts;
	}

	public void setDistricts(Set<District> districts) {
		this.districts = districts;
	}
}