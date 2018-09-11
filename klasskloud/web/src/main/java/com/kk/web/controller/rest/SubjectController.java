package com.kk.web.controller.rest;

import static com.kk.core.constant.MessageConstants.SUBJECT_ALREADY_EXISTS;
import static com.kk.core.constant.MessageConstants.SUBJECT_CREATED;
import static com.kk.core.constant.MessageConstants.SUBJECT_DELETED;
import static com.kk.core.constant.MessageConstants.SUBJECT_ERROR;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kk.core.vo.QueryFilterVO;
import com.kk.core.vo.SubjectVO;
import com.kk.dao.model.Subject;
import com.kk.dao.service.SubjectService;
import com.kk.web.common.KKContext;
import com.kk.web.vo.RestResponse;

@RestController
@RequestMapping("/rest/subject")
public class SubjectController {
	
	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private KKContext context;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "", method = RequestMethod.GET)
	public RestResponse list() {
		RestResponse respone = new RestResponse();
		try {

			QueryFilterVO vo = new QueryFilterVO();
			vo.getWhereClause().put("organization.id", String.valueOf(context.getSelectedOrgId()));
			List<Subject> acadList = subjectService.findAllByQueryFilter(vo);
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
	public RestResponse create(SubjectVO vo) {
		RestResponse response = new RestResponse();
		Boolean status = Boolean.FALSE;
		try {
			
			Subject subject = subjectService.getSubjectByNameAndCode(vo);
			
			if(null != vo.getId()){
				if(null != subject && subject.getId().longValue() != vo.getId().longValue()){
					response.setObject(vo);
					response.setStatus(Boolean.FALSE);
					response.setStatusText(SUBJECT_ALREADY_EXISTS);
				}else{
					response.setStatus(Boolean.TRUE);
					subjectService.update(vo);
				}
			}else{
				if(null == subject){
					subjectService.save(vo, context.getOrganization());
					response.setStatus(Boolean.TRUE);
				}else{
					response.setStatus(status);
				}
				response.setObject(vo);
				response.setStatusText(status ? SUBJECT_CREATED : SUBJECT_ALREADY_EXISTS);
			}
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			response.setStatusText(SUBJECT_ERROR);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public RestResponse delete(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Subject subject = subjectService.get(id);
			subject.setIsDeleted(Boolean.TRUE);
			subject.setUpdatedAt(new Date());
			subjectService.update(subject);
			response.setStatus(Boolean.TRUE);
			response.setStatusText(SUBJECT_DELETED);
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
			Subject subject = subjectService.get(id);
			response.setObject(subject);
			response.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}

	
}