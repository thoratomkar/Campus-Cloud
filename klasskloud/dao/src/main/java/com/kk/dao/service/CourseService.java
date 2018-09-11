package com.kk.dao.service;

import com.kk.core.vo.CourseVO;
import com.kk.dao.model.Course;
import com.kk.dao.model.Organization;

public interface CourseService extends GenericService<Course, Long> {

	Course exists(String name, String orgId) throws Exception;
	
	Boolean save(CourseVO vo, Organization organization) throws Exception;

	Boolean update(CourseVO vo) throws Exception;
	
	public Course getCourseByNameAndCode(CourseVO courseVO) throws Exception;
}