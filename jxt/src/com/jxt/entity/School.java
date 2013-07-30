package com.jxt.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.ForeignKey;

/**
 * @author Administrator
 * 学校
 */
@Entity
public class School extends com.jxt.entity.BaseEntity implements
		java.io.Serializable {

	private static final long serialVersionUID = -5017700330856924156L;

	private Agent agent;
	private City city;
	private District district;
	
	private String name;
	private String description;
	private Integer status;

	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_sch_ref_agent")
	public Agent getAgent() {
		return this.agent;
	}

	public void setAgent(Agent agent) {
		this.agent = agent;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_sch_ref_city")
	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_sch_ref_district")
	public District getDistrict() {
		return district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}
	
	@Column(nullable = false, length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(nullable = false, length = 2000)
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


	
	
}