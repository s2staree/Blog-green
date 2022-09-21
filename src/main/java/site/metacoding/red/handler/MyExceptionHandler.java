package site.metacoding.red.handler;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import site.metacoding.red.web.dto.response.CMRespDto;


@ControllerAdvice	// 에러 전담처리 컨트롤러
public class MyExceptionHandler {

	@ExceptionHandler(Exception.class)
	public @ResponseBody CMRespDto<?> apiError(Exception e){
		return new CMRespDto<>(-1, e.getMessage(), null);
	}
}
