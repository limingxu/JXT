package com.jxt.dao;

import java.io.Serializable;
import java.util.List;

import com.jxt.hql.Pagination;

public interface GenericDao<T, K extends Serializable>
{
	public T load(K id);
	
    /**
     * Retrieve an object that was previously persisted to the database using
     * 
     * @param id 主键
     * @return the entity
     */
    T get( K id );
    
    public List<T> getAll();

    /**
     * Persist the newInstance object into database
     * 
     * @param newInstance 新对象
     * @return the key of entity
     */
    K save( T newInstance );

    /**
     * Save changes made to a persistent object.
     * 
     * @param transientObject 持久化对象
     */
    void update( T transientObject );

    /**
     * Remove an object from persistent storage in the database
     * 
     * @param persistentObject 持久化对象
     */
    void delete( T persistentObject );
    
	void delete(K id);
	
	void delete(List<K> ids);
	
	public void delete(K[] ids);
	
	public void flush();

	public void evict(Object object);

	public void clear();

    /**
     * Tied an object from persistent persisted in the database
     * 
     * @param id 主键
     */
    void lock( T obj );

    /**
	 * 判断域对象的某一属性是否存在相同值,排除所给id所代表的对象
	 * 
	 * @param domainClass 要查询的domain类
	 * @param propertyName 要判断的domain类属性
	 * @param propertyValue 要判断的domain类属性值
	 * @param exceptKey 要添加例外的主键值,没有可以为null
	 * @return boolean true:数据库存在此属性值;false:不存在
	 */
	boolean isExistPropertyValueExceptId(Class<T> domainClass, String propertyName, Object propertyValue,
	        K exceptKey);
	
	Pagination<T> getPaginationByPropertyLike(String property,String value,int currentPage,int pageSize);
}
