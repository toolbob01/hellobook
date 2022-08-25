package com.hellobook.service;

import java.util.List;

import com.hellobook.domain.ChatMessageVO;
import com.hellobook.domain.ChatVO;

public interface ChatService {
	
	public void createChatRoom(String email, String femail);
	public List<ChatVO> chatRoomList(String email);
	
	public int sendMessage(ChatMessageVO cvo);
	public List<ChatMessageVO> messageList(int rno);
}
