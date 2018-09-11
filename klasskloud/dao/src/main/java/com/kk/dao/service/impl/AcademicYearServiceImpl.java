package com.kk.dao.service.impl;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kk.core.util.CommonUtils;
import com.kk.core.vo.AcadVO;
import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.factory.AcdemicYearDao;
import com.kk.dao.model.AcadYear;
import com.kk.dao.service.AcademicYearService;
import com.kk.dao.service.OrganizationService;

@Service
@Transactional(rollbackOn = Exception.class)
public class AcademicYearServiceImpl extends GenericServiceImpl<AcadYear,Long> implements AcademicYearService{

	@Autowired
	private AcdemicYearDao acdemicYearDao;
	
	@Autowired
	private OrganizationService organizationService;

	public Boolean save(AcadVO vo) throws Exception {
		AcadYear acadYear=new AcadYear();
		BeanUtils.copyProperties(vo, acadYear);
		acadYear.setOrganization(organizationService.get(vo.getOrgId()));
		acadYear.setAcadYear(CommonUtils.monthMap.get(vo.getStartMonth())+" "
				+ vo.getStartYear()+" - "
						+ CommonUtils.monthMap.get(vo.getEndMonth())+" "
								+vo.getEndYear());
		if(vo.getIsCurrent()){
			updateCurrentYearFlag();
		}
		acdemicYearDao.saveOrUpdate(acadYear);
		
		return true;
	}
	
	public Boolean update(AcadVO vo) throws Exception {
		AcadYear acadYear= get(vo.getId());
		acadYear.setAcadYear(CommonUtils.monthMap.get(vo.getStartMonth())+" "
				+ vo.getStartYear()+" - "
						+ CommonUtils.monthMap.get(vo.getEndMonth())+" "
								+vo.getEndYear());
		acadYear.setName(vo.getName());
		acadYear.setStartMonth(vo.getStartMonth());
		
		if(vo.getIsCurrent()){
			updateCurrentYearFlag();
		}
		acadYear.setIsCurrent(vo.getIsCurrent());
		acadYear.setOrganization(organizationService.get(vo.getOrgId()));
		acadYear.setStartYear(vo.getStartYear());
		acadYear.setEndMonth(vo.getEndMonth());
		acadYear.setEndYear(vo.getEndYear());
		acadYear.setUpdatedAt(new Date());
		acdemicYearDao.update(acadYear);
		
		return true;
	}
	
	private void updateCurrentYearFlag() throws Exception{
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("isCurrent",Boolean.TRUE.toString());
		List<AcadYear> ayList = acdemicYearDao.findAllByQueryFilter(vo);
		if(null != ayList && ayList.size() > 0){
			AcadYear ay = ayList.get(0);
			ay.setIsCurrent(Boolean.FALSE);
			ay.setUpdatedAt(new Date());
			acdemicYearDao.update(ay);
		}
	}
	
}