package com.kk.web.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kk.dao.factory.UserDao;
import com.kk.dao.model.Organization;
import com.kk.dao.model.Privilege;
import com.kk.dao.model.Role;
import com.kk.dao.model.User;

@Service("userDetailsService")
@Transactional
public class SecurityServiceImpl implements UserDetailsService {

	@Autowired
	private UserDao userDao;

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		User user = userDao.findByUserName(username);
		if (null == user) {
			throw new UsernameNotFoundException("User not found  [username : " + username + " ]");
		}

		Organization organization = null;
		return new CustomUser(user.getUsername(), user.getPassword(),
				user.isEnabled(), true, true, true, getAuthorities(user.getRoles()), organization, user.getRoles());

	}

	private Collection<? extends GrantedAuthority> getAuthorities(Collection<Role> roles) {
		return getGrantedAuthorities(getPrivileges(roles));
	}

	private List<String> getPrivileges(Collection<Role> roles) {
		List<String> privileges = new ArrayList<String>();
		List<Privilege> collection = new ArrayList<Privilege>();
		for (Role role : roles) {
			collection.addAll(role.getPrivileges());
		}
		for (Privilege item : collection) {
			privileges.add(item.getName());
		}
		return privileges;
	}

	private List<GrantedAuthority> getGrantedAuthorities(List<String> privileges) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for (String privilege : privileges) {
			authorities.add(new SimpleGrantedAuthority(privilege));
		}
		return authorities;
	}

}
