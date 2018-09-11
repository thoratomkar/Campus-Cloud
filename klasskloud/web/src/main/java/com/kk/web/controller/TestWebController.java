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
import com.kk.dao.model.Student;
import com.kk.dao.model.Subject;
import com.kk.dao.service.AcademicYearService;
import com.kk.dao.service.CourseService;
import com.kk.dao.service.ScoreService;
import com.kk.dao.service.StudentService;
import com.kk.dao.service.SubjectService;
import com.kk.web.common.KKContext;

@Controller
@RequestMapping("/test/default")
public class TestWebController{
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private ScoreService scoreService;

	@Autowired
	private AcademicYearService academicYearService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private KKContext context;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String testHome(Model model) throws Exception {
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("organization.id", String.valueOf(context.getSelectedOrgId()));
		List<Student> studList = studentService.findAllByQueryFilter(vo);
		model.addAttribute("TOTALSTUDENTS", null != studList ?studList.size(): 0);
		vo.getWhereClause().remove("organization.id");
		return "testHome";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addTest(Model model) throws Exception {
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("organization.id", String.valueOf(context.getSelectedOrgId()));
		List<AcadYear> acadList = academicYearService.findAllByQueryFilter(vo);
		model.addAttribute("AYLIST", null != acadList ?acadList : Collections.emptyList());
		
		List<Course> courseList = courseService.findAllByQueryFilter(vo);
		model.addAttribute("COURSELIST", null != courseList ?courseList : Collections.emptyList());
		
		List<Subject> subjectList = subjectService.findAllByQueryFilter(vo);
		model.addAttribute("SUBJECTLIST", null != subjectList ?subjectList : Collections.emptyList());
		
		return "addTest";
	}

	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public String manageTest(Model model) throws Exception {
		return "manageTest";
	}
}