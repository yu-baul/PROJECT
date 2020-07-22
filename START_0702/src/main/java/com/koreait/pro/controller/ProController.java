package com.koreait.pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProController {
	
	
	
	// 시작 페이지
	@RequestMapping("/")
	public String goIndex() {
		return "index";
	}
	
	// 기능 실행 후 시작 페이지 가기
	@RequestMapping("home")
	public String goHome() {
		return "index";
	}
	
	
	
	
	
}
	
	
	
	
	
	
	
		
	
	
	
