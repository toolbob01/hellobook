package com.hellobook.domain;

import lombok.Data;

@Data
public class ChatMessageVO {


	private String email;
	private Integer rno;
	private Integer mno;
	private String content;
	private String mdate;
	
}
