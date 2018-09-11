package com.kk.dao.factory;

import com.kk.dao.model.RolesPrivileges;

public interface RolesPrivilegesDao extends GenericDao<RolesPrivileges,Long>{
	
	void save(Long roleId, Long privilegeId);

	Boolean exists(Long roleId, Long privilegeId);
	
}