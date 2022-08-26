package com.hellobook.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ChatRoomVO {

	// Participant
	private String email; //내 이메일
	private String femail; //상대방 이메일
	
	//member
	private String nickname;
	private String profile;

	
	// Room
	private Integer rno;
	private Date rdate;
	
	// Message
	private Integer mno;
	private String content;
	private Date mdate;
	
	// File
	private int fno;
	private String org_name;
	private String uuid;
	
}
