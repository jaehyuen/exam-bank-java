package com.happy.day.category.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

		logger.debug("[createPage] start /category/create get");
		
		return "category/create";
	}
	
	@RequestMapping(value = "/category/list", method = RequestMethod.GET)
	public @ResponseBody ResultDto getCategoryList(CategoryDto categoryDto) {
		
		
		logger.debug("[getCategoryList] start /category/list get");
		
		return categoryService.getCategoryList(categoryDto);
	}
	
	@RequestMapping(value = "/category/pages", method = RequestMethod.GET)
	public @ResponseBody ResultDto getPages(CategoryDto categoryDto) {

		logger.debug("[getCategoryList] start /category/pages get");
		
		return categoryService.getPages(categoryDto);
	}


	@RequestMapping(value = "/category/create", method = RequestMethod.POST)
	public @ResponseBody ResultDto createCategory(@ModelAttribute CategoryDto categoryDto) {
		
		logger.debug("[createCategory] start /category/create post");
		logger.debug("[createCategory] categoryDto is : " + categoryDto);
		
		return categoryService.createCategory(categoryDto);
	}

}
