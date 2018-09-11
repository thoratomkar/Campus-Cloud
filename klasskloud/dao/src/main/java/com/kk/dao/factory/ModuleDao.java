package com.kk.dao.factory;

import com.kk.dao.model.Module;

public interface ModuleDao extends GenericDao<Module, Long>{
	
	Module exists(String name) throws Exception;
	
}