package com.kk.dao.factory.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.factory.SectionDao;
import com.kk.dao.model.Section;

@Repository("sectionDao")
public class SectionDaoImpl extends GenericDaoImpl<Section, Long> implements SectionDao {
	
	@Override
	public Section exists(String name, String orgId) throws Exception {
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("name", name);
		vo.getWhereClause().put("organization.id", orgId);
		List<Section> list = findAllByQueryFilter(vo);
		Section result = null;
		if(!CollectionUtils.isEmpty(list)) result = list.get(0);
		return result;
	}

}
