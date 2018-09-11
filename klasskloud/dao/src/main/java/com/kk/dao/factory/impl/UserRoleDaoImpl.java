package com.kk.dao.factory.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.kk.dao.factory.UserRoleDao;
import com.kk.dao.model.UserRole;

@Repository("userRoleDao")
public class UserRoleDaoImpl extends GenericDaoImpl<UserRole, Long> implements UserRoleDao {

	@SuppressWarnings("unchecked")
	public UserRole findByUserRoleName(String userRoleName) throws Exception {

		//Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
		//User user = (User) criteria.add(Restrictions.eq("usernamr", username)).uniqueResult();
		List<UserRole> userRoles = new ArrayList<UserRole>();

		userRoles = currentSession().createQuery("from UserRole where role=(:userRoleName)")
				.setParameter("userRoleName", userRoleName).list();

		if (userRoles.size() > 0) {
			return userRoles.get(0);
		} else {
			return null;
		}

	}


}
