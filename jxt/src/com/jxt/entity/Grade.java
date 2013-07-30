package com.jxt.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;

/**
 * @author Administrator
 * 年级
 */
@Entity
public class Grade extends com.jxt.entity.BaseEntity implements
		java.io.Serializable {

	private static final long serialVersionUID = -109779318334746449L;
	private String name;
	private String phase;
	private Set<Classes> classeses = new HashSet<Classes>(0);

	@Column(nullable = false, length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(nullable = false, length = 20)
	public String getPhase() {
		return this.phase;
	}

	public void setPhase(String phase) {
		this.phase = phase;
	}

	@OneToMany(fetch = FetchType.LAZY,mappedBy="grade")
	public Set<Classes> getClasseses() {
		return this.classeses;
	}

	public void setClasseses(Set<Classes> classeses) {
		this.classeses = classeses;
	}
}