package com.kk.dao.factory.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import com.kk.dao.factory.ModuleDao;
import com.kk.dao.model.Module;

@Repository("moduleDao")
public class ModuleDaoImpl extends GenericDaoImpl<Module, Long> implements ModuleDao {

	@Override
	public Module exists(String name) throws Exception {
		Module result = null;
		Criteria crit = currentSession().createCriteria(Module.class);
		crit.add(Restrictions.eq("name",name));
		@SuppressWarnings("unchecked")
		List<Module> list = crit.list();
		if(!CollectionUtils.isEmpty(list)) result = list.get(0);
		return result;
	}


}