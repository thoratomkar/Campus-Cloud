package com.kk.dao.factory;

import java.util.List;

import com.kk.dao.model.Organization;
import com.kk.dao.model.UserOrgAssoc;

public interface UserOrgAssocDao extends GenericDao<UserOrgAssoc, Long>{
	
	public List<Organization> getOrganizationsByUser(Long id) throws Exception;
	
}