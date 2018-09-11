package com.kk.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/permission")
public class PermissionWebController {

	@RequestMapping(value = "/default/home", method = RequestMethod.GET)
	public String roleAndAccessesHome(Model model) {
		return "permissionHome";
	}

}