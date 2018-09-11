package com.kk.web.controller.rest;

import static com.kk.core.constant.MessageConstants.TEST_ALREADY_EXISTS;
import static com.kk.core.constant.MessageConstants.TEST_CREATED;
import static com.kk.core.constant.MessageConstants.TEST_DELETED;
import static com.kk.core.constant.MessageConstants.TEST_ERROR;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kk.core.vo.QueryFilterVO;
import com.kk.core.vo.TestVO;
import com.kk.dao.model.Test;
import com.kk.dao.service.TestService;
import com.kk.web.common.KKContext;
import com.kk.web.vo.RestResponse;

@RestController
@RequestMapping("/rest/tests")
public class TestController {

	@Autowired
	private TestService testService;
	
	@Autowired
	private KKContext context;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "", method = RequestMethod.GET)
	public RestResponse getTests() {
		RestResponse respone = new RestResponse();
		try {

			QueryFilterVO vo = new QueryFilterVO();
			vo.getWhereClause().put("organization.id", String.valueOf(context.getSelectedOrgId()));
			List<Test> studList = testService.findAllByQueryFilter(vo);
			respone.setData(studList);
			respone.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			respone.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return respone;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public RestResponse delete(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Test test = testService.get(id);
			test.setIsDeleted(Boolean.TRUE);
			test.setUpdatedAt(new Date());
			testService.update(test);
			response.setStatus(Boolean.TRUE);
			response.setStatusText(TEST_DELETED);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "", method = RequestMethod.POST)
	public RestResponse create(TestVO vo) {
		RestResponse response = new RestResponse();
		Boolean status = Boolean.FALSE;
		try {
			
			Test test = testService.exists(vo.getName(), vo.getCode(), vo.getBatchId());
			
			if(null != vo.getId()){
				if(null != test && test.getId().longValue() != vo.getId().longValue()){
					response.setObject(vo);
					response.setStatus(Boolean.FALSE);
					response.setStatusText(TEST_ALREADY_EXISTS);
				}else{
					response.setStatus(Boolean.TRUE);
					testService.update(vo);
				}
			}else{
				if(null == test){
					testService.save(vo);
					response.setStatus(Boolean.TRUE);
				}else{
					response.setStatus(status);
				}
				response.setObject(vo);
				response.setStatusText(status ? TEST_CREATED : TEST_ALREADY_EXISTS);
			}
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			response.setStatusText(TEST_ERROR);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public RestResponse get(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Test test = testService.get(id);
			response.setObject(test);
			response.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/list/{studentId}", method = RequestMethod.GET)
	public RestResponse getTestsForStudent(@PathVariable("studentId") Long studentId) {
		RestResponse respone = new RestResponse();
		try {

			List<Test> tList = testService.getAllTestsForStudent(studentId);
			respone.setList(tList);
			respone.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			respone.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return respone;
	}

	

}
