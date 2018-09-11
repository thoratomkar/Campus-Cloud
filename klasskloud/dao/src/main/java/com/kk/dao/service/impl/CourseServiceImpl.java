package com.kk.dao.service.impl;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kk.core.vo.CourseVO;
import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.factory.CourseDao;
import com.kk.dao.model.Course;
import com.kk.dao.model.Organization;
import com.kk.dao.service.CourseService;

@Service
@Transactional(rollbackOn = Exception.class)
public class CourseServiceImpl extends GenericServiceImpl<Course, Long> implements CourseService {

	@Autowired
	private CourseDao courseDao;

	public Course exists(String name, String orgId) throws Exception {
		return courseDao.exists(name, orgId);
	}

	@Override
	public Boolean save(CourseVO vo, Organization organization) throws Exception {
		Boolean result = Boolean.FALSE;
		try {
			Course course = exists(vo.getName(), String.valueOf(organization.getId()));
			if (null != course && !course.getIsDeleted())
				return result;
			if (null == course)
				course = new Course();

			BeanUtils.copyProperties(vo,course);
			course.setOrganization(organization);
			course.setIsDeleted(Boolean.FALSE);
			if (null == course.getId())
				course.setCreatedAt(new Date());
			course.setUpdatedAt(new Date());
			saveOrUpdate(course);
			result = Boolean.TRUE;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Boolean update(CourseVO vo) throws Exception {
		Boolean result = Boolean.FALSE;
		try {
			Course course = get(vo.getId());
			if (!course.getName().equalsIgnoreCase(vo.getName())) {
				Course course1 = exists(vo.getName(), String.valueOf(vo.getOrgId()));
				if (null != course1)
					return result;
			}
			course.setName(vo.getName());
			course.setCode(vo.getCode());
			course.setDescription(vo.getDescription());
			course.setUpdatedAt(new Date());
			update(course);
			result = Boolean.TRUE;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public Course getCourseByNameAndCode(CourseVO courseVO) throws Exception{
		Course course = null;
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("isDeleted",Boolean.FALSE.toString());
		vo.getWhereClause().put("name",courseVO.getName());
		vo.getWhereClause().put("code", courseVO.getCode());
		
		List<Course> cList = courseDao.findAllByQueryFilter(vo);
		if(null != cList && cList.size() > 0){
			course = cList.get(0);
		}
		return course;
	}

}