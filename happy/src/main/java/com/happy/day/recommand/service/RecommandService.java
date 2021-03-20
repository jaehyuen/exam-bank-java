package com.happy.day.recommand.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.happy.day.common.dto.ResultDto;
import com.happy.day.recommand.dao.RecommandDao;
import com.happy.day.recommand.dto.RecommandDto;
import com.happy.day.util.Util;

@Service
public class RecommandService {

	@Autowired
	RecommandDao recommandDao;

	Util util = new Util();

	public ResultDto createRecommand(RecommandDto recommandDto) {

		try {

			if (recommandDao.selectRecommand(recommandDto) == null) {
				recommandDao.insertRecommand(recommandDto);
			} else {
				recommandDao.deleteRecommand(recommandDto);
			}

		} catch (Exception e) {

			e.printStackTrace();

			return util.setResult("9999", false, "추천 실패", "");
		}

		return util.setResult("0000", true, "추천 성공", "");

	}

}
