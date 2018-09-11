package com.kk.dao.service.impl;

import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.kk.core.vo.QueryFilterVO;
import com.kk.core.vo.SectionVO;
import com.kk.dao.factory.SectionDao;
import com.kk.dao.model.Section;
import com.kk.dao.service.AcademicYearService;
import com.kk.dao.service.BatchSevice;
import com.kk.dao.service.OrganizationService;
import com.kk.dao.service.SectionService;

@Service
@Transactional(rollbackOn = Exception.class)
public class SectionServiceImpl extends GenericServiceImpl<Section,Long> implements SectionService {

	@Autowired
	private SectionDao sectionDao;
	
	@Autowired
	private AcademicYearService academicYearService;
	
	@Autowired
	private BatchSevice batchSevice;
	
	@Autowired
	private OrganizationService orgService;
	
	public Section exists(String name, String orgId) throws Exception {
		return sectionDao.exists(name, orgId);
	}

	@Override
	public Boolean save(SectionVO vo) throws Exception {
		Boolean result = Boolean.FALSE;
		try {
			Section section = exists(vo.getName(), String.valueOf(vo.getOrgId()));
			if (null != section && !section.getIsDeleted())
				return result;
			if (null == section)
				section = new Section();

			BeanUtils.copyProperties(vo,section);
			section.setOrganization(orgService.get(vo.getOrgId()));
			section.setIsDeleted(Boolean.FALSE);
			section.setAcadYear(academicYearService.get(vo.getAyId()));
			section.setBatch(batchSevice.get(vo.getBatchId()));
			if (null == section.getId())
				section.setCreatedAt(new Date());
			section.setUpdatedAt(new Date());
			saveOrUpdate(section);
			result = Boolean.TRUE;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Boolean update(SectionVO vo) throws Exception {
		Boolean result = Boolean.FALSE;
		try {
			Section section = get(vo.getId());
			if (!section.getName().equalsIgnoreCase(vo.getName())) {
				Section course1 = exists(vo.getName(), String.valueOf(vo.getOrgId()));
				if (null != course1)
					return result;
			}
			section.setName(vo.getName());
			section.setCode(vo.getCode());
			section.setDescription(vo.getDescription());
			section.setUpdatedAt(new Date());
			update(section);
			result = Boolean.TRUE;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public Section getSectionByNameAndCode(SectionVO sectionVO) throws Exception{
		Section section = null;
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("isDeleted",Boolean.FALSE.toString());
		vo.getWhereClause().put("name",sectionVO.getName());
		vo.getWhereClause().put("code", sectionVO.getCode());
		
		List<Section> cList = sectionDao.findAllByQueryFilter(vo);
		if(null != cList && cList.size() > 0){
			section = cList.get(0);
		}
		return section;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Section> getSectionListByBatch(Long batchId) throws Exception {
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("isDeleted",Boolean.FALSE.toString());
		vo.getWhereClause().put("batch.id",String.valueOf(batchId));
		
		List<Section> sList = sectionDao.findAllByQueryFilter(vo);
		if(CollectionUtils.isEmpty(sList)){
			sList = Collections.EMPTY_LIST;
		}
		return sList;
	}

}