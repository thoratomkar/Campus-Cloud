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
import com.kk.core.vo.BatchVO;
import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.factory.BatchDao;
import com.kk.dao.model.Batch;
import com.kk.dao.service.AcademicYearService;
import com.kk.dao.service.BatchSevice;
import com.kk.dao.service.CourseService;
import com.kk.dao.service.OrganizationService;

@Service
@Transactional(rollbackOn = Exception.class)
public class BatchServiceImpl extends GenericServiceImpl<Batch,Long> implements BatchSevice {

	@Autowired
	private BatchDao batchDao;
	
	@Autowired
	private AcademicYearService academicYearService;
	
	@Autowired
	private CourseService courseSevice;
	
	@Autowired
	private OrganizationService orgService;
	
	public Batch exists(String name, String orgId) throws Exception {
		return batchDao.exists(name, orgId);
	}

	@Override
	public Boolean save(BatchVO vo) throws Exception {
		Boolean result = Boolean.FALSE;
		try {
			Batch batch = exists(vo.getName(), String.valueOf(vo.getOrgId()));
			if (null != batch && !batch.getIsDeleted())
				return result;
			if (null == batch)
				batch = new Batch();

			BeanUtils.copyProperties(vo,batch);
			batch.setOrganization(orgService.get(vo.getOrgId()));
			batch.setIsDeleted(Boolean.FALSE);
			batch.setAcadYear(academicYearService.get(vo.getAyId()));
			batch.setCourse(courseSevice.get(vo.getCourseId()));
			batch.setStartDate(DateUtils.getDBDate(vo.getStartDate()));
			batch.setEndDate(DateUtils.getDBDate(vo.getEndDate()));
			if (null == batch.getId())
				batch.setCreatedAt(new Date());
			batch.setUpdatedAt(new Date());
			saveOrUpdate(batch);
			result = Boolean.TRUE;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Boolean update(BatchVO vo) throws Exception {
		Boolean result = Boolean.FALSE;
		try {
			Batch batch = get(vo.getId());
			if (!batch.getName().equalsIgnoreCase(vo.getName())) {
				Batch course1 = exists(vo.getName(), String.valueOf(vo.getOrgId()));
				if (null != course1)
					return result;
			}
			batch.setName(vo.getName());
			batch.setCode(vo.getCode());
			batch.setDescription(vo.getDescription());
			batch.setUpdatedAt(new Date());
			update(batch);
			result = Boolean.TRUE;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public Batch getBatchByNameAndCode(BatchVO batchVO) throws Exception{
		Batch batch = null;
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("isDeleted",Boolean.FALSE.toString());
		vo.getWhereClause().put("name",batchVO.getName());
		vo.getWhereClause().put("code", batchVO.getCode());
		
		List<Batch> cList = batchDao.findAllByQueryFilter(vo);
		if(null != cList && cList.size() > 0){
			batch = cList.get(0);
		}
		return batch;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Batch> getBatchListByCourse(Long courseId) throws Exception {
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("isDeleted",Boolean.FALSE.toString());
		vo.getWhereClause().put("batch.id",String.valueOf(courseId));
		
		List<Batch> bList = batchDao.findAllByQueryFilter(vo);
		if(CollectionUtils.isEmpty(bList)){
			bList = Collections.EMPTY_LIST;
		}
		return bList;
	}

}