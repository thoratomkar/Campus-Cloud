package com.kk.dao.factory.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.CollectionUtils;

import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.factory.SubjectDao;
import com.kk.dao.model.Subject;

@Repository("subjectDao")
public class SubjectDaoImpl extends GenericDaoImpl<Subject, Long> implements SubjectDao {

	@Override
	public Subject exists(String name, String orgId) throws Exception {
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("name", name);
		vo.getWhereClause().put("organization.id", orgId);
		List<Subject> list = findAllByQueryFilter(vo);
		Subject result = null;
		if(!CollectionUtils.isEmpty(list)) result = list.get(0);
		return result;
	}
}
