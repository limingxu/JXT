package com.jxt.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.jxt.dao.GenericDao;
import com.jxt.hql.HqlParams;
import com.jxt.hql.HqlUtil;
import com.jxt.hql.Pagination;
import com.jxt.util.StringUtil;
import com.jxt.util.ValidateUtil;
@SuppressWarnings("unchecked")
public class GenericDaoImpl<T, K extends Serializable> extends HibernateDaoSupport implements GenericDao<T, K> {
	
	/**
	 * Logger for this class
	 */
	/**
	 * The type of domain
	 */
	protected Class<T> type;

	/**
	 * log日志中记录的方法名
	 */
	protected String method;
	
	@Resource(name = "sessionFactory")
    public void setMySessionFactory(SessionFactory sessionFactory){  
        super.setSessionFactory(sessionFactory);  
    }  

	/**
	 * Constructor
	 * 
	 * @param type The type of domain
	 */
	public GenericDaoImpl() {
		//super.setSessionFactory(sessionFactory);
		Class<?> c = getClass();
        Type type = c.getGenericSuperclass();
        if (type instanceof ParameterizedType) {
            Type[] parameterizedType = ((ParameterizedType) type).getActualTypeArguments();
            this.type = (Class<T>) parameterizedType[0];
        }
	}
	
	@Override
	public T load(K id) {
		return (T)this.getHibernateTemplate().load(type, id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.ufinity.lansin.dao.GenericDao#get(java.io.Serializable)
	 */
	@Override
	public T get(K id) {
		return (T)this.getHibernateTemplate().get(type, id);
	}
	
	public List<T> getAll(){
		String hql = "select a from "+type.getName()+" a";
		return findByHql(hql,null);
	}
	

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.ufinity.lansin.dao.GenericDao#update(java.lang.Object)
	 */
	@Override
	public void update(T obj) {
		HibernateTemplate template = getHibernateTemplate();
		template.update(obj);
		template.flush();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.ufinity.lansin.dao.GenericDao#delete(java.lang.Object)
	 */
	@Override
	public void delete(T obj) {
		HibernateTemplate template = getHibernateTemplate();
		template.delete(obj);
		template.flush();
	}
	
	@Override
	public void delete(K id) {
		HibernateTemplate template = getHibernateTemplate();
		T entity = (T)template.load(type, id);
		template.delete(entity);
		template.flush();
	}
	
	@Override
	public void delete(List<K> ids) {
		HibernateTemplate template = getHibernateTemplate();
		for(K id : ids){
			T entity = (T)template.load(type, id);
			template.delete(entity);
		}
		template.flush();
	}
	
	@Override
	public void delete(K[] ids) {
		HibernateTemplate template = getHibernateTemplate();
		for(K id : ids){
			T entity = (T)template.load(type, id);
			template.delete(entity);
		}
		template.flush();
	}
	
	public void flush() {
		getHibernateTemplate().flush();
	}

	public void evict(Object object) {
		getHibernateTemplate().evict(object);
	}

	public void clear() {
		getHibernateTemplate().clear();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.ufinity.lansin.dao.GenericDao#lock(java.io.Serializable)
	 */
	@Override
	public void lock(T obj) {
		getHibernateTemplate().lock(obj, LockMode.NONE);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.ufinity.lansin.dao.GenericDao#save(java.lang.Object)
	 */
	@Override
	public K save(T obj) {
		return (K) getHibernateTemplate().save(obj);
	}

	/**
	 * 根据hql获取分页对象
	 * 
	 * @param queryHql hql表达式
	 * @param properties 参数列表
	 * @param currentPage 当前页数
	 * @return Pager<E> 分页对象
	 */
	protected Pagination<T> getPagination(String countHql, String queryHql, Map<String, Object> properties,
	        int currentPage, int pageSize) {
		return this.getPagination(this.type, countHql, queryHql, properties, currentPage, pageSize);
	}

	/**
	 * 根据hql获取分页对象
	 * 
	 * @param <E> 结果类型
	 * @param clazz 结果类型
	 * @param countHql countHql
	 * @param queryHql queryHql
	 * @param properties 参数列表
	 * @param currentPage 当前页数
	 * @param pageSize 页大小
	 * @return 分页对象
	 */
	protected <E> Pagination<E> getPagination(Class<E> clazz, String countHql, String queryHql,
	        Map<String, Object> properties, int currentPage, int pageSize) {
		Object obj = getUniqueResult(countHql, properties);
		int totalRecords = ((Long) obj).intValue();
		Pagination<E> pagination = new Pagination<E>(totalRecords, pageSize, currentPage);
		if (totalRecords > 0) {
			List<E> list = findByHql(clazz, queryHql, properties, pagination.getCurrentPage(), pageSize);
			pagination.setEntityList(list);
		}
		return pagination;
	}

	/**
	 * 根据hql和参数获取满足条件的记录数
	 * 
	 * @param hql
	 * @param properties 参数
	 * @return int
	 */
	Object getUniqueResult(final String hql, final Map<String, Object> properties) {
		return this.getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				if (!ValidateUtil.isEmpty(properties))
					query.setProperties(properties);
				return query.uniqueResult();
			}
		});
	}

	/**
	 * 根据hql和参数获取分页数据
	 * 
	 * @param <E> 结果类型
	 * @param clazz 结果类型
	 * @param hql hql
	 * @param properties 参数
	 * @param currentPage 当前页
	 * @param pageSize 页大小
	 * @return 分页数据
	 */
	private <E> List<E> findByHql(Class<E> clazz, final String hql, final Map<String, Object> properties,
	        final int currentPage, final int pageSize) {
		return (List<E>) this.getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public List<E> doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				if (!ValidateUtil.isEmpty(properties))
					query.setProperties(properties);
				if (currentPage != 0) {
					query.setFirstResult((currentPage - 1) * pageSize);
					query.setMaxResults(pageSize);

					return query.list();
				}
				return null;
			}
		});
	}

	/**
	 * 根据hql和参数获取满足条件的记录
	 * 
	 * @param hql
	 * @param properties 参数
	 * @return 记录
	 */
	List<T> findByHql(final String hql, final Map<String, Object> properties) {
		return (List<T>)this.getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public List<T> doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				if(!ValidateUtil.isEmpty(properties))
					query.setProperties(properties);
				return query.list();
			}
		});
	}

	/**
	 * 根据hql和参数获取满足条件的记录
	 * 
	 * @param hql
	 * @param properties 参数
	 * @return 记录
	 */
	List<T> list(final String hql, final Map<String, Object> properties) {
		return this.list(this.type, hql, properties);
	}

	/**
	 * 根据hql和参数获取满足条件的记录
	 * 
	 * @param hql
	 * @param properties 参数
	 * @return 记录
	 */
	<E> List<E> list(Class<E> clazz, final String hql, final Map<String, Object> properties) {
		return (List<E>) this.getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public List<E> doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				query.setProperties(properties);
				return query.list();
			}
		});
	}

	/**
	 * @param its
	 * @return
	 */
//	private <E> List<E> iterateToList(Iterator<E> its) {
//		if (null == its)
//			return null;
//		List<E> list = new ArrayList<E>();
//		while (its.hasNext()) {
//			E t = its.next();
//			Hibernate.initialize(t);
//			list.add(t);
//		}
//		return list;
//	}

	/**
	 * 批量删除对象
	 * 
	 * @param its hibernate query查询出的Iterator对象
	 * @param batchSize 批大小
	 * @return 删除的个数
	 */
	int batchDelete(final String hql, final Map<String, Object> properties, final int batchSize) {

		return (Integer) this.getHibernateTemplate().execute(new HibernateCallback() {
			int removedCount = 0;
			@Override
			public Integer doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				if(!ValidateUtil.isEmpty(properties))
					query.setProperties(properties);

				Iterator<T> its = query.iterate();
				if (null == its)
					return 0;
				while (its.hasNext()) {
					session.delete(its.next());
					if (++removedCount % batchSize == 0) {
						session.flush();
						session.clear();
					}
				}
				session.flush();
				session.clear();

				return removedCount;
			}
		});
	}

	/**
	 * 返回指定名称的查询语句
	 * 
	 * @param queryName 查询名称
	 * @return 查询语句
	 */
	String getQueryString(final String queryName) {
		return (String)this.getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public String doInHibernate(Session session) throws HibernateException, SQLException {
				return session.getNamedQuery(queryName).getQueryString();
			}
		});
	}

	/**
	 * 执行命名查询
	 * 
	 * @param hql
	 * @param properties 参数
	 * @return 记录
	 */
	<E> List<E> executeNamedQuery(Class<E> clazz, final String queryName, final Map<String, Object> properties) {
		return (List<E>) this.getHibernateTemplate().execute(new HibernateCallback() {
			@Override
			public List<E> doInHibernate(Session session) throws HibernateException, SQLException {
				Query query = session.getNamedQuery(queryName);
				if(!ValidateUtil.isEmpty(properties)){
					query.setProperties(properties);
				}
				return query.list();
			}
		});
	}
 
	/** 
	 * @see com.ufinity.lansin.dao.GenericDao#isExistPropertyValueExceptId(java.lang.Class, java.lang.String, java.lang.Object, java.io.Serializable)
	 */
	@Override
	public boolean isExistPropertyValueExceptId(Class<T> domainClass, String propertyName, Object propertyValue,
	        K exceptKey) {
		if (ValidateUtil.isEmpty(propertyName) || ValidateUtil.isEmpty(propertyName)) {
			return false;
		}
		StringBuilder hql = new StringBuilder("select count(a) from " + domainClass.getSimpleName() + " a where a."
		        + propertyName + "=:propertyValue ");
		Map<String, Object> properties = new HashMap<String, Object>();
		properties.put("propertyValue", propertyValue);

		if (null != exceptKey) {
			hql.append(" and a.id <> :exceptKey");
			properties.put("exceptKey", exceptKey);
		}
		return Long.valueOf(getUniqueResult(hql.toString(), properties).toString()) > 0;
	}

	@Override
	public Pagination<T> getPaginationByPropertyLike(String property,String value, int currentPage, int pageSize) {
		String hql = "";
		if(property==null || property.trim().equals("")){
			hql = "select a from "+type.getName()+" a";
		}else{
			hql = "select a from "+type.getName()+" a where a."+property+" like :key";
		}
		HqlParams params = new HqlParams();
		params.add("key","%"+StringUtil.escapeMysqlLikeStr(value)+"%");
		String countHql = HqlUtil.generateCountHql(hql);
		return getPagination(countHql, hql, params.getProperties(), currentPage, pageSize);
	}
}

