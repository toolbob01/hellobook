package com.hellobook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/friend/*")
public class FriendController {
	
	@GetMapping("list")
	public String findFriend() {
		return "/friend/list";
	}
	
	@GetMapping("match")
	public String matchFriend() {
		return "/friend/match";
	}
	
	@GetMapping("search")
	public String searchFriend() {
		return "/friend/search";
	}
}
