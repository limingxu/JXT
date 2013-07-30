package com.jxt.common;

import java.util.Map;

import com.jxt.util.BeanUtil;


/**
 * 统一管理配置键
 * 
 * @author ycchang
 */
public abstract class ConfigKeys {
	/** 定位配置文件 */
	private static final String SYS_CONFIG_FILE = "classpath:sys.properties";
	
	public static Configuration SysConfig = Configuration.getConfig(SYS_CONFIG_FILE);
	
	/** 定义map方便在ftl中使用 */
	public static Map<String, Object> shopKeys, sizeKeys,paginationKeys;

	static {
		/** 装载并生成map*/
		shopKeys = BeanUtil.generateMap(ShopKeys.class);
		sizeKeys = BeanUtil.generateMap(SizeKeys.class);
		paginationKeys = BeanUtil.generateMap(PaginationKeys.class);
	}
	
	public interface ShopKeys {
		String configfile = SYS_CONFIG_FILE;
		String HIGHLIGHTER_PRE="highlighter.pre";
		String HIGHLIGHTER_POST="highlighter.post";
		String OUTSIEDE_SUGGESTION_URL="outsiede.suggestion.url";
	}
	
	public interface SizeKeys {
		String configfile = SYS_CONFIG_FILE;
		String TAG_HOTGOODS_COUNT="tag.hotgoods.count";
		String TAG_RECOMMANDGOODS_COUNT="tag.recommandgoods.count";
	}
	
	public interface PaginationKeys {
		String configfile = SYS_CONFIG_FILE;
		String PAGINATION_SHOP_GOODS_SIZE="pagination.shop.goods.size";
		String PAGINATION_SHOP_SEARCH_SIZE="pagination.shop.search.size";
		String PAGINATION_GOODS_SEARCH_SIZE="pagination.goods.search.size";
		String PAGINATION_INDEX_SHOP_SIZE="pagination.index.shop.size";
		String PAGINATION_GOODS_FAVORITE_SIZE="pagination.goods.favorite.size";
		String PAGINATION_SHOPERINDEX_GOODS_SIZE="pagination.shoperindex.goods.size";
	}
	
//	/**
//	 * 为定义键的类根据属性名生成默认properties文件中的key值，只针对属性值不存在的key，存在的不变。
//	 * 规则：key=属性名全部改为小写并将'_'改为'.'.
//	 * 
//	 * @param clazz 
//	 * @return Class<T>
//	 */
//	private static <T> Class<T> fieldname2value(Class<T> clazz) {
//		Field[] fs = clazz.getFields();
//		String name;
//		Object value;
//		try {
//			for (Field f : fs) {
//				name = f.getName();
//				value = f.get(null);
//				if(null==value || value.toString().trim().equals(""))
//					f.set(null, name.toLowerCase().replace('_', '.'));
//			}
//		} catch (Exception e) {
//			throw new RuntimeException("[error]ConfigKeys.fieldname2value:"
//					+ e.getMessage(), e.getCause());
//		}
//		return clazz;
//	}
}
