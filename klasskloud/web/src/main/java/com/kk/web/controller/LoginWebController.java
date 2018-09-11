package com.kk.web.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kk.dao.model.User;
import com.kk.dao.service.UserService;


@Controller
public class LoginWebController {

	@Autowired
	private UserService userService;

	@RequestMapping("/login")
	public ModelAndView getLoginForm(@RequestParam(required = false) String authfailed, @RequestParam(required = false) String logout) {
		String message = "";
		if (authfailed != null) {
			message = "Invalid username of password, try again !";
		} else if (logout != null) {
			message = "Logged Out successfully, login again to continue !";
		}

		return new ModelAndView("login", "message", message);
	}

	@RequestMapping(value="/logout", method = RequestMethod.GET)  
	 public String logout(ModelMap model) {  
	   
	  return "login";  
	   
	 } 
	
	@RequestMapping(value = "/roleAssigner", method = RequestMethod.GET)
	public String roleAssigner(Principal principal) {

		String username = principal.getName();
		User appUser = userService.findByUserName(username);

		System.out.println(appUser.toString());
		String dashboarURL = "secure/dashboard";

		// return "redirect:/persons";
		return "redirect:" + dashboarURL;

	}
	
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied(Principal user) {

		ModelAndView model = new ModelAndView();

		if (user != null) {
			model.addObject("msg", "Hi " + user.getName() 
			+ ", you do not have permission to access this page!");
		} else {
			model.addObject("msg", 
			"You do not have permission to access this page!");
		}

		model.setViewName("403");
		return model;

	}
}
