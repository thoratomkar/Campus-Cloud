package com.kk.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/dashboard/secure")
public class DashboardWebController {

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addPage() {
		return "add";

	}
	
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String dashboardPage() {
		return "dashboard";

	}
	
	@RequestMapping("profile")
	public String geProfilePage() {
		return "profile";
	}
	
	

}
