package com.happy.day.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happy.day.common.dto.ResultDto;
import com.happy.day.question.dao.QuestionDao;
import com.happy.day.question.dto.CreateQuestionDto;
import com.happy.day.question.dto.QuestionDto;
import com.happy.day.util.Util;

@Service
public class QuestionService {

	@Autowired
	QuestionDao questionDao;

	Util util = new Util();

	public ResultDto getQuestionList(QuestionDto questionDto) {

		List<QuestionDto> questionList = null;
		try {

			questionList = questionDao.getQuestionList(questionDto);

		} catch (Exception e) {

			e.printStackTrace();

			return util.setResult("9999", false, "문제 조회 실패", "");
		}

		return util.setResult("0000", true, "문제 조회 성공", questionList);

	}

	
	public ResultDto createQuestion(CreateQuestionDto createQuestionDto) {

		try {

			//questionList = questionDao.getQuestionList(questionDto);

		} catch (Exception e) {

			e.printStackTrace();

			return util.setResult("9999", false, "문제 생성 실패", "");
		}

		return util.setResult("0000", true, "문제 생성 성공", "");

	}
}
