package com.jxt.action.admin;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.jxt.common.AdminType;
import com.jxt.entity.Admin;
import com.jxt.entity.BaseEntity;
import com.jxt.entity.Classes;
import com.jxt.service.ClassesService;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.RequiredFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

@ParentPackage("admin")
public class ClassAction extends BaseAction {

	private static final long serialVersionUID = -6296393115930477663L;
	
	private Admin admin;
	
	private Classes classes;
	
	@Resource(name="classesServiceImpl")
	private ClassesService classesService;
	
	// 列表
	public String list() {
		admin = this.getLoginAdmin();
		
		pager = classesService.getAllClasses(admin, pager);
		
		return LIST;
	}
	
	public String add() {
//		classes = new School();
//		
//		classes.setAgent(this.getLoginAdmin().getAgent());
		
		return INPUT;
	}
	
	public String edit() {
		classes = classesService.get(id);
		return INPUT;
	}
	
	public String update() {
		if(classes==null || classes.getId()==null){
			addActionError("您需要修改的班级不存在，请确认");
			return ERROR;
		}
		
//		if(!getIsAgent(getLoginAdmin().getRoleType())){
//			addActionError("您没有修改学校的权限");
//			return ERROR;
//		}
		
		classesService.update(classes);
		redirectUrl = "class!list.action";
		return SUCCESS;
	}
	
	@Validations(
			requiredStrings = {
				@RequiredStringValidator(fieldName = "classes.name", message = "班级名称")
			},
			requiredFields = {
				@RequiredFieldValidator(fieldName = "classes.school.city.id", message = "所在城市不允许为空"),
				@RequiredFieldValidator(fieldName = "classes.school.district.id", message = "所在地区不允许为空"),
				@RequiredFieldValidator(fieldName = "classes.grade.id", message = "班级所在年级"),
				@RequiredFieldValidator(fieldName = "classes.school.id", message = "学校名不允许为空!")
			}
		)
	  @InputConfig(resultName = "error")
	  public String save() {
		admin = this.getLoginAdmin();
		
//		if(!getIsAgent(getLoginAdmin().getRoleType())){
//			addActionError("您没有添加学校的权限");
//			return ERROR;
//		}
		
		//设置
		classesService.save(classes);
		
		redirectUrl = "class!list.action";
		return SUCCESS;
	}
	
	public String cancel(){
		if(id ==null ){
			addActionError("您需要取消的学校不存在，请确认");
			return ERROR;
		}
		classes = classesService.get(id);
		
		if(classes ==null ){
			addActionError("您需要取消的学校不存在，请确认");
			return ERROR;
		}
		
//		if(!getIsAgent(getLoginAdmin().getRoleType())){
//			addActionError("您没有取消学校的权限");
//			return ERROR;
//		}
		
		classes.setStatus(BaseEntity.INACTIVE);
		classesService.update(classes);
		
		redirectUrl = "class!list.action";
		return SUCCESS;
	}
	
	public Boolean getIsAgent(String roleType){
		//是代理商
		if(AdminType.adminTypes.get(AdminType.ROLE_AGENT_ADMIN).equals(roleType)){
			return true;
		}else{
			return false;
		}
	}
	
	
	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
	}
}
