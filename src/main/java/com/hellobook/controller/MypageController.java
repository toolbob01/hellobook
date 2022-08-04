package com.hellobook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@GetMapping("/mypage")
	public String mypage() {
		return "/mypage/mypage";
	}
	
	@GetMapping({"/setting/","/setting/editprofile"})
	public String editprofile() {
		return "/mypage/setting/editprofile";
	}
	
	@GetMapping("/setting/changepwd")
	public String changepwd() {
		return "/mypage/setting/changepwd";
	}
	
	@GetMapping("/setting/quit")
	public String quit() {
		return "/mypage/setting/quit";
	}
	
	@GetMapping("/setting/report")
	public String report() {
		return "/mypage/setting/report";
	}

}
