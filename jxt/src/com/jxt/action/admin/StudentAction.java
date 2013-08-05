package com.jxt.action.admin;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.jxt.common.AdminType;
import com.jxt.entity.Admin;
import com.jxt.entity.Agent;
import com.jxt.entity.BaseEntity;
import com.jxt.entity.BusiOrder;
import com.jxt.entity.School;
import com.jxt.entity.Student;
import com.jxt.service.SchoolService;
import com.jxt.service.StudentService;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.RequiredFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;


@ParentPackage("admin")
public class StudentAction extends BaseAction {

	private static final long serialVersionUID = -6296393115930477663L;
	
	private Admin admin;
	
	private School school;
	
	private Agent agent;
	
	private Student student;
	
	private BusiOrder busiOrder;
	
	@Resource(name="schoolServiceImpl")
	private SchoolService schoolService;
	
	@Resource(name="studentServiceImpl")
	private StudentService studentService;
	
	// 列表
	public String list() {
		admin = this.getLoginAdmin();
		
		pager = schoolService.getAllSchools(admin, pager);
		
		return LIST;
	}
	
	public String add() {
		admin = this.getLoginAdmin();
		return INPUT;
	}
	
	public String edit() {
		school = schoolService.get(id);
		return INPUT;
	}
	
	public String update() {
//		if(!getIsAgent(getLoginAdmin().getRoleType())){
//			addActionError("您没有修改学校的权限");
//			return ERROR;
//		}
		
		schoolService.update(school);
		redirectUrl = "school!list.action";
		return SUCCESS;
	}
	
//	@Validations(
//			requiredStrings = {
//				@RequiredStringValidator(fieldName = "school.name", message = "学校名不允许为空!")
//			},
//			requiredFields = {
//				@RequiredFieldValidator(fieldName = "school.city.id", message = "所在城市不允许为空"),
//				@RequiredFieldValidator(fieldName = "school.district.id", message = "所在地区不允许为空")
//			}
//		)
	  @InputConfig(resultName = "error")
	  public String save() {
		admin = this.getLoginAdmin();
		
//		if(!getIsAgent(getLoginAdmin().getRoleType())){
//			addActionError("您没有添加学校的权限");
//			return ERROR;
//		}
		
		//设置
		schoolService.saveSchool(school, admin);
		
		redirectUrl = "school!list.action";
		return SUCCESS;
	}
	
	public String cancel(){
		if(id ==null ){
			addActionError("您需要取消的学校不存在，请确认");
			return ERROR;
		}
		school = schoolService.get(id);
		
		if(school ==null ){
			addActionError("您需要取消的学校不存在，请确认");
			return ERROR;
		}
		
//		if(!getIsAgent(getLoginAdmin().getRoleType())){
//			addActionError("您没有取消学校的权限");
//			return ERROR;
//		}
		
		school.setStatus(BaseEntity.INACTIVE);
		schoolService.update(school);
		
		redirectUrl = "school!list.action";
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

	public School getSchool() {
		return school;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	public Agent getAgent() {
		return agent; 
	}

	public void setAgent(Agent agent) {
		this.agent = agent;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public BusiOrder getBusiOrder() {
		return busiOrder;
	}

	public void setBusiOrder(BusiOrder busiOrder) {
		this.busiOrder = busiOrder;
	}
	
}
