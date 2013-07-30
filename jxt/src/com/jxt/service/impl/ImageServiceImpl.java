package com.jxt.service.impl;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ServletContextAware;

import com.jxt.common.Setting;
import com.jxt.service.ImageService;
import com.jxt.util.CommonUtil;
import com.jxt.util.ImageUtil;
import com.jxt.util.SettingUtil;


@Service("imageServiceImpl")
public class ImageServiceImpl implements ImageService, ServletContextAware {
	
	private ServletContext servletContext;
	
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
	
	public String uploadFile(File img,String prefix){
		Setting setting = SettingUtil.getSetting();
		String targetPath = setting.getImageUploadRealPath();
		String filePath = "";
        if (img != null) {
        	String imgFormatName = ImageUtil.getFormatName(img);
        	if(imgFormatName ==  null)
        		return null;
        	String fileName= prefix+CommonUtil.getUUID()+"."+imgFormatName;
        	filePath=targetPath+"/"+fileName;
        	File target = new File(servletContext.getRealPath(filePath));
            if (!target.getParentFile().exists())
            	target.getParentFile().mkdirs();
            try {
				FileUtils.copyFile(img, target);
			} catch (IOException e) {
				return null;
			}}
        return filePath;
	}
	
}