package com.jxt.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.jxt.common.Pager;
import com.jxt.dao.GenericDao;
import com.jxt.hql.Pagination;
import com.jxt.service.BaseService;


@Transactional
public class BaseServiceImpl<T, PK extends Serializable> implements BaseService<T, PK> {

	private GenericDao<T, PK> baseDao;

	public GenericDao<T, PK> getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(GenericDao<T, PK> baseDao) {
		this.baseDao = baseDao;
	}
	
	@Transactional(readOnly = true)
	public T get(PK id) {
		return baseDao.get(id);
	}

	@Transactional
	public PK save(T entity) {
		return baseDao.save(entity);
	}

	@Transactional
	public void update(T entity) {
		baseDao.update(entity);
	}
	
	@Transactional
	public void delete(T entity) {
		baseDao.delete(entity);
	}

	@Override
	public void delete(PK id) {
		baseDao.delete(id);
	}

	@Override
	public void delete(PK[] ids) {
		baseDao.delete(ids);
	}

	@Override
	public T load(PK id) {
		return baseDao.load(id);
	}

	@Override
	public List<T> getAll() {
		return baseDao.getAll();
	}

	@Override
	public Pager pagerByPropertyLike(Pager pager) {
		String property = pager.getSearchBy();
		String value = pager.getKeyword();
		Pagination<T> pagination = baseDao.getPaginationByPropertyLike(property, value, pager.getPageNumber(), pager.getPageSize());
		return Pager.pagination2pager(pagination, pager);
	}
}