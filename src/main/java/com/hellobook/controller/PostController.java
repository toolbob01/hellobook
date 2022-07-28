package com.hellobook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post/*")
public class PostController {
	
	@GetMapping("list")
	public String findFriend() {
		return "/post/post_list";
	}
}
