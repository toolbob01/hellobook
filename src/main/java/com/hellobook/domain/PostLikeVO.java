package com.hellobook.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PostLikeVO {

	// Member
	private String email;
	private String nickname;
	private String profile;
	private String language;
	
	// Like
	private int pno;
	private String friendYN;
	
}
