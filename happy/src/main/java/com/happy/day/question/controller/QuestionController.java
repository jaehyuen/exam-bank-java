package com.happy.day.question.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.happy.day.common.dto.ResultDto;
import com.happy.day.question.dto.QuestionDto;
import com.happy.day.question.dto.QuestionInfoDto;
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
	public String createQuestionPage() {

		logger.debug("[creatQuestionPage] start /question/create/{id} get");

		return "question/createQuestion";
	}
	
//	@RequestMapping(value = "/question/edit/{id}", method = RequestMethod.GET)
//	public String editQuestionPage() {
//
//		logger.debug("[editQuestionPage] start /question/edit/{id} get");
//
//		return "question/editQuestion";
//	}
	
	@RequestMapping(value = "/question/{id}", method = RequestMethod.GET)
	public String questionPage() {

		logger.debug("[questionPage] start /question/{id} get");

		return "question/questionDetail";
	}

	@RequestMapping(value = "/question/create", method = RequestMethod.POST)
	public @ResponseBody ResultDto creatQuestion(@RequestBody QuestionInfoDto questionInfoDto) {

		logger.debug("[creatQuestion] start /question/create post");
		logger.debug("[creatQuestion] createQuestionDto is : " + questionInfoDto);

		return questionService.createQuestion(questionInfoDto);
	}

	@RequestMapping(value = "/question/list", method = RequestMethod.GET)
	public @ResponseBody ResultDto getQuestionList(QuestionDto questionDto) {

		logger.debug("[getQuestionList] start /question/list GET");
		logger.debug("[getQuestionList] questionDto is : " + questionDto);
			
		return questionService.getQuestionList(questionDto);
	}
	
	@RequestMapping(value = "/question/info", method = RequestMethod.GET)
	public @ResponseBody ResultDto getQuestionInfo(QuestionDto questionDto) {

		logger.info("[getQuestionInfo] start /question/info GET");
		logger.info("[getQuestionInfo] questionDto is : " + questionDto);
			
		return questionService.getQuestionInfo(questionDto);
	}

}
