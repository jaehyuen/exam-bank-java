package com.happy.day.category.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.happy.day.category.dto.CategoryDto;
import com.happy.day.category.service.CategoryService;
import com.happy.day.common.dto.ResultDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CategoryController {

	@Autowired
	CategoryService categoryService;

	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);

	@RequestMapping(value = "/category/create", method = RequestMethod.GET)
	public String createPage() {

		return "category/create";
	}

	@RequestMapping(value = "/category/create", method = RequestMethod.POST)
	public @ResponseBody ResultDto createCategory(@ModelAttribute CategoryDto categoryDto) {

		logger.info("[createCategory post] categoryDto is : " + categoryDto);
		return categoryService.createCategory(categoryDto);
	}

}
