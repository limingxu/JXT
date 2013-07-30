package com.jxt.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;

/**
 * @author Administrator
 * 代理公司
 */
@Entity
public class Agent extends com.jxt.entity.BaseEntity implements
		java.io.Serializable {
	private static final long serialVersionUID = 3413560297607188206L;
	private String name;
	private String shortName;
	private String description;
	private Integer status;
	private Set<School> schools = new HashSet<School>(0);

	@Column(nullable = false, length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(length = 20)
	public String getShortName() {
		return this.shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	@Column(length = 2000)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(nullable = false)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@OneToMany(fetch = FetchType.LAZY,mappedBy="agent")
	public Set<School> getSchools() {
		return this.schools;
	}

	public void setSchools(Set<School> schools) {
		this.schools = schools;
	}
}