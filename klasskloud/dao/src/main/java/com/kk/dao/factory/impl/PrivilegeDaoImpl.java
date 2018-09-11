package com.kk.dao.factory.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import com.kk.dao.factory.PrivilegeDao;
import com.kk.dao.model.Privilege;

@Repository("privilegeDao")
public class PrivilegeDaoImpl extends GenericDaoImpl<Privilege, Long> implements PrivilegeDao {

	@SuppressWarnings("unchecked")
	public Privilege exists(Long moduleId, Long operationId) throws Exception {
		Privilege result = null;
		Criteria crit = currentSession().createCriteria(Privilege.class);
		crit.add(Restrictions.eq("module.id",moduleId));
		crit.add(Restrictions.eq("operation.id",operationId));
		List<Privilege> list = crit.list();
		if(!CollectionUtils.isEmpty(list)) result = list.get(0);
		return result;
	}


}