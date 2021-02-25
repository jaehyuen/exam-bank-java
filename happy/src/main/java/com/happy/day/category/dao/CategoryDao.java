package com.happy.day.category.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happy.day.category.dto.CategoryDto;
import com.happy.day.user.dto.UserDto;

@Repository
public class CategoryDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<CategoryDto> selectCategory(CategoryDto categoryDto) {
		return sqlSession.selectList("selectCategory", categoryDto);
	}
	
	public CategoryDto selectCategoryDup(CategoryDto categoryDto) {
		return sqlSession.selectOne("selectCategoryDup", categoryDto);
	}
	
	public void insertCategory (CategoryDto categoryDto) {
		sqlSession.insert("insertCategory",categoryDto);
	}
	
}
