package com.kk.dao.service.impl;

import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.kk.core.vo.AttendanceVO;
import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.factory.AttendanceDao;
import com.kk.dao.model.Attendance;
import com.kk.dao.model.Student;
import com.kk.dao.service.AcademicYearService;
import com.kk.dao.service.AttendanceService;
import com.kk.dao.service.BatchSevice;
import com.kk.dao.service.CourseService;
import com.kk.dao.service.OrganizationService;
import com.kk.dao.service.SectionService;
import com.kk.dao.service.StudentService;
import com.kk.dao.service.SubjectService;

@Service
@Transactional(rollbackOn = Exception.class)
public class AttendanceServiceImpl extends GenericServiceImpl<Attendance,Long> implements AttendanceService{
	
	@Autowired
	private AttendanceDao attendanceDao;

	@Autowired
	private OrganizationService organizationService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private BatchSevice batchService;
	
	@Autowired
	private SectionService sectionService;

	@Autowired
	private AcademicYearService academicYearService;
	
	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private StudentService studentService;
	
	
	@Override
	public Attendance exists(String rollno, Long subjectId, Long sectionId) throws Exception{
		Attendance attendance = null;
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("isDeleted",Boolean.FALSE.toString());
		vo.getWhereClause().put("rollno", rollno);
		vo.getWhereClause().put("section.id", String.valueOf(sectionId));
		vo.getWhereClause().put("subject.id", String.valueOf(subjectId));
		List<Attendance> attendanceList = attendanceDao.findAllByQueryFilter(vo);
		if(null != attendanceList && attendanceList.size() > 0){
			attendance = attendanceList.get(0);
		}
		return attendance;
	}
	
	@Override
	public Boolean save(AttendanceVO vo) {
		Boolean result = Boolean.FALSE;
		try {
			Attendance attendance = exists(vo.getRollno(),vo.getSubjectId(),vo.getSectionId());
			if(null != attendance   && !attendance.getIsDeleted()) return result;
			if(null == attendance) {
				 attendance = new Attendance();
			}
			Student stud = studentService.get(Long.valueOf(vo.getStudentId()));
			attendance.setStudent(studentService.get(Long.valueOf(vo.getStudentId())));
			attendance.setOrganization(organizationService.get(vo.getOrgId()));
			attendance.setAcadYear(academicYearService.get(vo.getAyId()));
			attendance.setCourse(courseService.get(vo.getCourseId()));
			attendance.setBatch(batchService.get(vo.getBatchId()));
			attendance.setSection(sectionService.get(vo.getSectionId()));
			attendance.setSubject(subjectService.get(vo.getSubjectId()));
			attendance.setRollno(stud.getRollNo());
			attendance.setIsDeleted(Boolean.FALSE);
			if(null == attendance.getId()) attendance.setCreatedAt(new Date());
			attendance.setUpdatedAt(new Date());
			attendance.setW1(vo.getW1());
			attendance.setW2(vo.getW2());
			attendance.setW3(vo.getW3());
			attendance.setW4(vo.getW4());
			attendance.setW5(vo.getW5());
			attendance.setW6(vo.getW6());
			attendance.setW7(vo.getW7());
			attendance.setW8(vo.getW8());
			attendance.setW9(vo.getW9());
			saveOrUpdate(attendance);
			result = Boolean.TRUE;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public void update(AttendanceVO vo) throws Exception {
		Attendance attendance = get(vo.getId());
		attendance.setUpdatedAt(new Date());
		attendance.setW1(vo.getW1());
		attendance.setW2(vo.getW2());
		attendance.setW3(vo.getW3());
		attendance.setW4(vo.getW4());
		attendance.setW5(vo.getW5());
		attendance.setW6(vo.getW6());
		attendance.setW7(vo.getW7());
		attendance.setW8(vo.getW8());
		attendance.setW9(vo.getW9());
		update(attendance);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Attendance> getAllAttendanceForSection(Long sectionId, Long subjectId) throws Exception{
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("isDeleted",Boolean.FALSE.toString());
		vo.getWhereClause().put("section.id",String.valueOf(sectionId));
		vo.getWhereClause().put("subject.id",String.valueOf(subjectId));
		List<Attendance> aList = attendanceDao.findAllByQueryFilter(vo);
		if(CollectionUtils.isEmpty(aList)){
			aList = Collections.EMPTY_LIST;
		}
		return aList;
	}

}
