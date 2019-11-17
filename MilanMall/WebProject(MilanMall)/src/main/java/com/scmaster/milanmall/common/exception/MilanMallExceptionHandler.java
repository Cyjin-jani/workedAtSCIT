package com.scmaster.milanmall.common.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class MilanMallExceptionHandler {
	//controller에서 exception이 발생하면 이쪽으로 온다.
	
	@ExceptionHandler(Exception.class)
	public String errorHandler(Exception e){
		e.printStackTrace();
		
		return "/error";
	}
}
