package com.kk.dao.service;

import java.util.List;

import com.kk.core.vo.SectionVO;
import com.kk.dao.model.Section;

public interface SectionService extends GenericService<Section, Long> {

	Section exists(String name, String orgId) throws Exception;

	Boolean save(SectionVO vo) throws Exception;

	Boolean update(SectionVO vo) throws Exception;

	public Section getSectionByNameAndCode(SectionVO sectionVO) throws Exception;
	
	public List<Section> getSectionListByBatch(Long batchId) throws Exception;
}