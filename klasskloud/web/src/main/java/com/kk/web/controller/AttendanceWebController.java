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
import com.kk.dao.model.Subject;
import com.kk.dao.model.Section;
import com.kk.dao.model.AcadYear;
import com.kk.dao.model.Course;
import com.kk.dao.model.Batch;
import com.kk.dao.service.AttendanceService;
import com.kk.dao.service.StudentService;
import com.kk.dao.service.SubjectService;
import com.kk.dao.service.AcademicYearService;
import com.kk.dao.service.CourseService;
import com.kk.dao.service.BatchSevice;
import com.kk.dao.service.SectionService;
import com.kk.web.common.KKContext;

@Controller
@RequestMapping("/attendance/default")
public class AttendanceWebController {

	@Autowired
	private AttendanceService attendanceService;
	
	@Autowired
	private StudentService studentService;

	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private AcademicYearService acadyearService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private BatchSevice batchService;
	
	@Autowired
	private SectionService sectionService;

	@Autowired
	private KKContext context;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String attendanceHome(Model model) throws Exception {
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("organization.id", String.valueOf(context.getSelectedOrgId()));
		List<Student> studList = studentService.findAllByQueryFilter(vo);
		model.addAttribute("STUDENTS", null != studList ?studList : Collections.emptyList());
		List<Subject> subList = subjectService.findAllByQueryFilter(vo);
		model.addAttribute("SUBJECTS", null != subList ?subList : Collections.emptyList());
		List<Section> secList = sectionService.findAllByQueryFilter(vo);
		model.addAttribute("SECTIONS", null != secList ?secList : Collections.emptyList());
		List<AcadYear> yearList = acadyearService.findAllByQueryFilter(vo);
		model.addAttribute("YEARS", null != yearList ?yearList : Collections.emptyList());
		List<Course> courseList = courseService.findAllByQueryFilter(vo);
		model.addAttribute("COURSES", null != courseList ?courseList : Collections.emptyList());
		List<Batch> batchList = batchService.findAllByQueryFilter(vo);
		model.addAttribute("BATCHES", null != batchList ?batchList : Collections.emptyList());
		return "attendanceHome";
	}

}
