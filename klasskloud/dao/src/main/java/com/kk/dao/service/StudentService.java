package com.kk.dao.service;

import com.kk.core.vo.StudentVO;
import com.kk.dao.model.Student;

public interface StudentService extends GenericService<Student,Long>{
	
	Student exists(String firstName, String lastName, Long orgId) throws Exception;
	
	Student rollNoExists(String rollNo, Long orgId) throws Exception;
	
	Boolean save(StudentVO vo);

	void update(StudentVO vo) throws Exception;
	

}
