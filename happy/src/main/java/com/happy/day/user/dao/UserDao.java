package com.happy.day.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happy.day.dto.UserDto;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public UserDto selectUser(UserDto userDto) {
		return sqlSession.selectOne("selectUser", userDto);
	}
	
	public void insertUser(UserDto userDto) {
		sqlSession.insert("insertUser",userDto);
	}
	
}
