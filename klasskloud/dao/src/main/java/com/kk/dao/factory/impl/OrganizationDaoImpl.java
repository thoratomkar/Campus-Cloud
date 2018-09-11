package com.kk.dao.factory.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import com.kk.dao.factory.OrganizationDao;
import com.kk.dao.model.Organization;

@Repository("organizationDao")
public class OrganizationDaoImpl extends GenericDaoImpl<Organization, Long> implements OrganizationDao {

	@Override
	public Organization exists(String name) throws Exception {
		Organization result = null;
		Criteria crit = currentSession().createCriteria(Organization.class);
		crit.add(Restrictions.eq("name",name));
		@SuppressWarnings("unchecked")
		List<Organization> list = crit.list();
		if(!CollectionUtils.isEmpty(list)) result = list.get(0);
		return result;
	}


}