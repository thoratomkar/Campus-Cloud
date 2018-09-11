package com.kk.dao.factory.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import com.kk.dao.factory.RolesPrivilegesDao;
import com.kk.dao.model.RolesPrivileges;

@Repository("rolesPrivilegesDao")
public class RolesPrivilegesDaoImpl  extends GenericDaoImpl<RolesPrivileges,Long> implements RolesPrivilegesDao {
	
	@Autowired
    private SessionFactory sessionFactory;

	public void save(Long roleId, Long privilegeId) {
		RolesPrivileges rolesPrivileges =  new RolesPrivileges(roleId, privilegeId);
		sessionFactory.getCurrentSession().save(rolesPrivileges);
	}

	@SuppressWarnings("unchecked")
	public Boolean exists(Long roleId, Long privilegeId) {
		Boolean result = Boolean.FALSE;
		Criteria crit = sessionFactory.getCurrentSession().createCriteria(RolesPrivileges.class);
		crit.add(Restrictions.eq("roleId",roleId));
		crit.add(Restrictions.eq("privilegeId",privilegeId));
		List<RolesPrivileges> list = crit.list();
		if(!CollectionUtils.isEmpty(list)) result = Boolean.TRUE;
		return result;
	}


}