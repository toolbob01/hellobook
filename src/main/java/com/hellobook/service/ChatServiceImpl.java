package com.hellobook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hellobook.domain.ChatMessageVO;
import com.hellobook.domain.ChatVO;
import com.hellobook.mapper.ChatMapper;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatMapper chatMapper;
	
	@Override
	public void createChatRoom(String email, String femail) {
		chatMapper.createChatRoom(email, femail);
	}
	
	@Override
	public List<ChatVO> chatRoomList(String email) {
		
		return chatMapper.chatRoomList(email);
	}
	
	@Override
	public int sendMessage(ChatMessageVO cvo) {
		return chatMapper.sendMessage(cvo);

		
	}
	
	@Override
	public List<ChatMessageVO> messageList(int rno) {
		
		return chatMapper.messageList(rno);
	}
	
	@Override
	public Integer existChatRoom(String email, String femail) {
		
		return chatMapper.existChatRoom(email, femail);
	}
	

}

