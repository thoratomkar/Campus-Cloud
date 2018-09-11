package com.kk.dao.service;

import com.kk.core.vo.TimetableVO;
import com.kk.dao.model.Organization;
import com.kk.dao.model.Timetable;

public interface TimetableService extends GenericService<Timetable,Long> {
	
	Timetable exists(Long classid) throws Exception;
	
	Boolean save(TimetableVO vo,Organization organization);

	void update(TimetableVO vo) throws Exception;
	
	Timetable getTimetableByClassAndDay(TimetableVO timetableVO) throws Exception;
}
