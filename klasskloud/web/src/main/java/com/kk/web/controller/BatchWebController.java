package com.kk.web.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.model.AcadYear;
import com.kk.dao.model.Course;
import com.kk.dao.service.AcademicYearService;
import com.kk.dao.service.CourseService;
import com.kk.web.common.KKContext;

@Controller
@RequestMapping("/batch/default")
public class BatchWebController {

	@Autowired
	private CourseService courseService;
	
	@Autowired
	private AcademicYearService academicYearService;
	
	@Autowired
	private KKContext context;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String batchHome(Model model) {
		return "batchHome";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addBatch(Model model) throws Exception {
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("organization.id", String.valueOf(context.getSelectedOrgId()));
		List<Course> courseList = courseService.findAllByQueryFilter(vo);
		model.addAttribute("COURSELIST", null != courseList ?courseList : Collections.emptyList());
		List<AcadYear> acadList = academicYearService.findAllByQueryFilter(vo);
		model.addAttribute("AYLIST", null != acadList ?acadList : Collections.emptyList());
		return "addBatch";
	}


}