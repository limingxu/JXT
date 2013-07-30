package com.jxt.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.ForeignKey;

/**
 * @author Administrator
 * 管理员与学校对应关系表
 */
@Entity
public class AdminSchool extends com.jxt.entity.BaseEntity implements
		java.io.Serializable {

	private static final long serialVersionUID = -4405509099266480729L;
	private Admin admin;
	private School school;
	private Integer status;

	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_sch2adm_ref_adm")
	public Admin getAdmin() {
		return this.admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_sch2adm_ref_sch")
	public School getSchool() {
		return this.school;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	@Column(nullable = false)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
}