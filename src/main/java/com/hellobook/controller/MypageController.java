package com.hellobook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@GetMapping("mypage")
	public String findFriend() {
		return "/mypage/mypage";
	}
	
	@GetMapping("profile")
	public String matchFriend() {
		return "/mypage/profile";
	}
	
	@GetMapping("signout")
	public String searchFriend() {
		return "/mypage/sign_out";
	}
}
