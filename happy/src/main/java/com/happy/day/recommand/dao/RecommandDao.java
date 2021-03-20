package com.happy.day.recommand.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.happy.day.recommand.dto.RecommandDto;

@Repository
public class RecommandDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public void insertRecommand(RecommandDto recommandDto) {
		sqlSession.insert("insertRecommand", recommandDto);
	}

	public RecommandDto selectRecommand(RecommandDto recommandDto) {
		return sqlSession.selectOne("selectRecommand", recommandDto);
	}

	public void deleteRecommand(RecommandDto recommandDto) {
		sqlSession.delete("deleteRecommand", recommandDto);
	}

}
