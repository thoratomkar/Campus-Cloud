package com.kk.dao.factory.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import com.kk.dao.factory.TimetableDao;
import com.kk.dao.model.Timetable;

@Repository("timetableDao")
public class TimetableDaoImpl extends GenericDaoImpl<Timetable,Long> implements TimetableDao{
	@Override
	public Timetable exists(Long id)throws Exception{
		Timetable result = null;
		Criteria crit = currentSession().createCriteria(Timetable.class);
		crit.add(Restrictions.eq("id",id));
		@SuppressWarnings("unchecked")
		List<Timetable> list = crit.list();
		if(!CollectionUtils.isEmpty(list)) result = list.get(0);
		return result;
	}
}
