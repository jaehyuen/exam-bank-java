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

		if (category == null) {

			categoryDao.insertCategory(categoryDto);

			return util.setResult("0000", true, "카테고리 생성이 완료되었습니다", "");
		} else {
			return util.setResult("9999", false, "사용중인 카테고리 입니다", "");
		}

	}

	public ResultDto editCategory(CategoryDto categoryDto) {

		try {
			categoryDao.updateCategory(categoryDto);
		} catch (Exception e) {

			e.printStackTrace();

			return util.setResult("9999", false, "카테고리 수정 실패", "");
		}

		return util.setResult("0000", true, "카테고리 수정 성공", "");

	}

	public ResultDto getCategoryListByPage(CategoryDto categoryDto) {

		List<CategoryDto> catgoryList = null;

		try {

			categoryDto.setPage((categoryDto.getPage() - 1) * 7);

			catgoryList = categoryDao.selectCategoryListByPage(categoryDto);

		} catch (Exception e) {

			e.printStackTrace();

			return util.setResult("9999", false, "카테고리 조회 실패", "");
		}

		return util.setResult("0000", true, "카테고리 조회 성공", catgoryList);

	}

	public ResultDto getCategoryListAll(CategoryDto categoryDto) {

		List<CategoryDto> catgoryList = null;

		try {

			catgoryList = categoryDao.selectCategoryList(categoryDto);

		} catch (Exception e) {

			e.printStackTrace();

			return util.setResult("9999", false, "카테고리 조회 실패", "");
		}

		return util.setResult("0000", true, "카테고리 조회 성공", catgoryList);

	}

	public ResultDto getCategory(CategoryDto categoryDto) {

		CategoryDto catgory = null;

		try {

			catgory = categoryDao.selectCategory(categoryDto);

		} catch (Exception e) {

			e.printStackTrace();

			return util.setResult("9999", false, "카테고리 조회 실패", "");
		}

		return util.setResult("0000", true, "카테고리 조회 성공", catgory);

	}

	public int getPages(CategoryDto categoryDto) {

		List<CategoryDto> catgoryList = null;

		try {

			catgoryList = categoryDao.selectCategoryList(categoryDto);

		} catch (Exception e) {

			e.printStackTrace();

			return 1;
		}
		return (int) Math.ceil(catgoryList.size() / (double) 7);

	}

}