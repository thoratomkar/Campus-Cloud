package com.kk.dao.factory.impl;

import org.springframework.stereotype.Repository;

import com.kk.dao.factory.TestDao;
import com.kk.dao.model.Test;

@Repository("testDao")
public class TestDaoImpl extends GenericDaoImpl<Test, Long> implements TestDao{


}
