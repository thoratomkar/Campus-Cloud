package com.kk.web.controller.rest;

import static com.kk.core.constant.MessageConstants.PRIVILEGE_ALREADY_EXISTS;
import static com.kk.core.constant.MessageConstants.PRIVILEGE_CREATED;
import static com.kk.core.constant.MessageConstants.PRIVILEGE_DELETED;
import static com.kk.core.constant.MessageConstants.PRIVILEGE_ERROR;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kk.core.vo.PermissionsVO;
import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.model.Privilege;
import com.kk.dao.model.RolesPrivileges;
import com.kk.dao.service.PrivilegeService;
import com.kk.dao.service.RolesPrivilegesService;
import com.kk.web.vo.RestResponse;

@RestController
@RequestMapping("/rest")
public class PermissionController {

	@Autowired
	private PrivilegeService privilegeService;
	
	@Autowired
	private RolesPrivilegesService rolesPrivilegesService;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/privileges", method = RequestMethod.GET)
	public RestResponse getPrivileges() {
		RestResponse respone = new RestResponse();
		try {

			QueryFilterVO vo = new QueryFilterVO();
			vo.getWhereClause().remove("isDeleted");
			List<Privilege> privilegeList = privilegeService.findAllByQueryFilter(vo);
			//Collections.sort(privilegeList, new GenericComparator("createdAt", false));
			respone.setData(privilegeList);
			respone.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			respone.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return respone;
	}

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/privileges/{id}", method = RequestMethod.DELETE)
	public RestResponse delete(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Privilege privilege = privilegeService.get(id);
			privilege.setIsDeleted(Boolean.TRUE);
			privilege.setUpdatedAt(new Date());
			privilegeService.saveOrUpdate(privilege);
			response.setStatus(Boolean.TRUE);
			response.setStatusText(PRIVILEGE_DELETED);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/privileges", method = RequestMethod.POST)
	public RestResponse create(PermissionsVO vo) {
		RestResponse response = new RestResponse();
		try {
			Boolean status = privilegeService.save(vo);
			response.setObject(vo);
			response.setStatus(status);
			response.setStatusText(status ? PRIVILEGE_CREATED : PRIVILEGE_ALREADY_EXISTS);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			response.setStatusText(PRIVILEGE_ERROR);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/privileges/{id}", method = RequestMethod.GET)
	public RestResponse get(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Privilege privilege = privilegeService.get(id);
			List<RolesPrivileges> list = rolesPrivilegesService.findAllByProperty("privilegeId",String.valueOf(privilege.getId()));
			response.setObject(privilege);
			response.setList(list);
			response.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}

}