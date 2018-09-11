package com.kk.dao.service.impl;

import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.kk.core.util.DateUtils;
import com.kk.core.vo.QueryFilterVO;
import com.kk.core.vo.TestVO;
import com.kk.dao.factory.TestDao;
import com.kk.dao.model.Student;
import com.kk.dao.model.Test;
import com.kk.dao.service.AcademicYearService;
import com.kk.dao.service.BatchSevice;
import com.kk.dao.service.CourseService;
import com.kk.dao.service.OrganizationService;
import com.kk.dao.service.StudentService;
import com.kk.dao.service.SubjectService;
import com.kk.dao.service.TestService;

@Service
@Transactional(rollbackOn = Exception.class)
public class TestServiceImpl extends GenericServiceImpl<Test,Long> implements TestService{

	@Autowired
	private TestDao testDao;
	
	@Autowired
	private OrganizationService organizationService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private BatchSevice batchService;
	
	@Autowired
	private AcademicYearService academicYearService;
	
	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private StudentService studentService;
	
	@Override
	public Test exists(String name, String code, Long batchId) throws Exception {
		Test test = null;
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("isDeleted",Boolean.FALSE.toString());
		vo.getWhereClause().put("name",name);
		vo.getWhereClause().put("code", code);
		vo.getWhereClause().put("batch.id", String.valueOf(batchId));
		List<Test> tList = testDao.findAllByQueryFilter(vo);
		if(null != tList && tList.size() > 0){
			test = tList.get(0);
		}
		return test;
	}

	@Override
	public Boolean save(TestVO vo) {
		Boolean result = Boolean.FALSE;
		try {
			Test test = exists(vo.getName(), vo.getCode(), vo.getBatchId());
			if(null != test   && !test.getIsDeleted()) return result;
			if(null == test) {
				test = new Test();
			}
			BeanUtils.copyProperties(vo, test);
			test.setIsDeleted(Boolean.FALSE);
			if(null == test.getId()) test.setCreatedAt(new Date());
			test.setUpdatedAt(new Date());
			test.setOrganization(organizationService.get(vo.getOrgId()));
			test.setAcadYear(academicYearService.get(vo.getAyId()));
			test.setCourse(courseService.get(vo.getCourseId()));
			test.setBatch(batchService.get(vo.getBatchId()));
			test.setSubject(subjectService.get(vo.getSubjectId()));
			test.setTestDate(DateUtils.getDBDate(vo.getTestDate()));
			saveOrUpdate(test);
			result = Boolean.TRUE;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void update(TestVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Test> getAllTestsForStudent(Long studentId) throws Exception {
		Student student = studentService.get(studentId);
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("isDeleted",Boolean.FALSE.toString());
		vo.getWhereClause().put("batch.id", String.valueOf(student.getBatch().getId()));
		List<Test> tList = testDao.findAllByQueryFilter(vo);
		if(CollectionUtils.isEmpty(tList)){
			tList = Collections.EMPTY_LIST;
		}
		return tList;
	}
}