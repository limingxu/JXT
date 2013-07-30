package com.jxt.util;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.FatalBeanException;
import org.springframework.util.Assert;

/**
 * @author cyc
 */
public class BeanUtil extends BeanUtils {
	/**
	 * 修改源码,加入对source中空值属性的控制
	 */
	private static void copyProperties(Object source, Object target, Class<?> editable, String[] ignoreProperties,
	        boolean isIgnoreNull) throws BeansException {

		Assert.notNull(source, "Source must not be null");
		Assert.notNull(target, "Target must not be null");

		Class<?> actualEditable = target.getClass();
		if (editable != null) {
			if (!editable.isInstance(target)) {
				throw new IllegalArgumentException("Target class [" + target.getClass().getName()
				        + "] not assignable to Editable class [" + editable.getName() + "]");
			}
			actualEditable = editable;
		}
		PropertyDescriptor[] targetPds = getPropertyDescriptors(actualEditable);
		List<String> ignoreList = (ignoreProperties != null) ? Arrays.asList(ignoreProperties) : null;

		for (PropertyDescriptor targetPd : targetPds) {
			if (targetPd.getWriteMethod() != null
			        && (ignoreProperties == null || (!ignoreList.contains(targetPd.getName())))) {
				PropertyDescriptor sourcePd = getPropertyDescriptor(source.getClass(), targetPd.getName());
				if (sourcePd != null && sourcePd.getReadMethod() != null) {
					try {
						Method readMethod = sourcePd.getReadMethod();
						if (!Modifier.isPublic(readMethod.getDeclaringClass().getModifiers())) {
							readMethod.setAccessible(true);
						}
						Object value = readMethod.invoke(source);
						if (isIgnoreNull && null == value)
							continue;
						Method writeMethod = targetPd.getWriteMethod();
						if (!Modifier.isPublic(writeMethod.getDeclaringClass().getModifiers())) {
							writeMethod.setAccessible(true);
						}
						writeMethod.invoke(target, value);
					} catch (Throwable ex) {
						throw new FatalBeanException("Could not copy properties from source to target", ex);
					}
				}
			}
		}
	}

	/**
	 * 复制对象属性,忽略source中空值属性以及<code>ignoreProperties</code>指定属性的复制
	 */
	public static void copyPropertiesIgnoreNull(Object source, Object target, String[] ignoreProperties)
	        throws BeansException {
		copyProperties(source, target, null, ignoreProperties, true);
	}

	/**
	 * 复制对象属性,忽略source中空值属性的复制
	 */
	public static void copyPropertiesIgnoreNull(Object source, Object target) throws BeansException {
		copyProperties(source, target, null, null, true);
	}

	/**
	 * 将类变量的name,value对转换为map
	 * 
	 * @param clazz
	 * @return 类变量的name,value对
	 * @author ycchang
	 */
	public static Map<String, Object> generateMap(Class<?> clazz) {
		Map<String, Object> map = new HashMap<String, Object>();
		Field[] fields = clazz.getDeclaredFields();
		try {
			for (Field field : fields) {
				String name = field.getName();
				Object value = field.get(null);
				map.put(name, value);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 将对象属性的name,value对转换为map
	 * 
	 * @param o 要转化的对象
	 * @return 对象属性的name,value对
	 * @author ycchang
	 */
	public static Map<String, Object> generateMap(Object o) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (null == o)
			return map;
		Class<?> clazz = o.getClass();
		PropertyDescriptor[] pds = getPropertyDescriptors(clazz);
		for (PropertyDescriptor pd : pds) {
			try {
				Method readMethod = pd.getReadMethod();
				if (!Modifier.isPublic(readMethod.getDeclaringClass().getModifiers())) {
					readMethod.setAccessible(true);
				}
				Object value = readMethod.invoke(o);
				map.put(pd.getName(), value);
			} catch (Throwable ex) {
				throw new FatalBeanException("Could not generate map from " + o.getClass(), ex);
			}
		}
		return map;
	}

	/**
	 * 将public类变量的value放入Set
	 * 
	 * @param clazz
	 * @return Set public 变量值集合
	 * @author ycchang
	 */
	public static <I> Set<I> generateSet(Class<?> clazz) {
		Set<I> set = new HashSet<I>();
		Field[] fields = clazz.getDeclaredFields();
		try {
			for (Field field : fields) {
				if (Modifier.isPublic(field.getModifiers()))
					set.add((I) field.get(null));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return set;
	}
	
//	public static void main(String[] args) {
//	    Tester tester = new Tester();
//	    tester.setStatus(Short.valueOf("5"));
//	    tester.setName("");
//	    tester.setDatetime(new Date());
//	    tester.setId(12L);
//	    Map<String,Object> map = generateMap(tester);
//	    System.out.println(map);
//    }
}
