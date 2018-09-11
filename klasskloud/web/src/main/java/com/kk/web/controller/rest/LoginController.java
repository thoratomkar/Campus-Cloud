package com.kk.web.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kk.core.vo.QueryFilterVO;
import com.kk.core.vo.UserVO;
import com.kk.dao.model.Organization;
import com.kk.dao.model.Role;
import com.kk.dao.model.User;
import com.kk.dao.service.UserRoleService;
import com.kk.dao.service.UserService;
import com.kk.web.common.KKContext;
import com.kk.web.vo.RestResponse;

@RestController
@RequestMapping("/rest")
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserRoleService userRoleService;
	
	@Autowired
	private KKContext context;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	public RestResponse login(UserVO vo) {
		RestResponse response = new RestResponse();
		Organization org = null;
		try {
			QueryFilterVO queryVO = new QueryFilterVO();
			queryVO.getWhereClause().remove("isDeleted");
			queryVO.getWhereClause().put("username",vo.getUsername());
			queryVO.getWhereClause().put("password",vo.getPassword());
			List<User> list = userService.findAllByQueryFilter(queryVO);
			if(null != list && list.size() > 0){
				User user = list.get(0);
				if(null == context.getOrganization()){
					List<Organization> orgList = userService.getOrganizations(user.getId());
					org = orgList.get(0);
				}else{
					org = context.getOrganization();
				}
				response.setObject(user);
				response.setOrgId(String.valueOf(org.getId()));
				response.setOrgName(org.getName());
				Role role = userRoleService.getRole(list.get(0).getId());
				response.setStatus(Boolean.TRUE);
				response.setRole(role.getName());
				response.setRoleId(role.getId());
				response.setUserExists(Boolean.TRUE);
				response.setStatusText("User Logged-In Successfully.");
			}else{
				response.setUserExists(Boolean.FALSE);
				response.setStatus(Boolean.TRUE);
				response.setStatusText("User Doesn't Exists.");
			}
			
		}catch(Exception e){
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		
		return response;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/user/json/login", method = RequestMethod.POST)
	public RestResponse jsonLogin(@RequestBody UserVO vo) {
		RestResponse response = new RestResponse();
		try {
			QueryFilterVO queryVO = new QueryFilterVO();
			queryVO.getWhereClause().remove("isDeleted");
			queryVO.getWhereClause().put("username",vo.getUsername());
			queryVO.getWhereClause().put("password",vo.getPassword());
			List<User> list = userService.findAllByQueryFilter(queryVO);
			if(null != list && list.size() > 0){
				response.setObject(list.get(0));
				response.setStatus(Boolean.TRUE);
				response.setUserExists(Boolean.TRUE);
				response.setStatusText("User Logged-In Successfully.");
			}else{
				response.setUserExists(Boolean.FALSE);
				response.setStatus(Boolean.TRUE);
				response.setStatusText("User Doesn't Exists.");
			}
			
		}catch(Exception e){
			response.setStatus(Boolean.FALSE);
			e.printStackTrace();
		}
		
		return response;
	}
	
}