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
public class PostVO {

	// Member
	private String email;
	private String nickname;
	private String profile;
	private String language;
	
	// Post
	private int pno;
	private String content;
	private Date pdate;
	private String timer;
	
	// Reply
	private List<PostReplyVO> reply_list;
	private int reply_cnt;
	
	// File
	private List<PostFileVO> file_list;
	
	// Like
	private List<PostLikeVO> like_list;
	private int like_cnt;
	
}
