package com.hellobook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post/*")
public class PostController {
	
	@GetMapping("post_list")
	public String postList() {
		return "/post/post_list";
	}
	
	@GetMapping("post_write")
	public String postWrite() {
		return "/post/post_write";
	}
	
	@GetMapping("post_update")
	public String postUpdate() {
		return "/post/post_update";
	}
}
