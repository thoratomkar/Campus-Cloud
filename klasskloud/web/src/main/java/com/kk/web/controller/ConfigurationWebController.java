package com.kk.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.service.AcademicYearService;
import com.kk.dao.service.ModuleService;
import com.kk.dao.service.OperationService;
import com.kk.dao.service.PrivilegeService;
import com.kk.web.common.KKContext;

@Controller
@RequestMapping("/config/default")
public class ConfigurationWebController{
	
	@Autowired
	private PrivilegeService privilegeService;
	
	@Autowired
	private ModuleService moduleService;
	
	@Autowired
	private OperationService operationService;
	
	@Autowired
	private AcademicYearService academicYearService;

	@Autowired
	private KKContext context;

	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String configHome(Model model) throws Exception {
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().remove("isDeleted");
		model.addAttribute("TOTALPERMISSIONS", privilegeService.getTotalRows(vo));
		vo.getWhereClause().put("isDeleted","false");
		model.addAttribute("TOTALMODULES", moduleService.getTotalRows(vo));
		model.addAttribute("TOTALOPERATIONS", operationService.getTotalRows(vo));
		model.addAttribute("TOTALACADYEARS", academicYearService.getTotalRows(vo));
		model.addAttribute("TOTALORGANIZATIONS", null != context.getOrgList() ? context.getOrgList().size() : 0);
		return "configHome";
	}
	
}