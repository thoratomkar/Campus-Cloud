package com.kk.dao.factory;

import com.kk.dao.model.UserRole;

public interface UserRoleDao extends GenericDao<UserRole, Long>{
	
	UserRole findByUserRoleName(String userRoleName) throws Exception;
	
}