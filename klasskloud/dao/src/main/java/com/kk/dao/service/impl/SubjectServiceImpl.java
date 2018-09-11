package com.kk.dao.service.impl;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kk.core.vo.QueryFilterVO;
import com.kk.core.vo.SubjectVO;
import com.kk.dao.factory.SubjectDao;
import com.kk.dao.model.Organization;
import com.kk.dao.model.Subject;
import com.kk.dao.service.SubjectService;

@Service
@Transactional(rollbackOn = Exception.class)
public class SubjectServiceImpl extends GenericServiceImpl<Subject,Long> implements SubjectService {

	@Autowired
	private SubjectDao subjectDao;

	public Subject exists(String name, String orgId) throws Exception {
		return subjectDao.exists(name, orgId);
	}

	@Override
	public Boolean save(SubjectVO vo, Organization organization) throws Exception {
		Boolean result = Boolean.FALSE;
		try {
			Subject subject = exists(vo.getName(), String.valueOf(organization.getId()));
			if (null != subject && !subject.getIsDeleted())
				return result;
			if (null == subject)
				subject = new Subject();

			BeanUtils.copyProperties(vo,subject);
			subject.setOrganization(organization);
			subject.setIsDeleted(Boolean.FALSE);
			if (null == subject.getId())
				subject.setCreatedAt(new Date());
			subject.setUpdatedAt(new Date());
			saveOrUpdate(subject);
			result = Boolean.TRUE;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Boolean update(SubjectVO vo) throws Exception {
		Boolean result = Boolean.FALSE;
		try {
			Subject subject = get(vo.getId());
			if (!subject.getName().equalsIgnoreCase(vo.getName())) {
				Subject course1 = exists(vo.getName(), String.valueOf(vo.getOrgId()));
				if (null != course1)
					return result;
			}
			subject.setName(vo.getName());
			subject.setCode(vo.getCode());
			subject.setDescription(vo.getDescription());
			subject.setUpdatedAt(new Date());
			update(subject);
			result = Boolean.TRUE;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public Subject getSubjectByNameAndCode(SubjectVO subjectVO) throws Exception{
		Subject subject = null;
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("isDeleted",Boolean.FALSE.toString());
		vo.getWhereClause().put("name",subjectVO.getName());
		vo.getWhereClause().put("code", subjectVO.getCode());
		
		List<Subject> cList = subjectDao.findAllByQueryFilter(vo);
		if(null != cList && cList.size() > 0){
			subject = cList.get(0);
		}
		return subject;
	}

	
}