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
import com.jxt.service.BusiOrderService;
import com.jxt.service.SchoolService;
import com.jxt.service.StudentService;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
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
	
	@Resource(name="busiOrderServiceImpl")
	private BusiOrderService busiOrderService;
	
	
	// 列表
	public String list() {
		admin = this.getLoginAdmin();
		
//		pager = busiOrderService.getAllStudent(admin, pager);
		
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
	
	@Validations(
			requiredStrings = {
				@RequiredStringValidator(fieldName = "student.stdNum", message = "学生学号不允许为空!"),
				@RequiredStringValidator(fieldName = "student.stdName", message = "学生姓名不允许为空!"),
				@RequiredStringValidator(fieldName = "student.parentPhoneNum", message = "家长手机号不能为空!")
			}
		)
	  @InputConfig(resultName = "error")
	  public String save() {
		admin = this.getLoginAdmin();
		
		studentService.save(student,busiOrder);
		
		busiOrder = new BusiOrder();
		
		redirectUrl = "student!list.action";
		return SUCCESS;
	}

	
	/*
	@Override
	public void validate() {
		if(busiOrder ==null || busiOrder.getStartDate()==null){
			addActionMessage("服务开始时间不能为空");
		}
		
		if(busiOrder ==null || busiOrder.getEndDate()==null){
			addActionMessage("服务结束时间不能为空");
		}
		
		if(busiOrder.getStartDate().before(new Date())){
			addActionMessage("服务开始时间必须大于等于当前时间");
		}
		
		if(busiOrder.getStartDate().after(busiOrder.getEndDate())){
			addActionMessage("服务开始时间不能提前于服务结束时间");
		}
		
		//校验学生
		boolean isExist=checkValidStudent(student);
		if(isExist){
			addActionMessage("学生学号重复");
		}
	}

	//校验学生
	public boolean checkValidStudent(Student student) {
		boolean isExist = studentService.checkStuIDNum(student);
		
		return isExist;
	}*/

	public String cancel(){
		if(id ==null ){
			addActionError("您需要取消的信息不存在，请确认");
			return ERROR;
		}
		school = schoolService.get(id);
		
		if(school ==null ){
			addActionError("您需要取消的信息不存在，请确认");
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
