package com.hellobook.service;

import com.hellobook.domain.MemberVO;


public interface MemberService {

	public void insertMember(MemberVO mvo);
	public MemberVO read(String email);
	public MemberVO readByNickname(String nickname);
}
