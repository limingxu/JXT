<<<<<<< HEAD
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
import com.jxt.entity.SmsStatus;
import com.jxt.service.BusiStatusService;
import com.jxt.service.CityService;
import com.jxt.service.SmsStatusService;


@Component("Initializable")
public class InitializableApplicationListener implements ApplicationListener, ServletContextAware {
	
	@Resource(name="cityServiceImpl")
	private CityService cityService;
	@Resource(name="smsStatusServiceImpl")
	private SmsStatusService smsStatusService;
	@Resource(name="busiStatusServiceImpl")
	private BusiStatusService busiStatusService;
	
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
					map.put(status.getId(), status);
				}
				BaseAction.setSmsStatusMap(map);
			}
			
			List<BusiStatus> busiStatusList = (List<BusiStatus>)busiStatusService.getAll();
			if(smsStatusList!=null && smsStatusList.size()>0){}{
				Map<String,BusiStatus> map = new HashMap<String,BusiStatus>();
				BaseAction.setBusiStatusList(busiStatusList);
				for(BusiStatus status : busiStatusList){
					map.put(status.getId(), status);
				}
				BaseAction.setBusiStatusMap(map);
			}
			isInit = true;
		}
	}
=======
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
import com.jxt.entity.SmsStatus;
import com.jxt.service.BusiStatusService;
import com.jxt.service.CityService;
import com.jxt.service.SmsStatusService;


@Component("Initializable")
public class InitializableApplicationListener implements ApplicationListener, ServletContextAware {
	
	@Resource(name="cityServiceImpl")
	private CityService cityService;
	@Resource(name="smsStatusServiceImpl")
	private SmsStatusService smsStatusService;
	@Resource(name="busiStatusServiceImpl")
	private BusiStatusService busiStatusService;
	
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
			}
			
			List<SmsStatus> smsStatusList = (List<SmsStatus>)smsStatusService.getAll();
			if(smsStatusList!=null && smsStatusList.size()>0){}{
				Map<String,SmsStatus> map = new HashMap<String,SmsStatus>();
				BaseAction.setSmsStatusList(smsStatusList);
				for(SmsStatus status : smsStatusList){
					map.put(status.getId(), status);
				}
			}
			
			List<BusiStatus> busiStatusList = (List<BusiStatus>)busiStatusService.getAll();
			if(smsStatusList!=null && smsStatusList.size()>0){}{
				Map<String,BusiStatus> map = new HashMap<String,BusiStatus>();
				BaseAction.setBusiStatusList(busiStatusList);
				for(BusiStatus status : busiStatusList){
					map.put(status.getId(), status);
				}
			}
			isInit = true;
		}
	}
>>>>>>> branch 'master' of https://github.com/limingxu/JXT.git
}
