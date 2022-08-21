package com.hellobook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hellobook.service.ChatService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/chat/*")
public class ChatController {
	
	@GetMapping("chat_list")
	public String chatList() {
		return "/chat/chat_list";
	}
}
