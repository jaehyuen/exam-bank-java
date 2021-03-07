package com.happy.day.question.dto;

import lombok.Data;

@Data
public class QuestionListDto {

	private int questionSeq;
	private String questionTitle;
	private String authorName;
	private int categoryAuthorSeq;
	
}
