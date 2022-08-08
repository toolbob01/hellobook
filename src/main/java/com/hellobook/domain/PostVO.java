package com.hellobook.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PostVO {

	// Writer
	private String email;
	private String nickname;
	
	// Post
	private int pno;
	private String content;
	private Date pdate;
	
	private int like_cnt;
	private int reply_cnt;
	
	// Reply
	private int repno;
	private String rcontent;
	private char depth; // '1': 댓글 '2': 대댓글

	// File
	private int fno;
	private String uuid;
	
}
