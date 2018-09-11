package com.kk.dao.service;

import java.util.List;

import com.kk.core.vo.AttendanceVO;
import com.kk.dao.model.Attendance;

public interface AttendanceService extends GenericService<Attendance,Long>{

	Attendance exists(String rollno, Long subjectId, Long sectionId) throws Exception;
	
	Boolean save(AttendanceVO vo);

	void update(AttendanceVO vo) throws Exception;
	
	List<Attendance> getAllAttendanceForSection(Long sectionId, Long subjectId) throws Exception;
	
}
