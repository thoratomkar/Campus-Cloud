package com.kk.web.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.model.Student;
import com.kk.dao.service.StudentService;
import com.kk.web.common.KKContext;

@Controller
@RequestMapping("/score/default")
public class ScoreWebController {

	@Autowired
	private StudentService studentService;

	@Autowired
	private KKContext context;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String scoreHome(Model model) throws Exception {
		return "scoreHome";
	}
	
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addScore(Model model) throws Exception {
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("organization.id", String.valueOf(context.getSelectedOrgId()));
		List<Student> studList = studentService.findAllByQueryFilter(vo);
		model.addAttribute("STUDENTLIST", null != studList ?studList : Collections.emptyList());
		return "addScore";
	}

	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public String manageScore(Model model) throws Exception {
		return "manageScore";
	}

}
