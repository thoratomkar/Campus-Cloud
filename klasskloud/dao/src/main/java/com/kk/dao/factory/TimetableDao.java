package com.kk.dao.factory;

import com.kk.dao.model.Timetable;

public interface TimetableDao extends GenericDao<Timetable,Long>{
	Timetable exists(Long classid) throws Exception;
}
