package com.kk.dao.factory;

import com.kk.dao.model.Privilege;

public interface PrivilegeDao extends GenericDao<Privilege, Long>{

	Privilege exists(Long moduleId, Long operationId) throws Exception;
	
	
}