package com.kk.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.model.AcadYear;
import com.kk.dao.model.Batch;
import com.kk.dao.model.Course;
import com.kk.dao.model.Section;
import com.kk.dao.model.Subject;
import com.kk.dao.service.AcademicYearService;
import com.kk.dao.service.BatchSevice;
import com.kk.dao.service.CourseService;
import com.kk.dao.service.SectionService;
import com.kk.dao.service.SubjectService;
import com.kk.web.common.KKContext;

@Controller
@RequestMapping("/academic/default")
public class AcademicWebController{
	
	@Autowired
	private AcademicYearService academicYearService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private BatchSevice batchService;
	
	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private SectionService sectionService;
	
	@Autowired
	private KKContext context;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String academicHome(Model model) throws Exception {
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("organization.id", String.valueOf(context.getSelectedOrgId()));
		List<AcadYear> acadList = academicYearService.findAllByQueryFilter(vo);
		model.addAttribute("TOTALACADYEARS", null != acadList ?acadList.size(): 0);
		List<Course> courseList = courseService.findAllByQueryFilter(vo);
		model.addAttribute("TOTALCOURSES", null != courseList ?courseList.size(): 0);
		List<Batch> batchList = batchService.findAllByQueryFilter(vo);
		model.addAttribute("TOTALBATCHES", null != batchList ?batchList.size(): 0);
		List<Subject> subjectList = subjectService.findAllByQueryFilter(vo);
		model.addAttribute("TOTALSUBJECTS", null != subjectList ?subjectList.size(): 0);
		List<Section> sectionList = sectionService.findAllByQueryFilter(vo);
		model.addAttribute("TOTALSECTIONS", null != sectionList ?sectionList.size(): 0);
		
		return "academicHome";
	}
	
}