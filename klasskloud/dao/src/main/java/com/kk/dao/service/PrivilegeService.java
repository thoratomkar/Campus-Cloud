package com.kk.dao.service;

import com.kk.core.vo.PermissionsVO;
import com.kk.dao.model.Privilege;

public interface PrivilegeService extends GenericService<Privilege,Long> {
	
	Privilege exists(Long moduleId, Long operationId) throws Exception;
	
	Boolean save(PermissionsVO vo);
}