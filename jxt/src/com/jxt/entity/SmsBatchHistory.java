package com.jxt.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.ForeignKey;

/**
 * @author Administrator
 * sms批次历史表
 */
@Entity
public class SmsBatchHistory extends com.jxt.entity.BaseEntity implements
		java.io.Serializable {

	private static final long serialVersionUID = -8533369976483181489L;
	private School school;
	private Classes classes;
	private Admin sender;
	private Integer type;
	private String content;
	private Date scheduledTime;

	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_his_ref_sch")
	public School getSchool() {
		return this.school;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_his_ref_cls")
	public Classes getClasses() {
		return this.classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_his_ref_adm")
	public Admin getSender() {
		return this.sender;
	}

	public void setSender(Admin sender) {
		this.sender = sender;
	}

	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	@Column(nullable = false, length = 200)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(nullable = false, length = 19)
	public Date getScheduledTime() {
		return this.scheduledTime;
	}

	public void setScheduledTime(Date scheduledTime) {
		this.scheduledTime = scheduledTime;
	}
}