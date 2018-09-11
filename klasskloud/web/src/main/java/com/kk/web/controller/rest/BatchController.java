package com.kk.web.controller.rest;

import static com.kk.core.constant.MessageConstants.BATCH_ALREADY_EXISTS;
import static com.kk.core.constant.MessageConstants.BATCH_CREATED;
import static com.kk.core.constant.MessageConstants.BATCH_DELETED;
import static com.kk.core.constant.MessageConstants.BATCH_ERROR;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kk.core.vo.BatchVO;
import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.model.Batch;
import com.kk.dao.service.BatchSevice;
import com.kk.web.common.KKContext;
import com.kk.web.vo.RestResponse;

@RestController
@RequestMapping("/rest/batch")
public class BatchController {
	
	@Autowired
	private BatchSevice batchService;
	
	@Autowired
	private KKContext context;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "", method = RequestMethod.GET)
	public RestResponse list() {
		RestResponse respone = new RestResponse();
		try {

			QueryFilterVO vo = new QueryFilterVO();
			vo.getWhereClause().put("organization.id", String.valueOf(context.getSelectedOrgId()));
			List<Batch> acadList = batchService.findAllByQueryFilter(vo);
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
	public RestResponse create(BatchVO vo) {
		RestResponse response = new RestResponse();
		Boolean status = Boolean.FALSE;
		try {
			
			Batch batch = batchService.getBatchByNameAndCode(vo);
			
			if(null != vo.getId()){
				if(null != batch && batch.getId().longValue() != vo.getId().longValue()){
					response.setObject(vo);
					response.setStatus(Boolean.FALSE);
					response.setStatusText(BATCH_ALREADY_EXISTS);
				}else{
					response.setStatus(Boolean.TRUE);
					batchService.update(vo);
				}
			}else{
				if(null == batch){
					batchService.save(vo);
					response.setStatus(Boolean.TRUE);
				}else{
					response.setStatus(status);
				}
				response.setObject(vo);
				response.setStatusText(status ? BATCH_CREATED : BATCH_ALREADY_EXISTS);
			}
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			response.setStatusText(BATCH_ERROR);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public RestResponse delete(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Batch batch = batchService.get(id);
			batch.setIsDeleted(Boolean.TRUE);
			batch.setUpdatedAt(new Date());
			batchService.update(batch);
			response.setStatus(Boolean.TRUE);
			response.setStatusText(BATCH_DELETED);
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
			Batch batch = batchService.get(id);
			response.setObject(batch);
			response.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/{ayId}/{courseId}", method = RequestMethod.GET)
	public RestResponse getBatchesByAcadYearAndCourse(@PathVariable("ayId") String ayId,
			@PathVariable("courseId") String courseId) {
		RestResponse respone = new RestResponse();
		try {

			QueryFilterVO vo = new QueryFilterVO();
			vo.getWhereClause().put("organization.id", String.valueOf(context.getSelectedOrgId()));
			vo.getWhereClause().put("acadYear.id", ayId);
			vo.getWhereClause().put("course.id", courseId);
			List<Batch> bList = batchService.findAllByQueryFilter(vo);
			respone.setList(bList);
			respone.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			respone.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return respone;
	}
	
}