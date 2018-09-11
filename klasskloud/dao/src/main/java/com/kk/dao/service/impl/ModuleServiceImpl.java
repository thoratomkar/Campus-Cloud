package com.kk.dao.service.impl;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kk.core.vo.ModuleVO;
import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.factory.ModuleDao;
import com.kk.dao.model.Module;
import com.kk.dao.service.ModuleService;

@Service
@Transactional(rollbackOn = Exception.class)
public class ModuleServiceImpl extends GenericServiceImpl<Module,Long> implements ModuleService{

	@Autowired
	private ModuleDao moduleDao;
	
	@Override
	public Module exists(String name) throws Exception {
		return moduleDao.exists(name);
	}

	@Override
	public Boolean save(ModuleVO vo) {
		Boolean result = Boolean.FALSE;
		try {
			Module module = exists(vo.getName());
			if(null != module   && !module.getIsDeleted()) return result;
			if(null == module) module = new Module();
			
			module.setName(vo.getName());
			module.setCode(vo.getCode());
			module.setIsDeleted(Boolean.FALSE);
			if(null == module.getId()) module.setCreatedAt(new Date());
			module.setUpdatedAt(new Date());
			saveOrUpdate(module);
			result = Boolean.TRUE;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void update(ModuleVO vo) throws Exception {
		Module module = get(vo.getId());
		module.setName(vo.getName());
		module.setCode(vo.getCode());
		module.setUpdatedAt(new Date());
		update(module);
	}
	
	@Override
	public Module getModuleByNameAndCode(ModuleVO moduleVO) throws Exception{
		Module module = null;
		QueryFilterVO vo = new QueryFilterVO();
		vo.getWhereClause().put("isDeleted",Boolean.FALSE.toString());
		vo.getWhereClause().put("name",moduleVO.getName());
		vo.getWhereClause().put("code", moduleVO.getCode());
		
		List<Module> mList = moduleDao.findAllByQueryFilter(vo);
		if(null != mList && mList.size() > 0){
			module = mList.get(0);
		}
		return module;
	}

	
}