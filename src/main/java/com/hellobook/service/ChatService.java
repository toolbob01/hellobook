package com.hellobook.service;

import java.util.List;

import com.hellobook.domain.ChatVO;

public interface ChatService {
	
	public void createChatRoom(String email, String femail);
	public List<ChatVO> chatRoomList(String email);
}
