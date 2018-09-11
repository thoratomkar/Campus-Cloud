package com.kk.web.security;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.kk.dao.model.Organization;
import com.kk.dao.model.Role;
import com.kk.dao.model.User;
import com.kk.dao.service.OrganizationService;
import com.kk.dao.service.UserService;
import com.kk.web.common.KKContext;
import com.kk.web.service.CustomUser;

public class KKUserAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	private String defaultTargetUrl;

	@Autowired
	private KKContext context;

	@Autowired
	private UserService userService;
	
	@Autowired
	private OrganizationService organizationService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException {
		List<Organization> orgList = null;
		Role role = null;
		User user = null;
		CustomUser cu = null;
		try {
			cu = (CustomUser) authentication.getPrincipal();
			user = userService.findByUserName(cu.getUsername());

			role = cu.getRole().iterator().hasNext() ? cu.getRole().iterator().next() : null;
			context.setLoggedInUser(user);
			
			context.setPrincipleUser(cu);
			context.setLoggedInUserRole(role);
			if(null != context && !"ROLE_SUPERADMIN".equalsIgnoreCase(context.getLoggedInUserRole().getName())){
				orgList = userService.getOrganizations(context.getLoggedInUser().getId());
			}
			else{
				orgList = organizationService.getAll();
			}
			context.setOrgList(orgList);
			if(!CollectionUtils.isEmpty(orgList)){
				context.setSelectedOrgId(orgList.get(0).getId());
				context.setOrganization(orgList.get(0));
			}
			orgList = userService.getOrganizations(user.getId());
			
			request.getSession().setAttribute("context",context);
		}catch(

	Exception e)
	{
		e.printStackTrace();
	}

	handle(request, response, role);

	}

	protected void handle(HttpServletRequest request, HttpServletResponse response, Role role) throws IOException {

		String targetUrl = determineTargetUrl(role);

		if (response.isCommitted()) {
			return;
		}

		redirectStrategy.sendRedirect(request, response, targetUrl);
	}

	protected String determineTargetUrl(Role role) {

		if ("ROLE_SUPERADMIN".equalsIgnoreCase(role.getName()) || "ROLE_ADMIN".equalsIgnoreCase(role.getName())) {
			return defaultTargetUrl;
		} else {
			throw new IllegalStateException();
		}

	}

	public String getDefaultTargetUrl() {
		return defaultTargetUrl;
	}

	public void setDefaultTargetUrl(String defaultTargetUrl) {
		this.defaultTargetUrl = defaultTargetUrl;
	}

}