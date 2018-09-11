package com.kk.dao.service;

import java.util.List;

import com.kk.core.vo.UserVO;
import com.kk.dao.model.Organization;
import com.kk.dao.model.User;

public interface UserService extends GenericService<User,Long> {

	User findByUserName(String username);
	
	boolean exists(String username);

	Boolean save(UserVO vo);
	
	List<Organization> getOrganizations(Long userId) throws Exception;
}
