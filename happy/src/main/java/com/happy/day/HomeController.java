package com.happy.day;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage() {
		logger.debug("[homePage] start / get");
		return "home";
	}

	@RequestMapping(value = { "/main", "/main/{id}" }, method = RequestMethod.GET)
	public String mainPage(@RequestParam(value = "page", required = false) Integer page, HttpServletRequest request) {

		if (page !=null) {
			request.getSession().setAttribute("page", page);
		}

		logger.debug("[mainPage] start /main get");
		return "main";
	}

}
