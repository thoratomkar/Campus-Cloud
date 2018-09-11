package com.kk.dao.factory.impl;

import org.springframework.stereotype.Repository;

import com.kk.dao.factory.OperationDao;
import com.kk.dao.model.Operation;

@Repository("operationDao")
public class OperationDaoImpl extends GenericDaoImpl<Operation, Long> implements OperationDao {


}