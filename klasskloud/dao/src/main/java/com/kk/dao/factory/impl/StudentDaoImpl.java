package com.kk.dao.factory.impl;

import org.springframework.stereotype.Repository;

import com.kk.dao.factory.StudentDao;
import com.kk.dao.model.Student;

@Repository("studentDao")
public class StudentDaoImpl extends GenericDaoImpl<Student, Long> implements StudentDao{


}
