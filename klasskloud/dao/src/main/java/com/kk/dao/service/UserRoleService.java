package com.kk.dao.service;

import com.kk.dao.model.Role;
import com.kk.dao.model.User;
import com.kk.dao.model.UserRole;

public interface UserRoleService  extends GenericService<UserRole,Long> {
	
	UserRole save(User user, Role role) throws Exception;
	
	Role getRole(Long id) throws Exception;
}
