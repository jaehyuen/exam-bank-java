package com.happy.day.question.dto;

import java.util.List;

import lombok.Data;

@Data
public class QuestionInfoDto {

	private QuestionDto question;
	private List<ExampleDto> exampleList;
	
	
}
