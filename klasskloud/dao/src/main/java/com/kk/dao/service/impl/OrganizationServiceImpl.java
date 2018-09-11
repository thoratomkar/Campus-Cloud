package com.kk.dao.service.impl;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kk.core.vo.OrganizationVO;
import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.factory.OrganizationDao;
import com.kk.dao.factory.UserOrgAssocDao;
import com.kk.dao.model.Organization;
import com.kk.dao.model.User;
import com.kk.dao.model.UserOrgAssoc;
import com.kk.dao.service.OrganizationService;
import com.kk.dao.service.UserService;

@Service
@Transactional(rollbackOn = Exception.class)
public class OrganizationServiceImpl extends GenericServiceImpl<Organization,Long> implements OrganizationService{

	@Autowired
	private OrganizationDao organizationDao;
	
	@Autowired
	private UserOrgAssocDao userOrgAssocDao;
	
	@Autowired
	private UserService userService;

	
	@Override
	public Organization exists(String name) throws Exception {
		return organizationDao.exists(name);
	}

	@Override
	public Boolean save(OrganizationVO vo) {
		Boolean result = Boolean.FALSE;
		Boolean createOrg = Boolean.FALSE;
		try {
			Organization organization = exists(vo.getName());
			if(null != organization   && !organization.getIsDeleted()) return result;
			if(null == organization) {
				organization = new Organization();
				createOrg = Boolean.TRUE;
			}
			
			organization.setName(vo.getName());
			organization.setCode(vo.getCode());
			organization.setIsDeleted(Boolean.FALSE);
			if(null == organization.getId()) organization.setCreatedAt(new Date());
			organization.setUpdatedAt(new Date());
			saveOrUpdate(organization);
			result = Boolean.TRUE;
			
			// create organization assoc
			if(createOrg){
				User user = userService.findByUserName(vo.getLoggedInUserName());
				UserOrgAssoc assoc = new UserOrgAssoc(user, organization);
				userOrgAssocDao.saveOrUpdate(assoc);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void update(OrganizationVO vo) throws Exception {
		Organization organization = get(vo.getId());
		organization.setName(vo.getName());
		organization.setCode(vo.getCode());
		organization.setUpdatedAt(new Date());
		update(organization);
	}
	
	@Override
	public Organization getOrganizationByNameAndCode(OrganizationVO organizationVO) throws Exception{
		Organization organization = null;
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("isDeleted",Boolean.FALSE.toString());
		vo.getWhereClause().put("name",organizationVO.getName());
		vo.getWhereClause().put("code", organizationVO.getCode());
		
		List<Organization> mList = organizationDao.findAllByQueryFilter(vo);
		if(null != mList && mList.size() > 0){
			organization = mList.get(0);
		}
		return organization;
	}

	
}