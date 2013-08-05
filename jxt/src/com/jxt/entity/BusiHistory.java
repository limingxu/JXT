package com.jxt.entity;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.ForeignKey;

/**
 * @author Administrator
 * 业务历史
 */
@Entity
public class BusiHistory extends com.jxt.entity.BaseEntity implements
		java.io.Serializable {

	private static final long serialVersionUID = 2091754577680377270L;
	private Student student;
	private String phoneNum;
	private Integer phoneType;
	private String chargePhoneNum;
	private Integer chargePhoneType;
	private Date effectTime;
	private Date expiredTime;
	private Integer parPhoneSendStatus;
	private String reason;

	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_cha_his_ref_stu")
	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	@Column(nullable = false, length = 20)
	public String getPhoneNum() {
		return this.phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public Integer getPhoneType() {
		return this.phoneType;
	}

	public void setPhoneType(Integer phoneType) {
		this.phoneType = phoneType;
	}

	@Column(length = 20)
	public String getChargePhoneNum() {
		return this.chargePhoneNum;
	}

	public void setChargePhoneNum(String chargePhoneNum) {
		this.chargePhoneNum = chargePhoneNum;
	}

	public Integer getChargePhoneType() {
		return this.chargePhoneType;
	}

	public void setChargePhoneType(Integer chargePhoneType) {
		this.chargePhoneType = chargePhoneType;
	}

	public Date getEffectTime() {
		return this.effectTime;
	}

	public void setEffectTime(Date effectTime) {
		this.effectTime = effectTime;
	}

	public Date getExpiredTime() {
		return this.expiredTime;
	}

	public void setExpiredTime(Timestamp expiredTime) {
		this.expiredTime = expiredTime;
	}

	@Column(nullable = false)
	public Integer getParPhoneSendStatus() {
		return this.parPhoneSendStatus;
	}

	public void setParPhoneSendStatus(Integer parPhoneSendStatus) {
		this.parPhoneSendStatus = parPhoneSendStatus;
	}

	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
}