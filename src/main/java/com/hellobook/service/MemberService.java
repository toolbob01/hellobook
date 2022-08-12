package com.hellobook.service;

import java.util.Map;

import com.hellobook.domain.MemberVO;


public interface MemberService {

	public void insertMember(MemberVO mvo);
	public int checkEmail(String Email);
	public int checkNickname(String nickname);
	public MemberVO read(String email);
	public MemberVO readByNickname(String nickname);
}
