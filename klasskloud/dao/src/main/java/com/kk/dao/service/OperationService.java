package com.kk.dao.service;

import com.kk.core.vo.OperationVO;
import com.kk.dao.model.Operation;

public interface OperationService  extends GenericService<Operation,Long>{
	
	Operation exists(String name) throws Exception;
	
	Boolean save(OperationVO vo);

	void update(OperationVO vo) throws Exception;
}