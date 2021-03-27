package com.happy.day.question.dto;

import lombok.Data;

@Data
public class QuestionDto {

	private int questionSeq;
	private String questionTitle;
	private boolean questionType;
	private String questionAnswer;
	private int authorSeq;
	private int categorySeq;
	private int userSeq; //현재는 테스트 용도
	
}
