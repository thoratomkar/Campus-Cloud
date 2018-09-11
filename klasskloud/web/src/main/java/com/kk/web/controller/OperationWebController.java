package com.kk.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/operation")
public class OperationWebController {
	
	@RequestMapping(value = "/default/home", method = RequestMethod.GET)
	public String operationHome(Model model) {
		
		return "operationHome";
		
	}
	
}