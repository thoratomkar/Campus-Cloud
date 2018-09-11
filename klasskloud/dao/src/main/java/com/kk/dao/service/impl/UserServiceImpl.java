package com.kk.dao.service.impl;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kk.core.vo.UserVO;
import com.kk.dao.factory.UserDao;
import com.kk.dao.model.Organization;
import com.kk.dao.model.User;
import com.kk.dao.model.UserOrgAssoc;
import com.kk.dao.service.OrganizationService;
import com.kk.dao.service.RoleService;
import com.kk.dao.service.UserOrgAssocService;
import com.kk.dao.service.UserRoleService;
import com.kk.dao.service.UserService;

@Service
@Transactional(rollbackOn = Exception.class)
public class UserServiceImpl extends GenericServiceImpl<User,Long> implements UserService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private UserRoleService userRoleService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private UserOrgAssocService userOrgAssocService;

	@Autowired
	private OrganizationService organizationService;
	
	public User findByUserName(String username) {
		return userDao.findByUserName(username);
	}

	@Override
	public boolean exists(String username) {
		User user = findByUserName(username);
		return user != null ? Boolean.TRUE: Boolean.FALSE;
	}

	@Override
	public Boolean save(UserVO vo) {
		Boolean result = Boolean.FALSE;
		try {
			User user = new User();
			user.setUsername(vo.getUsername());
			user.setPassword(vo.getPassword());
			user.setContactEmail(vo.getContactEmail());
			user.setIsDeleted(Boolean.FALSE);
			user.setCreatedAt(new Date());
			user.setUpdatedAt(new Date());
			user.setEnabled(Boolean.TRUE);
			saveOrUpdate(user);
			
			//create user_role entry
			userRoleService.save(user, roleService.findByRoleName(vo.getRole()));
			
			UserOrgAssoc assoc = new UserOrgAssoc(user, organizationService.get(vo.getOrgId()));
			userOrgAssocService.saveOrUpdate(assoc);
			
			result = Boolean.TRUE;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Organization> getOrganizations(Long userId) throws Exception {
		return userOrgAssocService.getOrganizationsByUser(userId);
	}

}
