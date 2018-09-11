package com.kk.web.controller.rest;

import static com.kk.core.constant.MessageConstants.ATTENDANCE_CREATED;
import static com.kk.core.constant.MessageConstants.ATTENDANCE_DELETED;
import static com.kk.core.constant.MessageConstants.ATTENDANCE_EDITED;
import static com.kk.core.constant.MessageConstants.ATTENDANCE_ERROR;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kk.core.vo.AttendanceVO;
import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.model.Attendance;
import com.kk.dao.service.AttendanceService;
import com.kk.web.common.KKContext;
import com.kk.web.vo.RestResponse;

@RestController
@RequestMapping("/rest")
public class AttendanceController {
	@Autowired
	private KKContext context;
	
	@Autowired
	private AttendanceService attendanceService;

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/attendance/{sectionId}/{subjectId}", method = RequestMethod.GET)
	public RestResponse list(@PathVariable String sectionId,@PathVariable String subjectId) {
		RestResponse respone = new RestResponse();
		try {
			QueryFilterVO vo = new QueryFilterVO();
			vo.getWhereClause().put("organization.id", String.valueOf(context.getSelectedOrgId()));
			vo.getWhereClause().put("section.id",String.valueOf(sectionId));
			vo.getWhereClause().put("subject.id",String.valueOf(subjectId));
			List<Attendance> attendanceList = attendanceService.findAllByQueryFilter(vo);
			respone.setData(attendanceList);
			respone.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			respone.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return respone;

	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/attendance", method = RequestMethod.POST)
	public RestResponse create(AttendanceVO vo) {
		RestResponse response = new RestResponse();
		Boolean status = Boolean.TRUE;
		try {
			
				if(null != vo.getId()){
					attendanceService.update(vo);
					response.setStatusText(ATTENDANCE_EDITED);
				}else{
					attendanceService.save(vo);
					response.setStatusText(ATTENDANCE_CREATED);
				}
				response.setObject(vo);
			response.setStatus(status);
			
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			response.setStatusText(ATTENDANCE_ERROR);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/attendance/{id}", method = RequestMethod.DELETE)
	public RestResponse delete(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Attendance attendance = attendanceService.get(id);
			attendance.setIsDeleted(Boolean.TRUE);
			attendance.setUpdatedAt(new Date());
			attendanceService.update(attendance);
			response.setStatus(Boolean.TRUE);
			response.setStatusText(ATTENDANCE_DELETED);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/attendance/{id}", method = RequestMethod.GET)
	public RestResponse get(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Attendance attendance = attendanceService.get(id);
			response.setObject(attendance);
			response.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/attendance/student/{studentId}", method = RequestMethod.GET)
	public RestResponse get(@PathVariable("studentId") String studentId) {
		RestResponse response = new RestResponse();
		try {
			QueryFilterVO vo = new QueryFilterVO();
			vo.getWhereClause().put("student.id", studentId);
			List<Attendance> attendanceList = attendanceService.findAllByQueryFilter(vo);
			response.setData(attendanceList);
			response.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}
	



}
