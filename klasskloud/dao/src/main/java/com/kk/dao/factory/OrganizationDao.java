package com.kk.dao.factory;

import com.kk.dao.model.Organization;

public interface OrganizationDao extends GenericDao<Organization, Long>{
	
	Organization exists(String name) throws Exception;
	
}