package com.hellobook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/chat/*")
public class ChatController {
	
	@GetMapping("chat_list")
	public String chatList() {
		return "/chat/chat_list";
	}
	
	@GetMapping("chat_room")
	public String chatRoom() {
		return "/chat/chat_room";
	}
	
	@GetMapping("chat_create")
	public String chatCreate() {
		return "/chat/chat_create";
	}
}
