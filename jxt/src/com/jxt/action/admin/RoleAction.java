package com.jxt.action.admin;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.BeanUtils;

import com.jxt.entity.Admin;
import com.jxt.entity.Role;
import com.jxt.service.RoleService;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.RequiredFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;


@ParentPackage("admin")
public class RoleAction extends BaseAction {

	private static final long serialVersionUID = -5383463207248344967L;

	private Role role;

	@Resource(name = "roleServiceImpl")
	private RoleService roleService;

	// 列表
	public String list() {
		pager = roleService.pagerByPropertyLike(pager);
		return LIST;
	}

	// 删除
	public String delete() throws Exception{
		for (Long id : ids) {
			Role role = roleService.get(id);
			Set<Admin> adminSet = role.getAdminSet();
			if (adminSet != null && adminSet.size() > 0) {
				return ajax(Status.error, "角色[" + role.getName() + "]下存在管理员,删除失败!");
			}
		}
		roleService.delete(ids);
		return ajax(Status.success, "删除成功!");
	}

	// 添加
	public String add() {
		return INPUT;
	}

	// 编辑
	public String edit() {
		role = roleService.get(id);
		return INPUT;
	}

	// 保存
	@Validations(
		requiredStrings = { 
			@RequiredStringValidator(fieldName = "role.name", message = "角色名称不允许为�?")
		},
		requiredFields = {
			@RequiredFieldValidator(fieldName = "role.authorityList", message = "角色权限不允许为�?")
		}
	)
	@InputConfig(resultName = "error")
	public String save() throws Exception {
		List<String> authorityList = role.getAuthorityList();
		authorityList.add(Role.ROLE_BASE);
		role.setAuthorityList(authorityList);
		roleService.save(role);
		redirectUrl = "role!list.action";
		return SUCCESS;
	}

	// 更新
	@Validations(
		requiredStrings = { 
			@RequiredStringValidator(fieldName = "role.name", message = "角色名称不允许为�?")
		},
		requiredFields = {
			@RequiredFieldValidator(fieldName = "role.authorityList", message = "角色权限不允许为�?")
		}
	)
	@InputConfig(resultName = "error")
	public String update() throws Exception {
		Role persistent = roleService.get(id);
		List<String> authorityList = role.getAuthorityList();
		authorityList.add(Role.ROLE_BASE);
		role.setAuthorityList(authorityList);
		if (persistent.getIsSystem()) {
			addActionError("系统内置角色不允许修�?");
			return ERROR;
		}
		BeanUtils.copyProperties(role, persistent, new String[] {"id", "createDate", "modifyDate", "isSystem", "adminSet"});
		roleService.update(persistent);
		redirectUrl = "role!list.action";
		return SUCCESS;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	
}