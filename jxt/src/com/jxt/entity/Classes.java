package com.jxt.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.ForeignKey;

/**
 * @author Administrator
 * 班级
 */
@Entity
public class Classes extends com.jxt.entity.BaseEntity implements
		java.io.Serializable {

	private static final long serialVersionUID = 7131083887435628358L;
	private School school;
	private Grade grade;
	private String name;
	private Integer status = ACTIVE;
	private String description;
	private Set<Student> students = new HashSet<Student>(0);

	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_cls_ref_sch")
	public School getSchool() {
		return this.school;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_cls_ref_grade")
	public Grade getGrade() {
		return this.grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	@Column(nullable = false, length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(nullable = false)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(length = 2000)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@OneToMany(fetch = FetchType.LAZY,mappedBy="classes")
	public Set<Student> getStudents() {
		return this.students;
	}

	public void setStudents(Set<Student> students) {
		this.students = students;
	}
}