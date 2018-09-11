package com.kk.dao.factory.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.factory.BatchDao;
import com.kk.dao.model.Batch;

@Repository("batchDao")
public class BatchDaoImpl extends GenericDaoImpl<Batch, Long> implements BatchDao {
	
	@Override
	public Batch exists(String name, String orgId) throws Exception {
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("name", name);
		vo.getWhereClause().put("organization.id", orgId);
		List<Batch> list = findAllByQueryFilter(vo);
		Batch result = null;
		if(!CollectionUtils.isEmpty(list)) result = list.get(0);
		return result;
	}

}
