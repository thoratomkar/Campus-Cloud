package com.kk.dao.service;

import java.util.List;

import com.kk.core.vo.TestVO;
import com.kk.dao.model.Test;

public interface TestService extends GenericService<Test,Long>{
	
	Test exists(String name, String code, Long batchId) throws Exception;
	
	Boolean save(TestVO vo);

	void update(TestVO vo) throws Exception;

	List<Test> getAllTestsForStudent(Long studentId) throws Exception;
	

}
