package com.kk.web.controller.rest;

import static com.kk.core.constant.MessageConstants.TIMETABLE_CREATED;
import static com.kk.core.constant.MessageConstants.TIMETABLE_EDITED;
import static com.kk.core.constant.MessageConstants.TIMETABLE_DELETED;
import static com.kk.core.constant.MessageConstants.TIMETABLE_ERROR;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kk.core.vo.QueryFilterVO;
import com.kk.core.vo.TimetableVO;
import com.kk.dao.model.Timetable;
import com.kk.dao.service.TimetableService;
import com.kk.web.common.KKContext;
import com.kk.web.vo.RestResponse;

@RestController
@RequestMapping("/rest")
public class TimetableController {
	@Autowired
	private KKContext context;
	
	@Autowired
	private TimetableService timetableService;

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/timetable", method = RequestMethod.GET)
	public RestResponse getTimetable() {
		RestResponse respone = new RestResponse();
		try {

			QueryFilterVO vo = new QueryFilterVO();
			List<Timetable> ttList = timetableService.findAllByQueryFilter(vo);
			//Collections.sort(privilegeList, new GenericComparator("createdAt", false));
			respone.setData(ttList);
			respone.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			respone.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return respone;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/timetable/{id}", method = RequestMethod.DELETE)
	public RestResponse delete(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Timetable timetable = timetableService.get(id);
			timetable.setIsDeleted(Boolean.TRUE);
			timetable.setUpdatedAt(new Date());
			timetableService.update(timetable);
			response.setStatus(Boolean.TRUE);
			response.setStatusText(TIMETABLE_DELETED);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/timetable", method = RequestMethod.POST)
	public RestResponse create(TimetableVO vo) {
		RestResponse response = new RestResponse();
		Boolean status = Boolean.TRUE;
/*		try {
			
			Timetable timetable = timetableService.getTimetableByClassAndDay(vo);
			
			if(null != vo.getId()){
				if(null != timetable && timetable.getId().longValue() != vo.getId().longValue()){
					response.setObject(vo);
					response.setStatus(Boolean.FALSE);
					response.setStatusText(TIMETABLE_ALREADY_EXISTS);
				}else{
					response.setStatus(Boolean.TRUE);
					timetableService.update(vo);
				}
			}else{
				if(null == timetable){
					Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
					vo.setLoggedInUserName(authentication.getName());
					timetableService.save(vo,context.getOrganization());
					response.setStatus(Boolean.TRUE);
				}else{
					response.setStatus(status);
				}
				response.setObject(vo);
				response.setStatusText(status ? TIMETABLE_CREATED : TIMETABLE_ALREADY_EXISTS);
			}
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			response.setStatusText(TIMETABLE_ERROR);
			e.printStackTrace();
		}
		return response;
*/
		try {
			
			if(null != vo.getId()){
				timetableService.update(vo);
				response.setStatusText(TIMETABLE_EDITED);
			}else{
				Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
				vo.setLoggedInUserName(authentication.getName());
				timetableService.save(vo,context.getOrganization());
				response.setStatusText(TIMETABLE_CREATED);
			}
			response.setObject(vo);
		response.setStatus(status);
		
	} catch (Exception e) {
		response.setStatus(Boolean.FALSE);
		response.setStatusText(TIMETABLE_ERROR);
		e.printStackTrace();
	}
	return response;
		
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/timetable/{id}", method = RequestMethod.GET)
	public RestResponse get(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Timetable timetable = timetableService.get(id);
			response.setObject(timetable);
			response.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}


}
