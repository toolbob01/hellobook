package com.hellobook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/friend/*")
public class FriendController {
	
	@GetMapping("find")
	public String findFriend() {
		return "/friend/find_friend";
	}
	
	@GetMapping("match")
	public String matchFriend() {
		return "/friend/match_friend";
	}
	
	@GetMapping("search")
	public String searchFriend() {
		return "/friend/search_friend";
	}
}
