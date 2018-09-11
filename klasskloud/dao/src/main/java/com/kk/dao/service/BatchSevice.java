package com.kk.dao.service;

import java.util.List;

import com.kk.core.vo.BatchVO;
import com.kk.dao.model.Batch;

public interface BatchSevice extends GenericService<Batch, Long> {

	Batch exists(String name, String orgId) throws Exception;

	Boolean save(BatchVO vo) throws Exception;

	Boolean update(BatchVO vo) throws Exception;

	public Batch getBatchByNameAndCode(BatchVO batchVO) throws Exception;
	
	public List<Batch> getBatchListByCourse(Long courseId) throws Exception;
	
	
}