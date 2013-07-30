package com.jxt.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Transient;

import org.hibernate.annotations.ForeignKey;
import org.springframework.security.GrantedAuthority;
import org.springframework.security.userdetails.UserDetails;

/**
 * @author Administrator
 * 管理员（8中类型）
 */
@Entity
public class Admin extends BaseEntity implements UserDetails  {
	
	private static final long serialVersionUID = 3026430243218253999L;
	
	public static final String ADMIN_LOGIN_SESSION_NAME = "login_admin";
	
	private GrantedAuthority[] authorities;// 角色信息
	private Admin parent;
	private Agent agent;
	private String name;
	private String password;
	private String username;
	private String email;
	private String roleType;
	private String phoneNum;
	private Integer phoneType;
	private String chargePhoneNum;
	private Integer chargePhoneType;
	private Integer smsFlag;
	private String loginIp;
	private Date loginDate;// 最后登录日期
	private String comments;
	private Boolean isEnable;
	private Set<Role> roleSet = new HashSet<Role>();// 管理角色
	private Set<Admin> childern = new HashSet<Admin>(0);
	private Set<AdminSchool> adminSchools = new HashSet<AdminSchool>(0);

	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_adm_ref_self")
	public Admin getParent() {
		return this.parent;
	}

	public void setAdmin(Admin parent) {
		this.parent = parent;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@ForeignKey(name = "fk_adm_ref_agent")
	public Agent getAgent() {
		return this.agent;
	}

	public void setAgent(Agent agent) {
		this.agent = agent;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(unique = true, nullable = false)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(nullable = false)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRoleType() {
		return this.roleType;
	}

	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}

	@Column(length = 20)
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

	public Integer getSmsFlag() {
		return this.smsFlag;
	}

	public void setSmsFlag(Integer smsFlag) {
		this.smsFlag = smsFlag;
	}

	@Column(name = "login_ip")
	public String getLoginIp() {
		return this.loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public Date getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	public void setParent(Admin parent) {
		this.parent = parent;
	}

	@Column(length = 200)
	public String getComments() {
		return this.comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinColumn(nullable = false)
	@OrderBy("name asc")
	@ForeignKey(name = "fk_admin_role_set")
	public Set<Role> getRoleSet() {
		return roleSet;
	}

	public void setRoleSet(Set<Role> roleSet) {
		this.roleSet = roleSet;
	}
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy="parent")
	public Set<Admin> getChildern() {
		return this.childern;
	}

	public void setChildern(Set<Admin> childern) {
		this.childern = childern;
	}

	@OneToMany(fetch = FetchType.LAZY,mappedBy="admin")
	public Set<AdminSchool> getAdminSchools() {
		return this.adminSchools;
	}

	public void setAdminSchools(Set<AdminSchool> adminSchools) {
		this.adminSchools = adminSchools;
	}

	public Boolean getIsEnable() {
		return isEnable;
	}

	public void setIsEnable(Boolean isEnable) {
		this.isEnable = isEnable;
	}

	@Transient
	public boolean isEnabled() {
		return isEnable;
	}

	@Transient
	public boolean isAccountNonLocked() {
		return true;
	}

	@Transient
	public boolean isAccountNonExpired() {
		return true;
	}

	@Transient
	public boolean isCredentialsNonExpired() {
		return true;
	}
	
	@Transient
	public GrantedAuthority[] getAuthorities() {
		return authorities;
	}

	public void setAuthorities(GrantedAuthority[] authorities) {
		this.authorities = authorities;
	}
	
	@Override
	@Transient
	public void onSave() {
		if(isEnable==null)
			isEnable = false;
	}
	
	@Override
	@Transient
	public void onUpdate() {
		if(isEnable==null)
			isEnable = false;
	}
}