package com.kk.dao.factory.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.kk.dao.factory.UserDao;
import com.kk.dao.model.User;

@Repository("userDao")
public class UserDaoImpl extends GenericDaoImpl<User, Long> implements UserDao {

	@SuppressWarnings("unchecked")
	public User findByUserName(String username) {
		List<User> users = new ArrayList<User>();
		Criteria crit;
		User user = null;
		try {
			crit = currentSession().createCriteria(User.class);
			crit.add(Restrictions.eq("username", username));
			users = crit.list();
			if (users.size() > 0) {
				user = users.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

}
