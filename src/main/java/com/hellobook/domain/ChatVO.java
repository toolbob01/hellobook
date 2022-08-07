package com.hellobook.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ChatVO {

	// Participant
	private String email;
	private String nickname;
	
	// Room
	private int rno;
	private Date rdate;
	
	// Message
	private int mno;
	private String content;
	private Date mdate;
	
	// File
	private int fno;
	private String org_name;
	private String uuid;
	
}
