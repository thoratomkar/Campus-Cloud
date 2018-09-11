package com.kk.web.common;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

import com.kk.dao.model.Organization;
import com.kk.dao.model.Role;
import com.kk.dao.model.User;
import com.kk.web.service.CustomUser;

@Component
@Scope(value="session",  proxyMode = ScopedProxyMode.TARGET_CLASS)
public class KKContext{
	
	private Organization organization;
	private CustomUser principleUser;
	private User loggedInUser;
	private Role loggedInUserRole;
	private List<Organization> orgList;
	private Long selectedOrgId;
	

	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	public CustomUser getPrincipleUser() {
		return principleUser;
	}

	public void setPrincipleUser(CustomUser principleUser) {
		this.principleUser = principleUser;
	}

	public User getLoggedInUser() {
		return loggedInUser;
	}

	public void setLoggedInUser(User loggedInUser) {
		this.loggedInUser = loggedInUser;
	}

	public Role getLoggedInUserRole() {
		return loggedInUserRole;
	}

	public void setLoggedInUserRole(Role loggedInUserRole) {
		this.loggedInUserRole = loggedInUserRole;
	}

	public List<Organization> getOrgList() {
		return orgList;
	}

	public void setOrgList(List<Organization> orgList) {
		this.orgList = orgList;
	}

	public Long getSelectedOrgId() {
		return selectedOrgId;
	}

	public void setSelectedOrgId(Long selectedOrgId) {
		this.selectedOrgId = selectedOrgId;
	}
	
	
}