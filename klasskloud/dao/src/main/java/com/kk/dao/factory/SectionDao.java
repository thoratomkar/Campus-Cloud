package com.kk.dao.factory;

import com.kk.dao.model.Section;

public interface SectionDao extends GenericDao<Section, Long>{
	
	public Section exists(String name, String orgId) throws Exception ;
}