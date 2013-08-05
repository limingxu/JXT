package com.jxt.action.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.jxt.entity.City;
import com.jxt.entity.Classes;
import com.jxt.entity.District;
import com.jxt.entity.School;
import com.jxt.entity.json.ClassesJson;
import com.jxt.service.ClassesService;
import com.jxt.service.SchoolService;


@ParentPackage("admin")
public class CopyOfResourceAction extends BaseAction {

	private static final long serialVersionUID = -6296393115930477663L;
	
	private Long cityId;
	private Long districtId;
	
	
	private Long schoolId;
	private Long gradeId;
	private Long classesId;
	
	@Resource(name="schoolServiceImpl")
	private SchoolService schoolService;
	
	@Resource(name="classesServiceImpl")
	private ClassesService classesService;
	
	public void ajaxGetDistrictByCityId() {
		if(cityId ==null){
			ajax("");
		}
		
		City city = (City) super.getCityMap().get(cityId);
		Set<District> districtSet = city.getDistricts();
		
		for(District district:districtSet){
			district.setCity(null);
		}
		
		ajax(districtSet);
	}
	
	public void ajaxSchools(){
		if(cityId!=null || districtId==null){
			ajax("");
		}
		
		List<School> schoolList=new ArrayList<School>();
		
		for(School school:schoolService.getAllSchools(cityId, districtId)){
			School s = new School();
			s.setId(school.getId());
			s.setName(school.getName());
			schoolList.add(s);
		}
		
		ajax(schoolList);
	}
	
	public void ajaxClasses(){
		List<Classes> classesList= classesService.getActiveAll();
		
		List<ClassesJson> classesJsons= new ArrayList<ClassesJson>();
		for(Classes classes: classesList){
			if(classes.getSchool().getId()!=schoolId){
				continue;
			}
			ClassesJson classesJson = new ClassesJson();
			classesJson.setSchool_id(classes.getSchool().getId().toString());
			classesJson.setClass_name(classes.getSchool().getName());
			
			classesJson.setGrade_id(classes.getGrade().getId().toString());
			classesJson.setGrade_name(classes.getGrade().getName());
			classesJson.setGrade_phase(classes.getGrade().getPhase());
			
			classesJson.setClass_id(classes.getId().toString());
			classesJson.setClass_name(classes.getName());
			
			
			classesJsons.add(classesJson);
		}
		ajax(classesJsons);
	}

	public Long getCityId() {
		return cityId;
	}

	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}

	public Long getDistrictId() {
		return districtId;
	}

	public void setDistrictId(Long districtId) {
		this.districtId = districtId;
	}

	public Long getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(Long schoolId) {
		this.schoolId = schoolId;
	}

	public Long getGradeId() {
		return gradeId;
	}

	public void setGradeId(Long gradeId) {
		this.gradeId = gradeId;
	}

	public Long getClassesId() {
		return classesId;
	}

	public void setClassesId(Long classesId) {
		this.classesId = classesId;
	}
	
}