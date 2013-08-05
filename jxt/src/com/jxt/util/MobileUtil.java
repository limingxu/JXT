package com.jxt.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.xml.sax.InputSource;

public class MobileUtil {
	
	 protected static List<String> UNICOM = new ArrayList<String>();
	 
	 static{
		 UNICOM.add("130");
		 UNICOM.add("131");
		 UNICOM.add("132");
		 UNICOM.add("156");
		 UNICOM.add("186");
		 UNICOM.add("185");
	 }
	 
	/**
	 * 获取URL返回的字符串
	 * @param callurl
	 * @param charset
	 * @return
	 */
	private static String callUrlByGet(String callurl,String charset){    
		String result = "";    
		try {    
			URL url = new URL(callurl);    
			URLConnection connection = url.openConnection();    
			connection.connect();    
			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(),charset));    
			String line;    
			while((line = reader.readLine())!= null){     
				result += line;    
				result += "\n";
			}
		} catch (Exception e) {    
			e.printStackTrace();    
			return "";
		}
		return result;
	}
	/**
	 * 手机号码归属地
	 * @param tel  手机号码
	 * @return 135XXXXXXXX,联通/移动/电信,安徽合肥
	 * @throws Exception
	 * @author JIA-G-Y
	 */
	public static String getMobileLocation(String tel) throws Exception{
		Pattern pattern = Pattern.compile("1\\d{10}");
		Matcher matcher = pattern.matcher(tel);
		if(matcher.matches()){
			String url = "http://life.tenpay.com/cgi-bin/mobile/MobileQueryAttribution.cgi?chgmobile=" + tel;
			String result = callUrlByGet(url,"GBK");
			StringReader stringReader = new StringReader(result);  
			InputSource inputSource = new InputSource(stringReader);  
			DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();  
			DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();  
			Document document = documentBuilder.parse(inputSource);
			String retmsg = document.getElementsByTagName("retmsg").item(0).getFirstChild().getNodeValue();
			if(retmsg.equals("OK")){
				String supplier = document.getElementsByTagName("supplier").item(0).getFirstChild().getNodeValue().trim();
				String province = document.getElementsByTagName("province").item(0).getFirstChild().getNodeValue().trim();
				String city = document.getElementsByTagName("city").item(0).getFirstChild().getNodeValue().trim();
				return (tel + "," + supplier + ","+ province +","+city);
			}else {
				return "";
			}
		}else{
			throw new IllegalArgumentException("手机格式不符合规范");
		}
	}
	
	public static boolean isUNICOMPhone(String tel){
		return UNICOM.contains(tel);
	}
	
	
	public static void main(String[] args) throws Exception{
		System.out.println(getMobileLocation("18356133070"));
	}
}