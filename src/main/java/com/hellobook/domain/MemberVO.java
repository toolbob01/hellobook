package com.hellobook.domain;

import java.util.List;

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
<<<<<<< HEAD
	private List<AuthVO> authList;
=======
	
	private String profile;
>>>>>>> 41195442a0d0e6ed93edb2a2ff9bb23e42275278
}
