package com.kk.dao.factory.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.factory.CourseDao;
import com.kk.dao.model.Course;

@Repository("courseDao")
public class CourseDaoImpl extends GenericDaoImpl<Course, Long> implements CourseDao {

	@Override
	public Course exists(String name, String orgId) throws Exception {
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("name", name);
		vo.getWhereClause().put("organization.id", orgId);
		List<Course> list = findAllByQueryFilter(vo);
		Course result = null;
		if(!CollectionUtils.isEmpty(list)) result = list.get(0);
		return result;
	}
}
