package com.jxt.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.ForeignKey;

/**
 * @author Administrator
 * sms
 */
@Entity
public class Sms extends com.jxt.entity.BaseEntity implements
		java.io.Serializable {
	private static final long serialVersionUID = 231497184942031864L;
	private Admin adminReceiver;
	private Admin sender;
	private Student stdReceiver;
	private Boolean isBatch;
	private SmsBatchHistory smsBatch;
	private Integer receiveType;
	private String phoneNum;
	private Integer phoneType;
	private String chargePhoneNum;
	private Integer chargePhoneType;
	private String content;
	private Date scheduledTime;
	private Date sentTime;
	private Integer status;
	private Integer trialNum;
	private String failedReason;

	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_sms_ref_smsbatch")
	public SmsBatchHistory getSmsBatch() {
		return smsBatch;
	}

	public void setSmsBatch(SmsBatchHistory smsBatch) {
		this.smsBatch = smsBatch;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_sms_ref_adm")
	public Admin getSender() {
		return this.sender;
	}

	public void setSender(Admin sender) {
		this.sender = sender;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_sms_ref_adm")
	public Admin getAdminReceiver() {
		return adminReceiver;
	}

	public void setAdminReceiver(Admin adminReceiver) {
		this.adminReceiver = adminReceiver;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_sms_ref_stu")
	public Student getStdReceiver() {
		return this.stdReceiver;
	}

	public void setStdReceiver(Student stdReceiver) {
		this.stdReceiver = stdReceiver;
	}

	public Boolean getIsBatch() {
		return isBatch;
	}

	public void setIsBatch(Boolean isBatch) {
		this.isBatch = isBatch;
	}

	public Integer getReceiveType() {
		return this.receiveType;
	}

	public void setReceiveType(Integer receiveType) {
		this.receiveType = receiveType;
	}

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

	@Column(nullable = false, length = 200)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getScheduledTime() {
		return this.scheduledTime;
	}

	public void setScheduledTime(Date scheduledTime) {
		this.scheduledTime = scheduledTime;
	}

	public Date getSentTime() {
		return this.sentTime;
	}

	public void setSentTime(Date sentTime) {
		this.sentTime = sentTime;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getTrialNum() {
		return this.trialNum;
	}

	public void setTrialNum(Integer trialNum) {
		this.trialNum = trialNum;
	}

	@Column(length = 200)
	public String getFailedReason() {
		return this.failedReason;
	}

	public void setFailedReason(String failedReason) {
		this.failedReason = failedReason;
	}
}