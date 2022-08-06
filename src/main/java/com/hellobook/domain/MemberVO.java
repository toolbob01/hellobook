package com.hellobook.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	private String email;
	private String nickname;
	private String password;
	private char language;
	private String birth;
	private char sex;
	private String hobby;
}
