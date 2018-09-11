package com.kk.web.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kk.dao.service.OrganizationService;
import com.kk.web.common.KKContext;
@RestController
@RequestMapping("/rest")
public class ChangeScopeController {

	@Autowired
	private KKContext context;
	
	@Autowired
	private OrganizationService organizationService;

	@RequestMapping(value = "/changescope/{id}", method = RequestMethod.POST)
	public Boolean changeScope(@PathVariable("id") Long id) {
		try {
			context.setSelectedOrgId(id);
			context.setOrganization(organizationService.get(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Boolean.TRUE;

	}
}