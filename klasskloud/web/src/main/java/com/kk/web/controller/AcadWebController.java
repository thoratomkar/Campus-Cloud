package com.kk.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kk.core.util.CommonUtils;

@Controller
@RequestMapping("/acad/default")
public class AcadWebController {

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String acadHome(Model model) {
		model.addAttribute("MONTHLIST", CommonUtils.getMonths());
		model.addAttribute("YEARLIST", CommonUtils.getYears());
		return "acadHome";
	}


}