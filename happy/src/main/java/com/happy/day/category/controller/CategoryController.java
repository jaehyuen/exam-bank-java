package com.happy.day.category.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.happy.day.category.dto.CategoryDto;
import com.happy.day.category.service.CategoryService;
import com.happy.day.common.dto.ResultDto;
import com.happy.day.question.dto.QuestionInfoDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CategoryController {

	@Autowired
	CategoryService categoryService;

	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);

	@RequestMapping(value = "/category/create", method = RequestMethod.GET)
	public String createCategoryPage() {

		logger.debug("[createCategoryPage] start /category/create get");
		
		return "category/createCategory";
	}
	
	@RequestMapping(value = "/category/edit/{id}", method = RequestMethod.GET)
	public String editCategoryPage() {

		logger.debug("[editCategoryPage] start /category/edit/{id} get");
		
		return "category/editCategory";
	}
	
	@RequestMapping(value = "/category/listPage", method = RequestMethod.GET)
	public @ResponseBody ResultDto getCategoryListByPage(CategoryDto categoryDto ) {
		
		
		logger.debug("[getCategoryList] start /category/listPage get");
		logger.debug("[getCategoryList] categoryDto is : " + categoryDto);
		
		return categoryService.getCategoryListByPage(categoryDto);
	}
	
	@RequestMapping(value = "/category/listAll", method = RequestMethod.GET)
	public @ResponseBody ResultDto getCategoryListAll(CategoryDto categoryDto ) {
		
		
		logger.debug("[getCategoryList] start /category/listAll get");
		logger.debug("[getCategoryList] categoryDto is : " + categoryDto);
		
		return categoryService.getCategoryListAll(categoryDto);
	}

	
	@RequestMapping(value = "/category/info", method = RequestMethod.GET)
	public @ResponseBody ResultDto getCategory(CategoryDto categoryDto ) {
		
		
		logger.debug("[getCategory] start /category/info get");
		logger.debug("[getCategory] categoryDto is : " + categoryDto);
		
		return categoryService.getCategory(categoryDto);
	}


	@RequestMapping(value = "/category/create", method = RequestMethod.POST)
	public @ResponseBody ResultDto createCategory(@ModelAttribute CategoryDto categoryDto) {
		
		logger.debug("[createCategory] start /category/create post");
		logger.debug("[createCategory] categoryDto is : " + categoryDto);
		
		return categoryService.createCategory(categoryDto);
	}

	@RequestMapping(value = "/category/edit", method = RequestMethod.POST)
	public @ResponseBody ResultDto editCategory(@RequestBody CategoryDto categoryDto) {
		
		logger.debug("[editCategory] start /category/edit post");
		logger.debug("[editCategory] categoryDto is : " + categoryDto);
		
		return categoryService.editCategory(categoryDto);
	}
}
