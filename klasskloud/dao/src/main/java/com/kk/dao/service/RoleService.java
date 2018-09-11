package com.kk.dao.service;

import com.kk.dao.model.Role;

public interface RoleService  extends GenericService<Role,Long>{
	
	Role findByRoleName(String roleName) throws Exception;
}