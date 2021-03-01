package com.happy.day.question.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.happy.day.common.dto.ResultDto;
import com.happy.day.question.dto.CreateQuestionDto;
import com.happy.day.question.dto.QuestionDto;
import com.happy.day.question.service.QuestionService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class QuestionController {

	@Autowired
	QuestionService questionService;

	private static final Logger logger = LoggerFactory.getLogger(QuestionController.class);

	@RequestMapping(value = "/question/create/{id}", method = RequestMethod.GET)
	public String creatQuestionPage() {

		logger.debug("[creatQuestionPage] start /question/create/{id} get");

		return "question/create";
	}

	@RequestMapping(value = "/question/create", method = RequestMethod.POST)
	public @ResponseBody ResultDto creatQuestion(CreateQuestionDto createQuestionDto) {

		logger.debug("[creatQuestion] start /question/create post");
		logger.debug("[getQuestionList] createQuestionDto is : " + createQuestionDto);

		return questionService.getQuestionList(new QuestionDto());
	}

	@RequestMapping(value = "/question/list", method = RequestMethod.POST)
	public @ResponseBody ResultDto getQuestionList(QuestionDto questionDto) {

		logger.debug("[getQuestionList] start /question/list POST");
		logger.debug("[getQuestionList] questionDto is : " + questionDto);

		return questionService.getQuestionList(questionDto);
	}

}
