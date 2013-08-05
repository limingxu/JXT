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
	private Classes classes;
	private String stdNum;
	private String stdName;
	private String parentName;
	private String stdPhoneNum;
	private Integer stdPhoneType;
	private Integer stdPhoneSendStatus;
	private Integer stdStatus=ACTIVE;//?不知道什么意思
	private String parentPhoneNum;
	private Integer parentPhoneType;//1
	private String parentChargePhoneNum;
	private Integer parentChargePhoneType;
	private Integer smsFlag;//?不知道什么意思

	public Integer getSmsFlag() {
		return this.smsFlag;
	}

	public void setSmsFlag(Integer smsFlag) {
		this.smsFlag = smsFlag;
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

	public Integer getStdStatus() {
		return stdStatus;
	}

	public void setStdStatus(Integer stdStatus) {
		this.stdStatus = stdStatus;
	}

	public String getStdName() {
		return stdName;
	}

	public void setStdName(String stdName) {
		this.stdName = stdName;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public String getParentPhoneNum() {
		return parentPhoneNum;
	}

	public void setParentPhoneNum(String parentPhoneNum) {
		this.parentPhoneNum = parentPhoneNum;
	}

	public Integer getParentPhoneType() {
		return parentPhoneType;
	}

	public void setParentPhoneType(Integer parentPhoneType) {
		this.parentPhoneType = parentPhoneType;
	}

	public String getParentChargePhoneNum() {
		return parentChargePhoneNum;
	}

	public void setParentChargePhoneNum(String parentChargePhoneNum) {
		this.parentChargePhoneNum = parentChargePhoneNum;
	}

	public Integer getParentChargePhoneType() {
		return parentChargePhoneType;
	}

	public void setParentChargePhoneType(Integer parentChargePhoneType) {
		this.parentChargePhoneType = parentChargePhoneType;
	}
}
