package com.kk.dao.service.impl;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kk.core.vo.OperationVO;
import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.factory.OperationDao;
import com.kk.dao.model.Operation;
import com.kk.dao.service.OperationService;

@Service
@Transactional(rollbackOn = Exception.class)
public class OperationServiceImpl extends GenericServiceImpl<Operation,Long> implements OperationService{

	@Autowired
	private OperationDao operationDao;
	
	@Override
	public Operation exists(String name) throws Exception {
		
		Operation operation = null;
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("isDeleted",Boolean.FALSE.toString());
		vo.getWhereClause().put("name",name);
		
		List<Operation> opList = operationDao.findAllByQueryFilter(vo);
		if(null != opList && opList.size() > 0){
			operation = opList.get(0);
		}
		return operation;
	}

	@Override
	public Boolean save(OperationVO vo) {
		Boolean result = Boolean.FALSE;
		try {
			Operation operation = exists(vo.getName());
			if(null != operation   && !operation.getIsDeleted()) return result;
			if(null == operation) operation = new Operation();
			
			operation.setName(vo.getName());
			operation.setIsDeleted(Boolean.FALSE);
			if(null == operation.getId()) operation.setCreatedAt(new Date());
			operation.setUpdatedAt(new Date());
			saveOrUpdate(operation);
			result = Boolean.TRUE;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void update(OperationVO vo) throws Exception {
		Operation operation = get(vo.getId());
		operation.setName(vo.getName());
		operation.setUpdatedAt(new Date());
		update(operation);
	}
	
}