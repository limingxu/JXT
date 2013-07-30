package com.jxt.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.ForeignKey;

/**
 * @author Administrator
 * 通知与申请
 */
@Entity
public class Notice extends com.jxt.entity.BaseEntity implements
		java.io.Serializable {

	private static final long serialVersionUID = -5951888136981568394L;

	private Admin fromAdmin;
	private Admin toAdmin;
	private String subject;
	private String content;
	private Integer status;

	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_adm_ref_toadm")
	public Admin getToAdmin() {
		return this.toAdmin;
	}

	public void setToAdmin(Admin toAdmin) {
		this.toAdmin = toAdmin;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_adm_ref_fromadm")
	public Admin getFromAdmin() {
		return this.fromAdmin;
	}

	public void setFromAdmin(Admin fromAdmin) {
		this.fromAdmin = fromAdmin;
	}

	@Column(nullable = false, length = 100)
	public String getSubject() {
		return this.subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	@Column(nullable = false, length = 500)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(nullable = false)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
}