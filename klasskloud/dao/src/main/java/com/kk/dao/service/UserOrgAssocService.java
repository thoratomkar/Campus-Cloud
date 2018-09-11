package com.kk.dao.service;

import java.util.List;

import com.kk.dao.model.Organization;
import com.kk.dao.model.User;
import com.kk.dao.model.UserOrgAssoc;

public interface UserOrgAssocService  extends GenericService<UserOrgAssoc,Long> {
	
	UserOrgAssoc save(User user, Organization organization) throws Exception;
	
	List<Organization> getOrganizationsByUser(Long id) throws Exception;
	
}
