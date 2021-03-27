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
import com.happy.day.recommand.dto.RecommandDto;
import com.happy.day.recommand.service.RecommandService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class RecommandController {

	@Autowired
	RecommandService recommandService;

	private static final Logger logger = LoggerFactory.getLogger(RecommandController.class);

	@RequestMapping(value = "/recommand", method = RequestMethod.POST)
	public @ResponseBody ResultDto recommand(@RequestBody RecommandDto recommandDto) {

		logger.debug("[recommand] start /recommand POST");
		logger.debug("[recommand] recommandDto is : " + recommandDto);

		return recommandService.createRecommand(recommandDto);
	}
}
