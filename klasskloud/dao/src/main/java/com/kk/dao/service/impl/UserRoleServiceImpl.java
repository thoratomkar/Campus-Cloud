package com.kk.dao.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kk.core.vo.QueryFilterVO;
import com.kk.dao.factory.UserRoleDao;
import com.kk.dao.model.Role;
import com.kk.dao.model.User;
import com.kk.dao.model.UserRole;
import com.kk.dao.service.UserRoleService;

@Service
@Transactional(rollbackOn = Exception.class)
public class UserRoleServiceImpl extends GenericServiceImpl<UserRole,Long> implements UserRoleService {

	@Autowired
	private UserRoleDao userRoleDao;
	
	public UserRole save(User user, Role role) throws Exception {
		UserRole userRole = new UserRole();
		userRole.setUser(user);
		userRole.setRole(role);
		userRole.setIsDeleted(Boolean.FALSE);
		userRoleDao.saveOrUpdate(userRole);
		return userRole;
	}

	@Override
	public Role getRole(Long id) throws Exception {
		QueryFilterVO queryVO = new QueryFilterVO();
		queryVO.setOrderByClause(StringUtils.EMPTY);
		queryVO.getWhereClause().remove("isDeleted");
		queryVO.getWhereClause().put("user.id",String.valueOf(id));
		List<UserRole> list = findAllByQueryFilter(queryVO);
		if(null != list && list.size() > 0){
			UserRole userRole = list.get(0);
			userRole.setRole(userRole.getRole());
			return userRole.getRole();
		}
		return null;
	}

}
