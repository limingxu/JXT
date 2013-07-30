package com.jxt.common;

import java.lang.reflect.Field;
import java.util.Map;

import com.jxt.util.BeanUtil;

/**
 * 统一i18n消息键
 * 
 *@author ycchang
 */
public abstract class I18nKeys {
	/** 定义map方便在ftl中使用 */
	public static Map<String, Object> shopKey,busiAreaKey;
	static{
		/** 装载并生成map*/
		shopKey = BeanUtil.generateMap(fieldname2value(ShopKeys.class));
		busiAreaKey = BeanUtil.generateMap(fieldname2value(BusiAreaKeys.class));
	}
	
	public interface ShopKeys{
		String v_shop_name_required="v_shop_name_required";
		String v_shop_position_required="v_shop_position_required";
		String v_shop_category_required="v_shop_category_required";
		String v_shop_busiarea_required="v_shop_busiarea_required";
		
		String v_shop_name_length="v_shop_name_length";
		String v_shop_position_length="v_shop_position_length";
		String v_shop_addr_length="v_shop_addr_length";
		String v_shop_contact_length="v_shop_contact_length";
		String v_shop_officephone_length="v_shop_officephone_length";
		String v_shop_mobilephone_length="v_shop_mobilephone_length";
		String v_shop_des_length="v_shop_des_length";
		String v_shop_major_length="v_shop_major_length";
		String v_shop_qq_length="v_shop_qq_length";
		
		String v_shop_name_exists="v_shop_name_exists";
		String v_shop_has_goods="v_shop_has_goods";
		String e_shop_ico_upload = "e_shop_ico_upload";
	}
	
	public interface BusiAreaKeys{
		String v_busiarea_name_required="v_busiarea_name_required";
		String v_busiarea_name_length="v_busiarea_name_length";
		String v_busiarea_major_length="v_busiarea_major_length";
		String v_busiarea_addr_length="v_busiarea_addr_length";
		String v_busiarea_sort_int="v_busiarea_sort_int";
		String v_busiarea_name_exists="v_busiarea_name_exists";
		String e_busiarea_ico_upload="e_busiarea_ico_upload";
		String e_busiarea_del_exists_shop="e_busiarea_del_exists_shop";
		String e_busiarea_del_exists_sub="e_busiarea_del_exists_sub";
		String v_busiarea_parentid_length = "v_busiarea_parentid_length";
	}
	
	private static <T> Class<T> fieldname2value(Class<T> clazz) {
		Field[] fs = clazz.getFields();
		String name;
		Object value;
		try {
			for (Field f : fs) {
				name = f.getName();
				value = f.get(null);
				if(null==value || value.toString().trim().equals(""))
					f.set(null, name.toLowerCase().replace('_', '.'));
			}
		} catch (Exception e) {
			throw new RuntimeException("[error]MessageKeys.fieldname2value:"
					+ e.getMessage(), e.getCause());
		}
		return clazz;
	}
}
