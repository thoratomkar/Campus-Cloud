package com.kk.web.controller.rest;

import static com.kk.core.constant.MessageConstants.STUDENT_ALREADY_EXISTS;
import static com.kk.core.constant.MessageConstants.STUDENT_CREATED;
import static com.kk.core.constant.MessageConstants.STUDENT_DELETED;
import static com.kk.core.constant.MessageConstants.STUDENT_ERROR;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kk.core.vo.QueryFilterVO;
import com.kk.core.vo.StudentVO;
import com.kk.dao.model.Student;
import com.kk.dao.service.StudentService;
import com.kk.web.vo.RestResponse;

@RestController
@RequestMapping("/rest/students")
public class StudentController {

	@Autowired
	private StudentService studentService;

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "", method = RequestMethod.GET)
	public RestResponse getStudents() {
		RestResponse respone = new RestResponse();
		try {

			QueryFilterVO vo = new QueryFilterVO();
			List<Student> studList = studentService.findAllByQueryFilter(vo);
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
			Student student = studentService.get(id);
			student.setIsDeleted(Boolean.TRUE);
			student.setUpdatedAt(new Date());
			studentService.update(student);
			response.setStatus(Boolean.TRUE);
			response.setStatusText(STUDENT_DELETED);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "", method = RequestMethod.POST)
	public RestResponse create(StudentVO vo) {
		RestResponse response = new RestResponse();
		Boolean status = Boolean.FALSE;
		try {
			
			Student student = studentService.exists(vo.getFirstName(), vo.getLastName(), vo.getOrgId());
			
			if(null != vo.getId()){
				if(null != student && student.getId().longValue() != vo.getId().longValue()){
					response.setObject(vo);
					response.setStatus(Boolean.FALSE);
					response.setStatusText(STUDENT_ALREADY_EXISTS);
				}else{
					response.setStatus(Boolean.TRUE);
					studentService.update(vo);
				}
			}else{
				if(null == student){
					studentService.save(vo);
					response.setStatus(Boolean.TRUE);
				}else{
					response.setStatus(status);
				}
				response.setObject(vo);
				response.setStatusText(status ? STUDENT_CREATED : STUDENT_ALREADY_EXISTS);
			}
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			response.setStatusText(STUDENT_ERROR);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public RestResponse get(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Student student = studentService.get(id);
			response.setObject(student);
			response.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/rollNo/unique/{batchId}/{rollNo}", method = RequestMethod.GET)
	public RestResponse checkRollNoUniqueness(@PathVariable("batchId") String batchId,
			@PathVariable("rollNo") String rollNo) {
		RestResponse response = new RestResponse();
		try {
			QueryFilterVO vo = new QueryFilterVO();
			vo.getWhereClause().put("batch.id", batchId);
			vo.getWhereClause().put("rollNo", rollNo);
			
			List<Student> sList = studentService.findAllByQueryFilter(vo);
			response.setUserExists(!CollectionUtils.isEmpty(sList)? Boolean.TRUE: Boolean.FALSE);
			response.setStatus(Boolean.TRUE);
			response.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/list/{orgId}", method = RequestMethod.GET)
	public RestResponse getStudentsByOrgId(@PathVariable("orgId") String orgId) {
		RestResponse respone = new RestResponse();
		try {

			QueryFilterVO vo = new QueryFilterVO();
			vo.getWhereClause().put("organization.id",orgId);
			List<Student> studList = studentService.findAllByQueryFilter(vo);
			respone.setData(studList);
			respone.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			respone.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return respone;
	}
	
	

}
