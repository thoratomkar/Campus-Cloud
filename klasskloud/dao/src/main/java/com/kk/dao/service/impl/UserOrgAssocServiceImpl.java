package com.kk.dao.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kk.dao.factory.UserOrgAssocDao;
import com.kk.dao.model.Organization;
import com.kk.dao.model.User;
import com.kk.dao.model.UserOrgAssoc;
import com.kk.dao.service.UserOrgAssocService;

@Service
@Transactional(rollbackOn = Exception.class)
public class UserOrgAssocServiceImpl extends GenericServiceImpl<UserOrgAssoc, Long> implements UserOrgAssocService {

	@Autowired
	private UserOrgAssocDao userOrgAssocDao;

	public UserOrgAssoc save(User user, Organization organization) throws Exception {
		UserOrgAssoc userOrgAssoc = new UserOrgAssoc();
		userOrgAssoc.setUser(user);
		userOrgAssoc.setOrganization(organization);
		userOrgAssoc.setIsDeleted(Boolean.FALSE);
		userOrgAssocDao.saveOrUpdate(userOrgAssoc);
		return userOrgAssoc;
	}

	@Override
	public List<Organization> getOrganizationsByUser(Long id) throws Exception {
		return userOrgAssocDao.getOrganizationsByUser(id);
	}

}
