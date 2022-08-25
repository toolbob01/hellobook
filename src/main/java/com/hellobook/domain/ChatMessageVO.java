package com.hellobook.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ChatMessageVO {


	private String email;
	private int rno;
	private int mno;
	private String content;
	private Date mdate;
	
}
