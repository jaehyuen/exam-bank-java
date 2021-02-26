package com.happy.day;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.happy.day.category.dto.CategoryDto;
import com.happy.day.category.service.CategoryService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	CategoryService categoryService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage() {
		logger.debug("[homePage] start / get");
		return "home";
	}

	@RequestMapping(value = { "/main", "/main/{id}" }, method = RequestMethod.GET)
	public String mainPage(@RequestParam(value = "page", required = false) Integer currentPage,
			HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();

		if (currentPage == null) {
			currentPage = 1;
		}

		CategoryDto categoryDto = new CategoryDto();

		Integer userSeq = (Integer) session.getAttribute("userSeq");

		if (userSeq != null) {
			categoryDto.setAuthorSeq(userSeq);
		}
		

		session.setAttribute("currentPage", currentPage);
		session.setAttribute("pageNum", categoryService.getPages(categoryDto));

		logger.debug("[mainPage] start /main get");
		return "main";
	}

}
