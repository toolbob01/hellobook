package com.hellobook.domain;

import java.sql.Date;
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
	private String intro;
	private List<AuthVO> authList;
}
