package com.kk.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/subject/default")
public class SubjectWebController {

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String subjectHome(Model model) {
		return "subjectHome";
	}


}