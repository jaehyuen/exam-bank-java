package com.happy.day.recommand.controller;

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
public class RecommandController {

	@Autowired
	QuestionService questionService;

	private static final Logger logger = LoggerFactory.getLogger(RecommandController.class);

	@RequestMapping(value = "/question/edit", method = RequestMethod.POST)
	public @ResponseBody ResultDto editQuestion(@RequestBody QuestionInfoDto questionInfoDto) {

		logger.debug("[getQuestionInfo] start /question/edit POST");
		logger.debug("[getQuestionInfo] editQuestion is : " + questionInfoDto);

		return questionService.editQuestion(questionInfoDto);
	}
}
