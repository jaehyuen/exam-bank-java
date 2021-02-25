package com.happy.day.category.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happy.day.category.dao.CategoryDao;
import com.happy.day.category.dto.CategoryDto;
import com.happy.day.common.dto.ResultDto;
import com.happy.day.user.dto.UserDto;
import com.happy.day.util.Util;

@Service
public class CategoryService {

	@Autowired
	CategoryDao categoryDao;

	Util util = new Util();

	public ResultDto createCategory(CategoryDto categoryDto) {

		CategoryDto category = categoryDao.selectCategoryDup(categoryDto);
		System.out.println(category);

		if (category == null) {

			categoryDao.insertCategory(categoryDto);

			return util.setResult("0000", true, "카테고리 생성이 완료되었습니다", "");
		} else {
			return util.setResult("9999", false, "사용중인 카테고리 입니다", "");
		}

	}

}
