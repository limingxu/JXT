package com.jxt.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.ForeignKey;

/**
 * @author Administrator
 * 行政区域
 */
@Entity
public class District extends com.jxt.entity.BaseEntity implements
		java.io.Serializable {

	private static final long serialVersionUID = 5219092036284910410L;
	private City city;
	private String name;

	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_district_ref_city")
	public City getCity() {
		return this.city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	@Column(nullable = false, length = 40)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
}