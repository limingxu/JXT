package com.jxt.action.admin;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.jxt.entity.Admin;
import com.jxt.entity.Agent;
import com.jxt.entity.School;
import com.jxt.service.SchoolService;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.RequiredFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;


@ParentPackage("admin")
public class SchoolAction extends BaseAction {

	private static final long serialVersionUID = -6296393115930477663L;
	
	private Admin admin;
	
	private School school;
	
	private Agent agent;
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Resource(name="schoolServiceImpl")
	private SchoolService schoolService;
	
	// 列表
	public String list() {
		admin = this.getLoginAdmin();
		
		pager = schoolService.getAllSchools(admin, pager);
		
		return LIST;
	}
	
	public String add() {
		admin = this.getLoginAdmin();
		agent = admin.getAgent();
		//districtList = cityList.get(0).getDistricts();
		
		return INPUT;
	}
	
	public String edit() {
		school = schoolService.get(id);
		return INPUT;
	}
	
	@Validations(
			requiredStrings = {
				@RequiredStringValidator(fieldName = "school.name", message = "学校名不允许为空!")
			},
			requiredFields = {
				@RequiredFieldValidator(fieldName = "school.city.id", message = "所在城市不允许为空"),
				@RequiredFieldValidator(fieldName = "school.district.id", message = "所在地区不允许为空")
			}
		)
	  @InputConfig(resultName = "error")
  public String save() {
		admin = this.getLoginAdmin();
		
		//设置
		schoolService.saveSchool(school, admin);
		
		redirectUrl = "school!list.action";
		return SUCCESS;
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
}