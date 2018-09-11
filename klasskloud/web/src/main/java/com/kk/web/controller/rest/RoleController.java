package com.kk.web.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kk.dao.model.Role;
import com.kk.dao.service.RoleService;
import com.kk.web.vo.RestResponse;

@RestController
@RequestMapping("/rest")
public class RoleController{

	@Autowired
	private RoleService roleService;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/roles", method = RequestMethod.GET)
	public RestResponse getRoles() {
		RestResponse respone = new RestResponse();
		try {
			List<Role> roleList = roleService.getAll();
			respone.setList(roleList);
			respone.setStatus(Boolean.TRUE);
		} catch (Exception e) {
			respone.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		return respone;
	}

}