package com.hellobook.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private String email;
	private String nickname;
	private String password;
	private Date birth;
	private char language; 
	private char sex;       
	private String hobby;

	private List<AuthVO> authList;
}
