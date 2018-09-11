package com.kk.dao.factory.impl;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.reflect.FieldUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kk.core.kkenum.OrderEnum;
import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.factory.GenericDao;

@SuppressWarnings("unchecked")
@Repository
public abstract class GenericDaoImpl<E, K extends Serializable> 
        implements GenericDao<E, K> {
	
    @Autowired
    private SessionFactory sessionFactory;
     
    protected Class<? extends E> daoType;
     
    /**
    * By defining this class as abstract, we prevent Spring from creating 
    * instance of this class If not defined as abstract, 
    * getClass().getGenericSuperClass() would return Object. There would be 
    * exception because Object class does not have constructor with parameters.
    */
    @SuppressWarnings("rawtypes")
	public GenericDaoImpl() {
        Type t = getClass().getGenericSuperclass();
        ParameterizedType pt = (ParameterizedType) t;
        daoType = (Class) pt.getActualTypeArguments()[0];
    }
     
    protected Session currentSession() throws Exception {
        return sessionFactory.getCurrentSession();
    }
     
    public void add(E entity) throws Exception  {
        currentSession().save(entity);
    }
     
    public void saveOrUpdate(E entity) throws Exception {
        currentSession().saveOrUpdate(entity);
    }
     
    public void update(E entity) throws Exception {
        currentSession().saveOrUpdate(entity);
    }
     
    public void remove(E entity) throws Exception {
        currentSession().delete(entity);
    }
     
    public E find(K key) throws Exception {
        return (E) currentSession().get(daoType, key);
    }
     
    public List<E> getAll() throws Exception {
        return currentSession().createCriteria(daoType).list();
    }
    
    
    public List<E> findAllByOrder(String order, String... property) throws Exception {
        Criteria criteria = currentSession().createCriteria(daoType);
        getOrderByCriteria(criteria, order, property);
        return criteria.list();
    }
    
    public List<E> findAllByOrder(String order, String property) throws Exception {
        Criteria criteria = currentSession().createCriteria(daoType);
        getOrderByCriteria(criteria, order, property);
        return criteria.list();
    }
    
    public List<E> findAllByProperty(String property, String value) throws Exception {
        Criteria criteria = currentSession().createCriteria(daoType);
        try {
        	getCriteria(criteria, property, value);
		} catch (Exception e) {
			e.printStackTrace();
		}
        return criteria.list();
    }
    
    private <I, O> O convert(I input, Class<O> outputClass) throws Exception {
        return input == null ? null : outputClass.getConstructor(String.class).newInstance(input.toString());
    }
    
    private Criteria getCriteria(Criteria criteria, String property, String value) throws Exception{
    	Field field = null;
    	Field tempField2 = null;
		String[] temp = property.split("\\.");
		
		for (int i = 0; i < temp.length; i++) {
			if(i == 0){
				field = FieldUtils.getDeclaredField(daoType, temp[i], true);
				if(temp.length == 1){
					criteria.add(Restrictions.eq(temp[i],convert(value,field.getType())));
					return criteria;
				}
			}else{
				tempField2 = FieldUtils.getDeclaredField(field.getType(),  temp[i], true);
				criteria.createCriteria(temp[i-1]).add(Restrictions.eq(temp[i],convert(value,tempField2.getType())));
				field = tempField2;
			}
		}
    	
    	return criteria;
    }
    
    public List<E> findAllByQueryFilter(QueryFilterVO vo) throws Exception {
        Criteria criteria = currentSession().createCriteria(daoType);
        try {
        	getCriteria(criteria, vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
        return criteria.list();
    }
    
    private Criteria getCriteria(Criteria criteria, QueryFilterVO vo) throws Exception{
    	if(vo.getWhereClause().size() > 0){
    		for(Map.Entry<String, String> entry : vo.getWhereClause().entrySet()){
    			getCriteria(criteria, entry.getKey(), entry.getValue());
    		}
    	}
    	
    	if(StringUtils.isNotBlank(vo.getOrderByClause())){
    		
    		getOrderByCriteria(criteria, vo.getOrder() , vo.getOrderByClause());
    	}
    	return criteria;
    }
    
    private Criteria getOrderByCriteria(Criteria criteria, String order, String... property){
    	for(String  prop : property){
	        if(OrderEnum.ASC.toString().equals(order)){
	        	criteria.addOrder(org.hibernate.criterion.Order.asc(prop));
	        }else{
	        	criteria.addOrder(org.hibernate.criterion.Order.desc(prop));
	        }
        }
    	return criteria;
    }
    
    private Criteria getOrderByCriteria(Criteria criteria, String order, String property){
    	String[] props = property.split(",");
    	for(String  prop : props){
    		 if(OrderEnum.ASC.toString().equals(order)){
	        	criteria.addOrder(org.hibernate.criterion.Order.asc(prop));
	        }else{
	        	criteria.addOrder(org.hibernate.criterion.Order.desc(prop));
	        }
        }
    	return criteria;
    }
    
    public Long getTotalRows(QueryFilterVO vo) throws Exception {
    	 Criteria criteria = currentSession().createCriteria(daoType);
    	 criteria.setProjection(Projections.rowCount());
    	 getCriteria(criteria, vo);
    	 return (Long) criteria.uniqueResult(); 
    }
    
}