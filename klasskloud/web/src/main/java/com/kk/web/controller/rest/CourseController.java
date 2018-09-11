package com.kk.web.controller.rest;

import static com.kk.core.constant.MessageConstants.COURSE_ALREADY_EXISTS;
import static com.kk.core.constant.MessageConstants.COURSE_CREATED;
import static com.kk.core.constant.MessageConstants.COURSE_DELETED;
import static com.kk.core.constant.MessageConstants.COURSE_ERROR;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kk.core.vo.CourseVO;
import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.model.Course;
import com.kk.dao.service.CourseService;
import com.kk.web.common.KKContext;
import com.kk.web.vo.RestResponse;

@RestController
@RequestMapping("/rest/course")
public class CourseController {
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private KKContext context;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "", method = RequestMethod.GET)
	public RestResponse list() {
		RestResponse respone = new RestResponse();
		try {

			QueryFilterVO vo = new QueryFilterVO();
			vo.getWhereClause().put("organization.id", String.valueOf(context.getSelectedOrgId()));
			List<Course> acadList = courseService.findAllByQueryFilter(vo);
			respone.setData(acadList);
			respone.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			respone.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return respone;
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "", method = RequestMethod.POST)
	public RestResponse create(CourseVO vo) {
		RestResponse response = new RestResponse();
		Boolean status = Boolean.FALSE;
		try {
			
			Course course = courseService.getCourseByNameAndCode(vo);
			
			if(null != vo.getId()){
				if(null != course && course.getId().longValue() != vo.getId().longValue()){
					response.setObject(vo);
					response.setStatus(Boolean.FALSE);
					response.setStatusText(COURSE_ALREADY_EXISTS);
				}else{
					response.setStatus(Boolean.TRUE);
					courseService.update(vo);
				}
			}else{
				if(null == course){
					courseService.save(vo, context.getOrganization());
					response.setStatus(Boolean.TRUE);
				}else{
					response.setStatus(status);
				}
				response.setObject(vo);
				response.setStatusText(status ? COURSE_CREATED : COURSE_ALREADY_EXISTS);
			}
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			response.setStatusText(COURSE_ERROR);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public RestResponse delete(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Course course = courseService.get(id);
			course.setIsDeleted(Boolean.TRUE);
			course.setUpdatedAt(new Date());
			courseService.update(course);
			response.setStatus(Boolean.TRUE);
			response.setStatusText(COURSE_DELETED);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public RestResponse get(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Course course = courseService.get(id);
			response.setObject(course);
			response.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}
	
}