package com.hellobook.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	private String email;
	private String nickname;
	private String password;
	
	private String intro;
	private Date birth;
	
	private char language;  // 'k' 'j'
	private char sex;       // 'm' 'f'
	private String hobby;
	
	private String profile;
}
