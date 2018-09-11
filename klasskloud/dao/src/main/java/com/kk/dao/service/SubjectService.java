package com.kk.dao.service;

import com.kk.core.vo.SubjectVO;
import com.kk.dao.model.Organization;
import com.kk.dao.model.Subject;

public interface SubjectService extends GenericService<Subject, Long> {

	Subject exists(String name, String orgId) throws Exception;

	Boolean save(SubjectVO subjectVO, Organization organization) throws Exception;

	Boolean update(SubjectVO subjectVO) throws Exception;

	public Subject getSubjectByNameAndCode(SubjectVO subjectVO) throws Exception;

}