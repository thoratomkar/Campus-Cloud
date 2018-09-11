package com.kk.web.controller.rest;

import static com.kk.core.constant.MessageConstants.OPERATION_ALREADY_EXISTS;
import static com.kk.core.constant.MessageConstants.OPERATION_CREATED;
import static com.kk.core.constant.MessageConstants.OPERATION_DELETED;
import static com.kk.core.constant.MessageConstants.OPERATION_ERROR;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kk.core.vo.OperationVO;
import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.model.Operation;
import com.kk.dao.service.OperationService;
import com.kk.web.vo.RestResponse;

@RestController
@RequestMapping("/rest")
public class OperationController {
	
	@Autowired
	private OperationService operationService;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/operations", method = RequestMethod.GET)
	public RestResponse getOperations() {
		RestResponse respone = new RestResponse();
		try {
			QueryFilterVO vo = new QueryFilterVO();
			List<Operation> operationList = operationService.findAllByQueryFilter(vo);
			respone.setList(operationList);
			respone.setData(operationList);
			respone.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			respone.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return respone;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/operations/{id}", method = RequestMethod.DELETE)
	public RestResponse delete(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Operation operation = operationService.get(id);
			operation.setIsDeleted(Boolean.TRUE);
			operation.setUpdatedAt(new Date());
			operationService.update(operation);
			response.setStatus(Boolean.TRUE);
			response.setStatusText(OPERATION_DELETED);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/operations", method = RequestMethod.POST)
	public RestResponse create(OperationVO vo) {
		RestResponse response = new RestResponse();
		Boolean status = Boolean.FALSE;
		try {
			
			Operation operation = operationService.exists(vo.getName());
			
			if(null != vo.getId()){
				if(null != operation && operation.getId().longValue() != vo.getId().longValue()){
					response.setObject(vo);
					response.setStatus(Boolean.FALSE);
					response.setStatusText(OPERATION_ALREADY_EXISTS);
				}else{
					response.setStatus(Boolean.TRUE);
					operationService.update(vo);
				}
			}else{
				if(null == operation){
					operationService.save(vo);
					response.setStatus(Boolean.TRUE);
				}else{
					response.setStatus(status);
				}
				response.setObject(vo);
				response.setStatusText(status ? OPERATION_CREATED : OPERATION_ALREADY_EXISTS);
			}
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			response.setStatusText(OPERATION_ERROR);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/operations/{id}", method = RequestMethod.GET)
	public RestResponse get(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Operation operation = operationService.get(id);
			response.setObject(operation);
			response.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}
	
}