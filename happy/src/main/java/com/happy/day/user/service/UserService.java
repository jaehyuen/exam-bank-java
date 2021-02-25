package com.happy.day.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happy.day.common.dto.ResultDto;
import com.happy.day.user.dao.UserDao;
import com.happy.day.user.dto.UserDto;
import com.happy.day.util.Util;

@Service
public class UserService {

	@Autowired
	UserDao userDao;

	Util util = new Util();

	public ResultDto duplicateCheck(UserDto userDto) {

		UserDto user = userDao.selectUser(userDto);
		System.out.println(user);

		if (user == null) {
			return util.setResult("0000", true, "사용 가능한 아이디", "");
		} else {
			return util.setResult("9999", false, "사용중인 아이디", "");
		}

	}

	public ResultDto joinUser(UserDto userDto) {
		userDao.insertUser(userDto);
		return util.setResult("0000", true, "가입 성공", "");
	}



	public ResultDto loginUser(UserDto userDto, HttpServletRequest request) {

		HttpSession session = request.getSession();

		UserDto user = userDao.selectUser(userDto);

		if (user != null) {
			if (user.getUserPassword().equals(userDto.getUserPassword())) {

				session.setAttribute("userId", user.getUserId());
				session.setAttribute("userName", user.getUserName());
				session.setAttribute("userSeq", user.getUserSeq());

				return util.setResult("0000", true, "로그인 성공", "");

			}
		}

		return util.setResult("9999", false, "로그인 실패", "");

	}
	
	public void logout(HttpServletRequest request) {
		HttpSession session = request.getSession();

		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.removeAttribute("userSeq");
		
	}
}
