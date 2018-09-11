package com.kk.dao.factory;

import com.kk.dao.model.Course;

public interface CourseDao extends GenericDao<Course, Long>{
	
	public Course exists(String name, String orgId) throws Exception ;
	
}