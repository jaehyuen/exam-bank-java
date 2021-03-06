package com.happy.day.question.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happy.day.question.dto.ExampleDto;
import com.happy.day.question.dto.QuestionDto;
import com.happy.day.question.dto.QuestionListDto;

@Repository
public class QuestionDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<QuestionListDto> getQuestionList(QuestionDto questionDto) {
		return sqlSession.selectList("selectQuestionList", questionDto);
	}

	public int insertQuestion(QuestionDto questionDto) {

		sqlSession.insert("insertQuestion", questionDto);
		return questionDto.getQuestionSeq();
	}

}
