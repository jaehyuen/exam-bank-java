package com.happy.day.question.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happy.day.question.dto.QuestionDto;
import com.happy.day.question.dto.QuestionInfoDto;
import com.happy.day.question.dto.QuestionListDto;

@Repository
public class QuestionDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<QuestionListDto> selectQuestionList(QuestionDto questionDto) {
		return sqlSession.selectList("selectQuestionList", questionDto);
	}

	public QuestionDto selectQuestionInfo(QuestionDto questionDto) {
		return sqlSession.selectOne("selectQuestionInfo", questionDto);
	}

	public List<QuestionDto> selectQuestionInfoList(QuestionDto questionDto) {
		return sqlSession.selectList("selectQuestionInfoList", questionDto);
	}

	public int insertQuestion(QuestionDto questionDto) {

		sqlSession.insert("insertQuestion", questionDto);
		return questionDto.getQuestionSeq();
	}

	public QuestionDto updateQuestion(QuestionDto questionDto) {
		sqlSession.update("updateQuestion", questionDto);
		return questionDto;
	}

}
