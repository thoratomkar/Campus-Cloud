package com.kk.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class RegisterWebController {

	@RequestMapping("/register")
	public String getRegistrationForm(Model model) {
		return "registerHome";
	}


}
