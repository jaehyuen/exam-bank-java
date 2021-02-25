package com.happy.day.util;

import com.happy.day.common.dto.ResultDto;

public class Util {

	public ResultDto setResult(String code, boolean flag, String message, Object data) {

		ResultDto resultDto = new ResultDto();

		resultDto.setResultCode(code);
		resultDto.setResultFlag(flag);
		resultDto.setResultMessage(message);
		resultDto.setResultData(data);

		return resultDto;

	}
	
}
