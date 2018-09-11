package com.kk.web.controller.rest;

import static com.kk.core.constant.MessageConstants.ORGANIZATION_ALREADY_EXISTS;
import static com.kk.core.constant.MessageConstants.ORGANIZATION_CREATED;
import static com.kk.core.constant.MessageConstants.ORGANIZATION_DELETED;
import static com.kk.core.constant.MessageConstants.ORGANIZATION_ERROR;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kk.core.vo.OrganizationVO;
import com.kk.dao.model.Organization;
import com.kk.dao.service.OrganizationService;
import com.kk.dao.service.UserService;
import com.kk.web.common.KKContext;
import com.kk.web.vo.RestResponse;

@RestController
@RequestMapping("/rest")
public class OrganizationController {
	
	@Autowired
	private KKContext context;
	
	@Autowired
	private OrganizationService organizationService;
	
	@Autowired
	private UserService userService;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/organizations", method = RequestMethod.GET)
	public RestResponse getOrganizations() {
		RestResponse respone = new RestResponse();
		try {
			respone.setList(context.getOrgList());
			respone.setData(context.getOrgList());
			
			respone.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			respone.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return respone;
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/organizations/{id}", method = RequestMethod.DELETE)
	public RestResponse delete(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Organization organization = organizationService.get(id);
			organization.setIsDeleted(Boolean.TRUE);
			organization.setUpdatedAt(new Date());
			organizationService.update(organization);
			response.setStatus(Boolean.TRUE);
			response.setStatusText(ORGANIZATION_DELETED);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/organizations", method = RequestMethod.POST)
	public RestResponse create(OrganizationVO vo) {
		RestResponse response = new RestResponse();
		Boolean status = Boolean.FALSE;
		try {
			
			Organization organization = organizationService.getOrganizationByNameAndCode(vo);
			
			if(null != vo.getId()){
				if(null != organization && organization.getId().longValue() != vo.getId().longValue()){
					response.setObject(vo);
					response.setStatus(Boolean.FALSE);
					response.setStatusText(ORGANIZATION_ALREADY_EXISTS);
				}else{
					response.setStatus(Boolean.TRUE);
					organizationService.update(vo);
				}
			}else{
				if(null == organization){
					vo.setLoggedInUserName(context.getLoggedInUser().getUsername());
					organizationService.save(vo);
					// update the orglist in context
					List<Organization> orgList = new ArrayList();
					if(null != context && !"ROLE_SUPERADMIN".equalsIgnoreCase(context.getLoggedInUserRole().getName())){
						orgList = userService.getOrganizations(context.getLoggedInUser().getId());
					}
					else{
						orgList = organizationService.getAll();
					}
					
					context.setOrgList(orgList);
					
					response.setStatus(Boolean.TRUE);
				}else{
					response.setStatus(status);
				}
				response.setObject(vo);
				response.setStatusText(status ? ORGANIZATION_CREATED : ORGANIZATION_ALREADY_EXISTS);
			}
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			response.setStatusText(ORGANIZATION_ERROR);
			e.printStackTrace();
		}
		return response;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/organizations/{id}", method = RequestMethod.GET)
	public RestResponse get(@PathVariable("id") Long id) {
		RestResponse response = new RestResponse();
		try {
			Organization organization = organizationService.get(id);
			response.setObject(organization);
			response.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return response;
	}
	
}