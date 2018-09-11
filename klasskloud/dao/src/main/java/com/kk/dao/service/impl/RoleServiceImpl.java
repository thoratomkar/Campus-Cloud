package com.kk.dao.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kk.dao.factory.RoleDao;
import com.kk.dao.model.Role;
import com.kk.dao.service.RoleService;

@Service
@Transactional(rollbackOn = Exception.class)
public class RoleServiceImpl extends GenericServiceImpl<Role,Long> implements RoleService{

	@Autowired
	private RoleDao roleDao;
	
	@Override
	public Role findByRoleName(String roleName) throws Exception {
		return roleDao.findByRoleName(roleName);
	}

	
	
}