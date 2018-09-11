package com.kk.dao.factory;

import com.kk.dao.model.Subject;

public interface SubjectDao extends GenericDao<Subject, Long>{
	
	public Subject exists(String name, String orgId) throws Exception ;
	
}