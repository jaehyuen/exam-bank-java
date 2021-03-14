package com.happy.day.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happy.day.common.dto.ResultDto;
import com.happy.day.question.dao.ExampleDao;
import com.happy.day.question.dao.QuestionDao;
import com.happy.day.question.dto.ExampleDto;
import com.happy.day.question.dto.QuestionDto;
import com.happy.day.question.dto.QuestionInfoDto;
import com.happy.day.question.dto.QuestionListDto;
import com.happy.day.util.Util;

@Service
public class QuestionService {

	@Autowired
	QuestionDao questionDao;

	@Autowired
	ExampleDao exampleDao;

	Util util = new Util();

	public ResultDto getQuestionList(QuestionDto questionDto) {

		List<QuestionListDto> questionList = null;
		try {

			questionList = questionDao.selectQuestionList(questionDto);

		} catch (Exception e) {

			e.printStackTrace();

			return util.setResult("9999", false, "문제 조회 실패", "");
		}

		return util.setResult("0000", true, "문제 조회 성공", questionList);

	}

	public ResultDto getQuestionInfo(QuestionDto questionDto) {

		QuestionInfoDto questionInfo = new QuestionInfoDto();
		try {

			QuestionDto question = questionDao.selectQuestion(questionDto);
			List<ExampleDto> exampleList = null;

			System.out.println(question);
			if (question.isQuestionType()) {
				exampleList = exampleDao.selectExampleList(question.getQuestionSeq());

			}

			questionInfo.setQuestion(question);
			questionInfo.setExampleList(exampleList);

		} catch (Exception e) {

			e.printStackTrace();

			return util.setResult("9999", false, "문제 조회 실패", "");
		}

		return util.setResult("0000", true, "문제 조회 성공", questionInfo);

	}

	public ResultDto createQuestion(QuestionInfoDto questionInfoDto) {

		try {

			int questionSeq = questionDao.insertQuestion(questionInfoDto.getQuestion());

			for (ExampleDto exampleDto : questionInfoDto.getExampleList()) {
				exampleDto.setQuestionSeq(questionSeq);
				exampleDao.insertExample(exampleDto);
			}

		} catch (Exception e) {

			e.printStackTrace();

			return util.setResult("9999", false, "문제 생성 실패", "");
		}

		return util.setResult("0000", true, "문제 생성 성공", "");

	}

	public ResultDto editQuestion(QuestionInfoDto questionInfoDto) {

		try {

			QuestionDto preQuestionDto = questionDao.selectQuestion(questionInfoDto.getQuestion());
			QuestionDto postQuestionDto = questionDao.updateQuestion(questionInfoDto.getQuestion());

			if (preQuestionDto.isQuestionType() != postQuestionDto.isQuestionType()) {

				if (postQuestionDto.isQuestionType() == false) {

					exampleDao.deleteExample(postQuestionDto.getQuestionSeq());

				} else {
					
					for (ExampleDto exampleDto : questionInfoDto.getExampleList()) {
						exampleDto.setQuestionSeq(postQuestionDto.getQuestionSeq());
						exampleDao.insertExample(exampleDto);
					}
				}

			} else {

				for (ExampleDto exampleDto : questionInfoDto.getExampleList()) {
					exampleDao.updateExample(exampleDto);
				}
			}

		} catch (Exception e) {

			e.printStackTrace();

			return util.setResult("9999", false, "문제 수정 실패", "");
		}

		return util.setResult("0000", true, "문제 수정 성공", "");

	}
}
