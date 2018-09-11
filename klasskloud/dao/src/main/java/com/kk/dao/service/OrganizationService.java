package com.kk.dao.service;

import com.kk.core.vo.OrganizationVO;
import com.kk.dao.model.Organization;

public interface OrganizationService  extends GenericService<Organization,Long>{
	
	Organization exists(String name) throws Exception;
	
	Boolean save(OrganizationVO vo);

	void update(OrganizationVO vo) throws Exception;
	
	Organization getOrganizationByNameAndCode(OrganizationVO organizationVO) throws Exception;
	
}