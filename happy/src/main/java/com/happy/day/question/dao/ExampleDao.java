package com.happy.day.question.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happy.day.question.dto.ExampleDto;
import com.happy.day.question.dto.QuestionDto;
import com.happy.day.question.dto.QuestionListDto;

@Repository
public class ExampleDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public void insertExample(ExampleDto exampleDto) {
		sqlSession.insert("insertExample",exampleDto);
	}
	
	public List<ExampleDto> selectExampleList(int questionSeq) {
		return sqlSession.selectList("selectExampleList", questionSeq);
	}

	
}
