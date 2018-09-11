package com.kk.dao.factory.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.kk.dao.factory.RoleDao;
import com.kk.dao.model.Role;

@Repository("roleDao")
public class RoleDaoImpl extends GenericDaoImpl<Role, Long> implements RoleDao {

	@SuppressWarnings("unchecked")
	public Role findByRoleName(String roleName) throws Exception {
		List<Role> roles = new ArrayList<Role>();
		roles = currentSession().createQuery("from Role where name=(:roleName)")
				.setParameter("roleName", roleName).list();
		if (roles.size() > 0) {
			return roles.get(0);
		} else {
			return null;
		}
	}
}
