package com.jxt.action.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.jxt.entity.City;
import com.jxt.entity.District;
import com.jxt.entity.School;
import com.jxt.service.SchoolService;


@ParentPackage("admin")
public class ResourceAction extends BaseAction {

	private static final long serialVersionUID = -6296393115930477663L;
	
	private Long cityId;
	private Long districtId;
	
	@Resource(name="schoolServiceImpl")
	private SchoolService schoolService;
	
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
}