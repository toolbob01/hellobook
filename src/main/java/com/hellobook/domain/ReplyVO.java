package com.hellobook.domain;

import java.util.Date;
import java.util.List;

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
	private int refno;
	private int pno;
	private String rcontent;
	private String depth;   // '1': 댓글 '2': 대댓글
	private Date repdate;
	private String timer;
	
	// List by refno
	private List<ReplyVO> cocomment_list;
}
