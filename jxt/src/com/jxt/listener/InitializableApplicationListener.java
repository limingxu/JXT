package com.jxt.listener;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.ServletContextAware;

import com.jxt.action.admin.BaseAction;
import com.jxt.entity.BusiStatus;
import com.jxt.entity.City;
import com.jxt.entity.District;
import com.jxt.entity.Grade;
import com.jxt.entity.SmsStatus;
import com.jxt.service.BusiStatusService;
import com.jxt.service.CityService;
import com.jxt.service.DistrictService;
import com.jxt.service.GradeService;
import com.jxt.service.SmsStatusService;


@Component("Initializable")
public class InitializableApplicationListener implements ApplicationListener, ServletContextAware {
	
	@Resource(name="cityServiceImpl")
	private CityService cityService;
	@Resource(name="smsStatusServiceImpl")
	private SmsStatusService smsStatusService;
	@Resource(name="busiStatusServiceImpl")
	private BusiStatusService busiStatusService;
	
	@Resource(name="gradeServiceImpl")
	private GradeService gradeService;
	
	@Resource(name="districtServiceImpl")
	private DistrictService districtService;
	
	private ServletContext servletContext;
	private static boolean isInit = false;
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
	
	@Transactional
	public void onApplicationEvent(ApplicationEvent applicationEvent) {
		if(!isInit){
			List<City> cityList = (List<City>)cityService.getAll();
			if(cityList!=null && cityList.size()>0){}{
				Map<Long,City> map = new HashMap<Long,City>();
				BaseAction.setCityList(cityList);
				for(City city : cityList){
					map.put(city.getId(), city);
				}
				BaseAction.setCityMap(map);
			}
			
			List<SmsStatus> smsStatusList = (List<SmsStatus>)smsStatusService.getAll();
			if(smsStatusList!=null && smsStatusList.size()>0){}{
				Map<String,SmsStatus> map = new HashMap<String,SmsStatus>();
				BaseAction.setSmsStatusList(smsStatusList);
				for(SmsStatus status : smsStatusList){
					map.put(status.getId().toString(), status);
				}
				BaseAction.setSmsStatusMap(map);
			}
			
			List<BusiStatus> busiStatusList = (List<BusiStatus>)busiStatusService.getAll();
			if(smsStatusList!=null && smsStatusList.size()>0){}{
				Map<String,BusiStatus> map = new HashMap<String,BusiStatus>();
				BaseAction.setBusiStatusList(busiStatusList);
				for(BusiStatus status : busiStatusList){
					map.put(status.getId().toString(), status);
				}
				BaseAction.setBusiStatusMap(map);
			}
			
			List<Grade> gradeList = gradeService.getAll();
			if(gradeList!=null && gradeList.size()>0){}{
				BaseAction.setGradeList(gradeList);
				
				Map<Long,Grade> map = new HashMap<Long,Grade>();
				for(Grade grade : gradeList){
					map.put(grade.getId(), grade);
				}
				BaseAction.setGradeMap(map);
			}
			
			List<District> districtList = districtService.getAll();
			if(gradeList!=null && gradeList.size()>0){}{
				BaseAction.setDistrictList(districtList);
				
				Map<Long,District> map = new HashMap<Long,District>();
				for(District district : districtList){
					map.put(district.getId(), district);
				}
				BaseAction.setDistrictMap(map);
			}
			
			isInit = true;
		}
	}
}
