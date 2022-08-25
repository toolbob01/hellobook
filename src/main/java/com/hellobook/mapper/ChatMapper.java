package com.hellobook.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hellobook.domain.ChatMessageVO;
import com.hellobook.domain.ChatVO;

public interface ChatMapper {
	
	public void createChatRoom(@Param("email") String email, @Param("femail")String femail);
	
	public List<ChatVO> chatRoomList(String email);
	
	public int sendMessage(ChatMessageVO cvo);
	
	public List<ChatMessageVO> messageList(int rno);
}

