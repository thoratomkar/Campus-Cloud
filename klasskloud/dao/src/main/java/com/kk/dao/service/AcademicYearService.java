package com.kk.dao.service;

import com.kk.core.vo.AcadVO;
import com.kk.dao.model.AcadYear;

public interface AcademicYearService extends GenericService<AcadYear,Long> {

	Boolean save(AcadVO vo) throws Exception;
	
	Boolean update(AcadVO vo) throws Exception;

}