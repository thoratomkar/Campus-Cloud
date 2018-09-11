package com.kk.dao.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kk.dao.factory.RolesPrivilegesDao;
import com.kk.dao.model.RolesPrivileges;
import com.kk.dao.service.RolesPrivilegesService;

@Service
@Transactional(rollbackOn = Exception.class)
public class RolesPrivilegesServiceImpl extends GenericServiceImpl<RolesPrivileges,Long> implements RolesPrivilegesService{

	@Autowired
	private RolesPrivilegesDao rolesPrivilegesDao;
	
	public void save(Long roleId, Long privilegeId) {
		rolesPrivilegesDao.save(roleId, privilegeId);
	}

	public Boolean exists(Long roleId, Long privilegeId) {
		return rolesPrivilegesDao.exists(roleId, privilegeId);
	}

	
}