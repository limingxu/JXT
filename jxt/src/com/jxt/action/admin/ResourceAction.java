package com.jxt.action.admin;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.jxt.entity.City;
import com.jxt.entity.District;
import com.jxt.service.DistrictService;


@ParentPackage("admin")
public class ResourceAction extends BaseAction {

	private static final long serialVersionUID = -6296393115930477663L;
	
	private Long cityId;
	
	@Resource(name="districtServiceImpl")
	private DistrictService districtService;
	
	public void ajaxGetDistrictByCityId() {
		City city = (City) super.getCityMap().get(cityId);
		
		List<District> districtList = districtService.getAllDistricts(city);
		ajax(districtList);
	}

	public Long getCityId() {
		return cityId;
	}

	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}
	
	
}