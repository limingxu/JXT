package com.jxt.action.admin;

import java.util.Set;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.jxt.entity.City;
import com.jxt.entity.District;


@ParentPackage("admin")
public class ResourceAction extends BaseAction {

	private static final long serialVersionUID = -6296393115930477663L;
	
	private Long cityId;
	
	
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

	public Long getCityId() {
		return cityId;
	}

	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}
	
	
}