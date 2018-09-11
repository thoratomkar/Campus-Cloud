package com.kk.web.controller.rest;

import static com.kk.core.constant.MessageConstants.MODULE_ALREADY_EXISTS;
import static com.kk.core.constant.MessageConstants.MODULE_CREATED;
import static com.kk.core.constant.MessageConstants.MODULE_DELETED;
import static com.kk.core.constant.MessageConstants.MODULE_ERROR;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kk.core.vo.ModuleVO;
import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.model.Module;
import com.kk.dao.service.ModuleService;
import com.kk.web.vo.RestResponse;

@RestController
@RequestMapping("/rest")
public class ModuleController {
	
	@Autowired
	private ModuleService moduleService;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/modules", method = RequestMethod.GET)
	public RestResponse getModules() {
		RestResponse respone = new RestResponse();
		try {
			QueryFilterVO vo = new QueryFilterVO();
			List<Module> moduleList = moduleService.findAllByQueryFilter(vo);
			respone.setList(moduleList);
			respone.setData(moduleList);
			respone.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			respone.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return respone;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/modules/{id}", method = RequestMethod.DELETE)
	public RestResponse delete(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Module module = moduleService.get(id);
			module.setIsDeleted(Boolean.TRUE);
			module.setUpdatedAt(new Date());
			moduleService.update(module);
			response.setStatus(Boolean.TRUE);
			response.setStatusText(MODULE_DELETED);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/modules", method = RequestMethod.POST)
	public RestResponse create(ModuleVO vo) {
		RestResponse response = new RestResponse();
		Boolean status = Boolean.FALSE;
		try {
			
			Module module = moduleService.getModuleByNameAndCode(vo);
			
			if(null != vo.getId()){
				if(null != module && module.getId().longValue() != vo.getId().longValue()){
					response.setObject(vo);
					response.setStatus(Boolean.FALSE);
					response.setStatusText(MODULE_ALREADY_EXISTS);
				}else{
					response.setStatus(Boolean.TRUE);
					moduleService.update(vo);
				}
			}else{
				if(null == module){
					moduleService.save(vo);
					response.setStatus(Boolean.TRUE);
				}else{
					response.setStatus(status);
				}
				response.setObject(vo);
				response.setStatusText(status ? MODULE_CREATED : MODULE_ALREADY_EXISTS);
			}
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			response.setStatusText(MODULE_ERROR);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/modules/{id}", method = RequestMethod.GET)
	public RestResponse get(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Module module = moduleService.get(id);
			response.setObject(module);
			response.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}
	
}