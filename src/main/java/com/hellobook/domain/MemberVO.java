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
	private String language; 
	private String sex;       
	private String hobby;
	private String intro;
	private String profile;
	private List<AuthVO> authList;
	
	// Friend
	private String insert;
	private int frno;
	private String remail;
	private String femail;
	
	//검색설정
	
	private String userid;
	private String keyword;
	
	private String old_password;
}
