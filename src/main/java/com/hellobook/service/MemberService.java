package com.hellobook.service;

import com.hellobook.domain.MemberVO;
import com.hellobook.domain.SessionVO;


public interface MemberService {

	public void insertMember(MemberVO mvo);
	public int checkEmail(String Email);
	public int checkNickname(String nickname);
	public SessionVO read(String email);
	public MemberVO readByNickname(String nickname);
}
