package com.happy.day.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.happy.day.common.dto.ResultDto;
import com.happy.day.user.dto.UserDto;
import com.happy.day.user.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserController {

	@Autowired
	UserService userService;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = "/user/login", method = RequestMethod.GET)
	public String loginPage() {
		
		logger.debug("[loginPage] start /user/login get");
		
		return "user/login";
	}

	@RequestMapping(value = "/user/join", method = RequestMethod.GET)
	public String joinPage() {
		
		logger.debug("[joinPage] start /user/join get");
		
		return "user/join";
	}

	@RequestMapping(value = "/user/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {

		logger.debug("[logout] start /user/logout get"); 
		
		userService.logout(request);
		
		return "redirect:/main";
	}

	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	public @ResponseBody ResultDto login(@RequestBody UserDto userDto, HttpServletRequest request) {
		
		logger.debug("[login] start /user/login post");
		logger.debug("[login] userDto is : " + userDto);

		return userService.loginUser(userDto, request);
	}

	@RequestMapping(value = "/user/join", method = RequestMethod.POST)
	public @ResponseBody ResultDto join(@ModelAttribute UserDto userDto) {
		
		logger.debug("[join] start /user/join post");
		logger.debug("[join] userDto is : " + userDto);

		return userService.joinUser(userDto);
	}

	@RequestMapping(value = "/user/check", method = RequestMethod.POST)
	public @ResponseBody ResultDto duplicateCheck(@ModelAttribute UserDto userDto) {
		
		logger.debug("[duplicateCheck] start /user/check post");
		logger.debug("[duplicateCheck] userDto is : " + userDto);

		return userService.duplicateCheck(userDto);
	}

}

