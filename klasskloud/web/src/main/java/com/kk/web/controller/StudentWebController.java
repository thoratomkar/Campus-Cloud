package com.kk.web.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.model.AcadYear;
import com.kk.dao.model.Course;
import com.kk.dao.model.Student;
import com.kk.dao.service.AcademicYearService;
import com.kk.dao.service.CourseService;
import com.kk.dao.service.StudentService;
import com.kk.web.common.KKContext;

@Controller
@RequestMapping("/student/default")
public class StudentWebController{
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private AcademicYearService academicYearService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private KKContext context;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String studentHome(Model model) throws Exception {
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("organization.id", String.valueOf(context.getSelectedOrgId()));
		List<Student> studList = studentService.findAllByQueryFilter(vo);
		model.addAttribute("TOTALSTUDENTS", null != studList ?studList.size(): 0);
		vo.getWhereClause().remove("organization.id");
		return "studentHome";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addStudent(Model model) throws Exception {
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("organization.id", String.valueOf(context.getSelectedOrgId()));
		List<AcadYear> acadList = academicYearService.findAllByQueryFilter(vo);
		model.addAttribute("AYLIST", null != acadList ?acadList : Collections.emptyList());
		
		List<Course> courseList = courseService.findAllByQueryFilter(vo);
		model.addAttribute("COURSELIST", null != courseList ?courseList : Collections.emptyList());
		
		return "addStudent";
	}

	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public String manageStudent(Model model) throws Exception {
		return "manageStudent";
	}
	
	@RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
	public String viewStudentDetails(Model model,@PathVariable("id") Long id) throws Exception {
		Student student = studentService.get(id);
		model.addAttribute("STUDENT",student);
		return "viewStudentDetails";
	}
	
}