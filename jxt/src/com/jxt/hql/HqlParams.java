package com.jxt.hql;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import com.jxt.util.BeanUtil;

/**
 * 简单参数集合封装类
 * 
 * @author cyc
 * @version $Revision: 415 $
 * @since $Date: 2010-08-01 16:22:14 +0800 (Sat, 01 Aug 2009) $
 */
public class HqlParams {
	private Collection<Param> params = new ArrayList<Param>();

	private Map<String, Object> properties = new HashMap<String, Object>();
	
	public static final String ASC = "asc";
	public static final String DESC = "desc";
	
	public static final Boolean TRUE = Boolean.TRUE;
	public static final Boolean FALSE = Boolean.FALSE;
	/**
	 * 加入param对象
	 * 
	 * @param param 参数封装类
	 */
	public void add(Param param) {
		params.add(param);
		properties.put(param.getName(), param.getValue());
	}

	/**
	 * 将map组装为没有isOR属性的param对象并加入
	 * 
	 * @param map 参数集合
	 */
	public void add(Map<String, Object> map) {
		Set<String> keySet = map.keySet();
		for (String key : keySet) {
			add(new Param(key, map.get(key)));
		}
	}
	
	public void add(String key, Object value) {
			add(new Param(key, value));
	}

	/**
	 * 将POJO对象的属性名和值最为键值对转换为map并加入
	 * 
	 * @param o POJO
	 */
	public void add(Object o) {
		try {
			Map<String, Object> map = BeanUtil.generateMap(o);
			add(map);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * @return Map<String, Object>
	 */
	public Map<String, Object> getProperties() {
		return properties;
	}

	/**
	 * @return Collection<Param>
	 */
	public Collection<Param> getParams() {
		return params;
	}
}
