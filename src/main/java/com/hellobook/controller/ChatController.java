package com.hellobook.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hellobook.domain.ChatMessageVO;
import com.hellobook.domain.ChatVO;
import com.hellobook.domain.MemberVO;
import com.hellobook.service.ChatService;
import com.hellobook.service.MemberService;
import com.hellobook.utility.Message;

@Controller
@RequestMapping("/chat/*")
public class ChatController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ChatService chatService;
	
	@GetMapping("chat_list")
	public String chatList(String email, Model model) {
		List<MemberVO> mvoList = memberService.selectAllMember();
		List<ChatVO> cvoList = chatService.chatRoomList(email);
		

		
		model.addAttribute("mvoList", mvoList);
		model.addAttribute("cvoList", cvoList);
		
		return "/chat/chat_list";
	}
	
	@PostMapping("createChatRoom")
	public ModelAndView createChatRoom(@Param("email") String email, @Param("femail") String femail, ModelAndView mav) {
		Integer existChatRoom = chatService.existChatRoom(email, femail);
		if(existChatRoom != null) {
			mav.addObject("data", new Message("existChatRoomTrue", "/chat/chat_list?email="+email));
			mav.setViewName("Message");
		}else {
			chatService.createChatRoom(email, femail);
			mav.addObject("data", new Message("existChatRoomFalse", "/chat/chat_list?email="+email));
			mav.setViewName("Message");
		}
		return mav;
	}
	
	@PostMapping("sendMessage")
	public @ResponseBody int sendMessage(@RequestBody ChatMessageVO cvo) {
		System.out.println(cvo);

		int result = chatService.sendMessage(cvo);
		
		return result;
		
	}
	
	@GetMapping("messageList")
	public @ResponseBody List<ChatMessageVO> messageList(int rno) {
		List<ChatMessageVO> chatMessageVO = chatService.messageList(rno);
		System.out.println(chatMessageVO);
		return chatMessageVO==null?null:chatMessageVO;
	}
}
