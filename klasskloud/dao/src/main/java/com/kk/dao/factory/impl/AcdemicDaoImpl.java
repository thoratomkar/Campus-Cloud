package com.kk.dao.factory.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kk.dao.factory.AcdemicYearDao;
import com.kk.dao.model.AcadYear;

//@Repository("acdemicDao")
@Repository
public class AcdemicDaoImpl  extends GenericDaoImpl<AcadYear,Long> implements AcdemicYearDao {
	
	@SuppressWarnings("unused")
	@Autowired
    private SessionFactory sessionFactory;


}