package com.kk.dao.factory.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.kk.dao.factory.UserOrgAssocDao;
import com.kk.dao.model.Organization;
import com.kk.dao.model.UserOrgAssoc;

@Repository("userOrgAssocDao")
public class UserOrgAssocDaoImpl extends GenericDaoImpl<UserOrgAssoc, Long> implements UserOrgAssocDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Organization> getOrganizationsByUser(Long id) throws Exception {
		String hql = "SELECT o from UserOrgAssoc uoa INNER JOIN uoa.organization o "
				+ " WHERE o.id = uoa.organization.id  AND uoa.user.id = :id";
		Query query = currentSession().createQuery(hql).setParameter("id",id);
		List<Organization> list = query.list();
		return list;
	}

}
