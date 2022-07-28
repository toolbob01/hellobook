package com.hellobook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat/*")
public class ChatController {
	
	@GetMapping("list")
	public String chatList() {
		return "/chat/chat_list";
	}
	
	@GetMapping("room")
	public String chatRoom() {
		return "/chat/chat_room";
	}
}
