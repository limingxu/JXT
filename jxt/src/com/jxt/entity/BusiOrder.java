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
 * 业务订制
 */
@Entity
public class BusiOrder extends com.jxt.entity.BaseEntity implements
		java.io.Serializable {

	private static final long serialVersionUID = -8685368519940595835L;
	private Student student;
	private Date startDate;
	private Date endDate;
	
	private BusiStatus busiStatus;
	
	private Integer status=ACTIVE;

	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_cha_ser_ref_stu")
	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	@Column(name = "end_date", length = 19)
	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_cha_ser_ref_status")
	public BusiStatus getBusiStatus() {
		return busiStatus;
	}
	
	public void setBusiStatus(BusiStatus busiStatus) {
		this.busiStatus = busiStatus;
	}
	
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
}