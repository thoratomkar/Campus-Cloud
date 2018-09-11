package com.kk.dao.service;

import com.kk.dao.model.RolesPrivileges;

public interface RolesPrivilegesService extends GenericService<RolesPrivileges,Long> {

	void save(Long roleId, Long privilegeId);
	
	Boolean exists(Long roleId, Long privilegeId);
}