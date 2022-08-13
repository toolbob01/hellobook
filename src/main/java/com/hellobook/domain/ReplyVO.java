package com.hellobook.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReplyVO {

	// Member
	private String email;
	private String nickname;
	private String profile;
	private String language;
	
	// Reply
	private int repno;
	private int pno;
	private String rcontent;
	private char depth;   // '1': 댓글 '2': 대댓글

	
}
