package com.kk.web.controller.rest;

import static com.kk.core.constant.MessageConstants.SECTION_ALREADY_EXISTS;
import static com.kk.core.constant.MessageConstants.SECTION_CREATED;
import static com.kk.core.constant.MessageConstants.SECTION_DELETED;
import static com.kk.core.constant.MessageConstants.SECTION_ERROR;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kk.core.vo.QueryFilterVO;
import com.kk.core.vo.SectionVO;
import com.kk.dao.model.Section;
import com.kk.dao.service.SectionService;
import com.kk.web.common.KKContext;
import com.kk.web.vo.RestResponse;

@RestController
@RequestMapping("/rest/section")
public class SectionController {
	
	@Autowired
	private SectionService sectionService;
	
	@Autowired
	private KKContext context;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "", method = RequestMethod.GET)
	public RestResponse list() {
		RestResponse respone = new RestResponse();
		try {

			QueryFilterVO vo = new QueryFilterVO();
			vo.getWhereClause().put("organization.id", String.valueOf(context.getSelectedOrgId()));
			List<Section> acadList = sectionService.findAllByQueryFilter(vo);
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
	public RestResponse create(SectionVO vo) {
		RestResponse response = new RestResponse();
		Boolean status = Boolean.FALSE;
		try {
			
			Section section = sectionService.getSectionByNameAndCode(vo);
			
			if(null != vo.getId()){
				if(null != section && section.getId().longValue() != vo.getId().longValue()){
					response.setObject(vo);
					response.setStatus(Boolean.FALSE);
					response.setStatusText(SECTION_ALREADY_EXISTS);
				}else{
					response.setStatus(Boolean.TRUE);
					sectionService.update(vo);
				}
			}else{
				if(null == section){
					sectionService.save(vo);
					response.setStatus(Boolean.TRUE);
				}else{
					response.setStatus(status);
				}
				response.setObject(vo);
				response.setStatusText(status ? SECTION_CREATED : SECTION_ALREADY_EXISTS);
			}
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			response.setStatusText(SECTION_ERROR);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public RestResponse delete(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Section section = sectionService.get(id);
			section.setIsDeleted(Boolean.TRUE);
			section.setUpdatedAt(new Date());
			sectionService.update(section);
			response.setStatus(Boolean.TRUE);
			response.setStatusText(SECTION_DELETED);
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
			Section section = sectionService.get(id);
			response.setObject(section);
			response.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/{ayId}/{batchId}", method = RequestMethod.GET)
	public RestResponse getBatchesByAcadYearAndBatch(@PathVariable("ayId") String ayId,
			@PathVariable("batchId") String batchId) {
		RestResponse respone = new RestResponse();
		try {

			QueryFilterVO vo = new QueryFilterVO();
			vo.getWhereClause().put("organization.id", String.valueOf(context.getSelectedOrgId()));
			vo.getWhereClause().put("acadYear.id", ayId);
			vo.getWhereClause().put("batch.id", batchId);
			List<Section> sList = sectionService.findAllByQueryFilter(vo);
			respone.setList(sList);
			respone.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			respone.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return respone;
	}

	
}