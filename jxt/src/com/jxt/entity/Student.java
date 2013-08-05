package com.jxt.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.ForeignKey;

/**
 * @author Administrator
 * 学生
 */
@Entity
public class Student extends com.jxt.entity.BaseEntity implements
		java.io.Serializable {

	private static final long serialVersionUID = -386048413348505972L;
	private Admin parent;
	private Classes classes;
	private String stdNum;
	private String name;
	private String stdPhoneNum;
	private Integer stdPhoneType;
	private Integer stdPhoneSendStatus;
	private Integer status =ACTIVE;

	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_stu_ref_adm")
	public Admin getParent() {
		return this.parent;
	}

	public void setParent(Admin parent) {
		this.parent = parent;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_stu_ref_cls")
	public Classes getClasses() {
		return this.classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}

	@Column(length = 20)
	public String getStdNum() {
		return this.stdNum;
	}

	public void setStdNum(String stdNum) {
		this.stdNum = stdNum;
	}

	@Column(nullable = false, length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(length = 20)
	public String getStdPhoneNum() {
		return this.stdPhoneNum;
	}

	public void setStdPhoneNum(String stdPhoneNum) {
		this.stdPhoneNum = stdPhoneNum;
	}

	public Integer getStdPhoneType() {
		return this.stdPhoneType;
	}

	public void setStdPhoneType(Integer stdPhoneType) {
		this.stdPhoneType = stdPhoneType;
	}

	public Integer getStdPhoneSendStatus() {
		return this.stdPhoneSendStatus;
	}

	public void setStdPhoneSendStatus(Integer stdPhoneSendStatus) {
		this.stdPhoneSendStatus = stdPhoneSendStatus;
	}

	@Column(nullable = false)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
}