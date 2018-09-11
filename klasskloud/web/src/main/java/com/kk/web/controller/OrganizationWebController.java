package com.kk.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/organization")
public class OrganizationWebController {
	
	@RequestMapping(value = "/default/home", method = RequestMethod.GET)
	public String organizationHome(Model model) {
		
		return "organizationHome";
		
	}
	
}