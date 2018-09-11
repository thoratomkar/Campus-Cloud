package com.kk.web.controller.rest;

import static com.kk.core.constant.MessageConstants.ACADYEAR_ALREADY_EXISTS;
import static com.kk.core.constant.MessageConstants.ACADYEAR_CREATED;
import static com.kk.core.constant.MessageConstants.ACADYEAR_EDITED;
import static com.kk.core.constant.MessageConstants.ACADYEAR_DELETED;
import static com.kk.core.constant.MessageConstants.ACADYEAR_ERROR;
import static com.kk.core.constant.MessageConstants.ACADYEAR_ERROR_ENDDATE_LESSTHAN_STARTDATE;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kk.core.util.DateUtils;
import com.kk.core.vo.AcadVO;
import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.model.AcadYear;
import com.kk.dao.service.AcademicYearService;
import com.kk.web.common.KKContext;
import com.kk.web.vo.RestResponse;

@RestController
@RequestMapping("/rest")
public class AcadController {
	
	@Autowired
	private AcademicYearService academicYearService;
	
	@Autowired
	private KKContext context;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/acadyears", method = RequestMethod.GET)
	public RestResponse list() {
		RestResponse respone = new RestResponse();
		try {

			QueryFilterVO vo = new QueryFilterVO();
			vo.getWhereClause().put("organization.id", String.valueOf(context.getSelectedOrgId()));
			List<AcadYear> acadList = academicYearService.findAllByQueryFilter(vo);
			//Collections.sort(privilegeList, new GenericComparator("createdAt", false));
			respone.setData(acadList);
			respone.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			respone.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return respone;
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/acadyears", method = RequestMethod.POST)
	public RestResponse create(AcadVO vo) {
		RestResponse response = new RestResponse();
		Boolean status = Boolean.TRUE;
		try {
			
			if(DateUtils.isValidDateRange(vo)){
				if(null != vo.getId()){
					status = academicYearService.update(vo);
					response.setStatusText(ACADYEAR_EDITED);
				}else{
					status = academicYearService.save(vo);
					response.setStatusText(status ? ACADYEAR_CREATED : ACADYEAR_ALREADY_EXISTS);
				}
				response.setObject(vo);
				response.setStatusText(status ? ACADYEAR_CREATED : ACADYEAR_ALREADY_EXISTS);
			}else{
				status = Boolean.FALSE;
				response.setStatusText(ACADYEAR_ERROR_ENDDATE_LESSTHAN_STARTDATE);
			}
			response.setStatus(status);
			
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			response.setStatusText(ACADYEAR_ERROR);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/acadyears/{id}", method = RequestMethod.DELETE)
	public RestResponse delete(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			AcadYear acadYear = academicYearService.get(id);
			acadYear.setIsDeleted(Boolean.TRUE);
			acadYear.setUpdatedAt(new Date());
			academicYearService.update(acadYear );
			response.setStatus(Boolean.TRUE);
			response.setStatusText(ACADYEAR_DELETED);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/acadyears/{id}", method = RequestMethod.GET)
	public RestResponse get(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			AcadYear acadYear = academicYearService.get(id);
			response.setObject(acadYear);
			response.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}

	
}