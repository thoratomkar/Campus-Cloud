package com.kk.dao.service;

import com.kk.core.vo.ModuleVO;
import com.kk.dao.model.Module;

public interface ModuleService  extends GenericService<Module,Long>{
	
	Module exists(String name) throws Exception;
	
	Boolean save(ModuleVO vo);

	void update(ModuleVO vo) throws Exception;
	
	Module getModuleByNameAndCode(ModuleVO moduleVO) throws Exception;
}