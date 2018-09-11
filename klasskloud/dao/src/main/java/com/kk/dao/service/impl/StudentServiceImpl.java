package com.kk.dao.service.impl;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kk.core.util.DateUtils;
import com.kk.core.vo.QueryFilterVO;
import com.kk.core.vo.StudentVO;
import com.kk.core.vo.UserVO;
import com.kk.dao.factory.StudentDao;
import com.kk.dao.model.Student;
import com.kk.dao.model.User;
import com.kk.dao.service.BatchSevice;
import com.kk.dao.service.CourseService;
import com.kk.dao.service.OrganizationService;
import com.kk.dao.service.SectionService;
import com.kk.dao.service.StudentService;
import com.kk.dao.service.UserService;

@Service
@Transactional(rollbackOn = Exception.class)
public class StudentServiceImpl extends GenericServiceImpl<Student,Long> implements StudentService{

	@Autowired
	private StudentDao studentDao;
	
	@Autowired
	private OrganizationService organizationService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private BatchSevice batchService;
	
	@Autowired
	private SectionService sectionService;
	
	@Autowired
	private UserService userService;

	@Override
	public Student exists(String firstName, String lastName, Long orgId) throws Exception {
		Student student = null;
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("isDeleted",Boolean.FALSE.toString());
		vo.getWhereClause().put("firstName",firstName);
		vo.getWhereClause().put("lastName", lastName);
		vo.getWhereClause().put("organization.id", String.valueOf(orgId));
		List<Student> sList = studentDao.findAllByQueryFilter(vo);
		if(null != sList && sList.size() > 0){
			student = sList.get(0);
		}
		return student;
	}
	
	@Override
	public Student rollNoExists(String rollNo, Long orgId) throws Exception {
		Student student = null;
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("isDeleted",Boolean.FALSE.toString());
		vo.getWhereClause().put("rollNo",rollNo);
		vo.getWhereClause().put("organization.id", String.valueOf(orgId));
		List<Student> sList = studentDao.findAllByQueryFilter(vo);
		if(null != sList && sList.size() > 0){
			student = sList.get(0);
		}
		return student;
	}
	
	@Override
	public Boolean save(StudentVO vo) {
		Boolean result = Boolean.FALSE;
		User user = null;
		try {
			Student student = exists(vo.getFirstName(), vo.getLastName(), vo.getOrgId());
			if(null != student   && !student.getIsDeleted()) return result;
			if(null == student) {
				student = new Student();
				UserVO userVO = new UserVO();
				userVO.setUsername(vo.getLoginUserName());
				userVO.setPassword("India1234");
				userVO.setContactEmail(vo.getEmailAddress());
				userVO.setOrgId(vo.getOrgId());
				userVO.setRole("ROLE_STUDENT");
				userService.save(userVO);
			}
			user = userService.findByUserName(vo.getLoginUserName());
			BeanUtils.copyProperties(vo, student);
			student.setOrganization(organizationService.get(vo.getOrgId()));
			student.setIsDeleted(Boolean.FALSE);
			if(null == student.getId()) student.setCreatedAt(new Date());
			student.setFullName(vo.getFirstName() + " " + vo.getMiddleName() + " " + vo.getLastName() );
			student.setUpdatedAt(new Date());
			student.setCourse(courseService.get(vo.getCourseId()));
			student.setSection(sectionService.get(vo.getSectionId()));
			student.setBatch(batchService.get(vo.getBatchId()));
			student.setDateOfBirth(DateUtils.getDBDate(vo.getDateOfBirth()));
			student.setUser(user);
			saveOrUpdate(student);
			
			result = Boolean.TRUE;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public void update(StudentVO vo) throws Exception {
	}
	


}
