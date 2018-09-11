package com.kk.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/course/default")
public class CourseWebController {

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String courseHome(Model model) {
		return "courseHome";
	}


}