package com.hellobook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@GetMapping("mypage")
	public String mypage() {
		return "/mypage/mypage";
	}
	
	@GetMapping("donate")
	public String donate() {
		return "/mypage/donate";
	}
	
	@GetMapping("quit")
	public String quit() {
		return "/mypage/quit";
	}

	@GetMapping("setting")
	public String like() {
		return "/mypage/setting";
	}
}
