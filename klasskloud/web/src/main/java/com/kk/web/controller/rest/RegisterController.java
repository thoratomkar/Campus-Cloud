package com.kk.web.controller.rest;

import static com.kk.core.constant.MessageConstants.USER_ALREADY_EXISTS;
import static com.kk.core.constant.MessageConstants.USER_CREATED;
import static com.kk.core.constant.MessageConstants.USER_ERROR;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kk.core.vo.UserVO;
import com.kk.dao.model.User;
import com.kk.dao.service.UserService;
import com.kk.web.vo.RestResponse;

@RestController
@RequestMapping("/rest")
public class RegisterController{
	
	@Autowired
	private UserService userService;
	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/user/check", method = RequestMethod.POST)
	public RestResponse check(UserVO vo){
		RestResponse response = new RestResponse();
		response.setUserExists(userService.exists(vo.getUsername()));
		return response;
	}
	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/user/json/check", method = RequestMethod.POST)
	public RestResponse jsonUserCheck(@RequestBody UserVO vo) {
		RestResponse response = new RestResponse();
		response.setUserExists(userService.exists(vo.getUsername()));
		return response;
	}
	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public RestResponse create(UserVO vo) {
		RestResponse response = new RestResponse();
		Boolean status = Boolean.FALSE;
		try {
			User user = userService.findByUserName(vo.getUsername());
			if(null != user){
				response.setUserExists(Boolean.TRUE);
				response.setStatusText(USER_ALREADY_EXISTS);
			}else{
				response.setUserExists(Boolean.FALSE);
				response.setStatusText(USER_CREATED);
				status = Boolean.TRUE;
				vo.setRole("ROLE_ADMIN");
				userService.save(vo);
			}
			response.setStatus(status);
			
		} catch (Exception e) {
			response.setStatus(Boolean.FALSE);
			response.setStatusText(USER_ERROR);
			e.printStackTrace();
		}
		return response;
	}
	
	
	
}