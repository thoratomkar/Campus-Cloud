package com.kk.dao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.factory.GenericDao;
import com.kk.dao.service.GenericService;

@Service
public abstract class GenericServiceImpl<E, K> implements GenericService<E, K> {

    @Autowired
	private GenericDao<E, K> genericDao;

    public GenericServiceImpl(GenericDao<E,K> genericDao) {
        this.genericDao=genericDao;
    }

    public GenericServiceImpl() {
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void saveOrUpdate(E entity) throws Exception  {
        genericDao.saveOrUpdate(entity);
    }

    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public List<E> getAll() throws Exception {
        return genericDao.getAll();
    }

    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public E get(K id) throws Exception  {
        return genericDao.find(id);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void add(E entity) throws Exception  {
        genericDao.add(entity);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void update(E entity) throws Exception  {
        genericDao.update(entity);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void remove(E entity) throws Exception  {
        genericDao.remove(entity);
    }
    
    @Transactional(propagation = Propagation.REQUIRED)
    public List<E> findAllByOrder(String order, String property) throws Exception {
    	return genericDao.findAllByOrder(order, property);
    }
    
    @Transactional(propagation = Propagation.REQUIRED)
    public List<E> findAllByOrder(String order, String... property) throws Exception {
    	return genericDao.findAllByOrder(order, property);
    }
    
    @Transactional(propagation = Propagation.REQUIRED)
    public List<E> findAllByProperty(String property, String value) throws Exception{
    	return genericDao.findAllByProperty(property, value);
    }
    
    @Transactional(propagation = Propagation.REQUIRED)
    public List<E> findAllByQueryFilter(QueryFilterVO vo) throws Exception {
    	return genericDao.findAllByQueryFilter(vo);
    }
    
    @Transactional(propagation = Propagation.REQUIRED)
    public Long getTotalRows(QueryFilterVO vo) throws Exception {
    	return genericDao.getTotalRows(vo);
    }
    
}
