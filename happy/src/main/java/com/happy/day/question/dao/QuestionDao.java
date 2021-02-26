package com.happy.day.question.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happy.day.question.dto.QuestionDto;

@Repository
public class QuestionDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<QuestionDto> getQuestionList(QuestionDto questionDto) {
		return sqlSession.selectList("selectQuestionList", questionDto);
	}
	

	
}
