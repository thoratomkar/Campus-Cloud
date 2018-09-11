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
import com.kk.dao.model.Batch;
import com.kk.dao.service.AcademicYearService;
import com.kk.dao.service.BatchSevice;
import com.kk.web.common.KKContext;

@Controller
@RequestMapping("/section/default")
public class SectionWebController {

	@Autowired
	private BatchSevice batchService;
	
	@Autowired
	private AcademicYearService academicYearService;
	
	@Autowired
	private KKContext context;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String sectionHome(Model model) {
		return "sectionHome";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addSection(Model model) throws Exception {
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("organization.id", String.valueOf(context.getSelectedOrgId()));
		List<Batch> batchList = batchService.findAllByQueryFilter(vo);
		model.addAttribute("BATCHLIST", null != batchList ?batchList : Collections.emptyList());
		List<AcadYear> acadList = academicYearService.findAllByQueryFilter(vo);
		model.addAttribute("AYLIST", null != acadList ?acadList : Collections.emptyList());
		return "addSection";
	}


}