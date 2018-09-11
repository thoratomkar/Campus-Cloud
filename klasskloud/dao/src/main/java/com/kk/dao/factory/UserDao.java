package com.kk.dao.factory;

import com.kk.dao.model.User;


public interface UserDao {

	User findByUserName(String username);

}

