package com.kk.dao.factory;

import com.kk.dao.model.Role;

public interface RoleDao extends GenericDao<Role, Long>{
	
	Role findByRoleName(String roleName) throws Exception;
	
}