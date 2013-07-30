package com.jxt.action.admin;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.jxt.common.AdminType;
import com.jxt.entity.Admin;
import com.jxt.entity.Role;
import com.jxt.service.AdminService;
import com.jxt.service.RoleService;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.EmailValidator;
import com.opensymphony.xwork2.validator.annotations.RegexFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.StringLengthFieldValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;


@ParentPackage("admin")
public class AdminAction extends BaseAction {

	private static final long serialVersionUID = -6296393115930477663L;
	
	private Admin admin;
	private List<Role> roleList;

	@Resource(name = "adminServiceImpl")
	private AdminService adminService;
	@Resource(name = "roleServiceImpl")
	private RoleService roleService;
	
	public List<AdminType> getCanAddAdminTypes(){
		String adminType = getLoginAdmin().getRoleType();
		return AdminType.getCanAddAdminType(adminType);
	}
	
	// 是否已存在jax验证
	public String checkUsername() {
		String username = admin.getUsername();
		if (adminService.isExistByUsername(username)) {
			return ajax("false");
		} else {
			return ajax("true");
		}
	}
	
	// ajax验证当前密码是否正确
	public String enable() {
		if(id==1){
			return ajax(Status.error, "此管理员不允许禁用启用操作!");
		}

		boolean b = adminService.canOperateAdmin(getLoginAdmin().getId(), id);
		if(!b){
			return ajax(Status.error, "您没有权限操作此用户!");
		}
		Admin admin = adminService.get(id);
		boolean changeEnable = !admin.getIsEnable();
		admin.setIsEnable(changeEnable);
		adminService.update(admin);
		return ajax(Status.success, "操作成功!");
	}

	// 添加
	public String add() {
		return INPUT;
	}

	// 编辑
//	public String edit() {
//		admin = adminService.get(id);
//		return INPUT;
//	}

	// 列表
	public String list() {
		pager = adminService.getSubAdminByParentId(getLoginAdmin().getId(),pager);
		return LIST;
	}

	// 删除
//	public String delete() {
//		StringBuffer logInfoStringBuffer = new StringBuffer("删除管理员");
//		for (Long id : ids) {
//			Admin admin = adminService.get(id);
//			if(!admin.getUsername().equals("admin")){
//				adminService.delete(admin);
//				logInfoStringBuffer.append(admin.getUsername() + " ");
//			}
//		}
//		logInfo = logInfoStringBuffer.toString();
//		return ajax(Status.success, "删除成功!");
//	}

	
	@Validations(
			requiredStrings = {
				@RequiredStringValidator(fieldName = "admin.username", message = "用户名不允许为空!"),
				@RequiredStringValidator(fieldName = "admin.password", message = "密码不允许为�?"),
				@RequiredStringValidator(fieldName = "admin.email", message = "E-mail不允许为�?")
			},
			stringLengthFields = {
				@StringLengthFieldValidator(fieldName = "admin.username", minLength = "2", maxLength = "20", message = "用户名长度必须在${minLength}�?{maxLength}之间!"),
				@StringLengthFieldValidator(fieldName = "admin.password", minLength = "4", maxLength = "20", message = "密码长度必须�?{minLength}�?{maxLength}之间!")
			},
			emails = {
				@EmailValidator(fieldName = "admin.email", message = "E-mail格式错误!")
			},
			regexFields = {
				@RegexFieldValidator(fieldName = "admin.username", expression = "^[0-9a-z_A-Z\u4e00-\u9fa5]+$", message = "用户名只允许包含中文、英文�?数字和下划线!") 
			}
		)
		@InputConfig(resultName = "error")
		public String save() {
			if (adminService.isExistByUsername(admin.getUsername())) {
				addActionError("用户名已存在!");
				return ERROR;
			}
			if(AdminType.isCanAddAdminType(getLoginAdmin().getRoleType(),admin.getRoleType())){
				addActionError("没有权限!");
				return ERROR;
			}
			adminService.saveAdmin(admin);
			redirectUrl = "admin!list.action";
			return SUCCESS;
		}

	// 更新
//	@Validations(
//		requiredStrings = {
//			@RequiredStringValidator(fieldName = "admin.username", message = "用户名不允许为空!"),
//			@RequiredStringValidator(fieldName = "admin.email", message = "E-mail不允许为�?")
//		},
//		stringLengthFields = {
//			@StringLengthFieldValidator(fieldName = "admin.username", minLength = "2", maxLength = "20", message = "用户名长度必须在${minLength}�?{maxLength}之间!"),
//			@StringLengthFieldValidator(fieldName = "admin.password", minLength = "4", maxLength = "20", message = "密码长度必须�?{minLength}�?{maxLength}之间!") },
//		emails = {
//			@EmailValidator(fieldName = "admin.email", message = "E-mail格式错误!")
//		},
//		regexFields = {
//			@RegexFieldValidator(fieldName = "admin.username", expression = "^[0-9a-z_A-Z\u4e00-\u9fa5]+$", message = "用户名只允许包含中文、英文�?数字和下划线!") 
//		}
//	)
//	@InputConfig(resultName = "error")
//	public String update() {
//		Admin persistent = adminService.get(id);
//		if (roleList == null || roleList.size() == 0) {
//			addActionError("管理角色不允许为�?");
//			return ERROR;
//		}
//		admin.setRoleSet(new HashSet<Role>(roleList));
//		if (StringUtils.isNotEmpty(admin.getPassword())) {
//			String passwordMd5 = DigestUtils.md5Hex(admin.getPassword());
//			persistent.setPassword(passwordMd5);
//		}
//		BeanUtils.copyProperties(admin, persistent, new String[] {"id", "createDate", "modifyDate", "username", "password", "isAccountLocked", "isAccountExpired", "isCredentialsExpired", "loginFailureCount", "lockedDate", "loginDate", "loginIp", "authorities"});
//		//if(persistent.isEnabled())
//		//	persistent.getShop().setStatus(Shop.SHOP_STATUS_USABLE);
//		adminService.update(persistent);
//		logInfo = "编辑管理�? " + admin.getUsername();
//		redirectUrl = "admin!list.action";
//		return SUCCESS;
//	}
	
	// 获取管理权限集合
	public List<Role> getAllRoleList() {
		return roleService.getAll();
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

}
