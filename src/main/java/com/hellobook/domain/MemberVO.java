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
	private int frno;
	private String femail;
	
	//검색설정
	
	private String keyword;
}
