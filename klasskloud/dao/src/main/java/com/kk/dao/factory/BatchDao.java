package com.kk.dao.factory;

import com.kk.dao.model.Batch;

public interface BatchDao extends GenericDao<Batch, Long>{
	
	public Batch exists(String name, String orgId) throws Exception ;
}