package com.kk.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admission/default")
public class AdmissionWebController{
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String admissionHome() {
		return "admissionHome";

	}
	
}