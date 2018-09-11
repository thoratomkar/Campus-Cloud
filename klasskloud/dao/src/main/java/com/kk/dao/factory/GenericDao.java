package com.kk.dao.factory;

import java.util.List;

import com.kk.core.vo.QueryFilterVO;

public interface GenericDao<E, K> {
	public void add(E entity) throws Exception;

	public void saveOrUpdate(E entity) throws Exception;

	public void update(E entity) throws Exception;

	public void remove(E entity) throws Exception;

	public E find(K key) throws Exception;

	public List<E> getAll() throws Exception;

	public List<E> findAllByOrder(String order, String property) throws Exception;

	public List<E> findAllByOrder(String order, String... property) throws Exception;

	public List<E> findAllByProperty(String property, String value) throws Exception;

	public List<E> findAllByQueryFilter(QueryFilterVO vo) throws Exception;
	
	public Long getTotalRows(QueryFilterVO vo) throws Exception;
}