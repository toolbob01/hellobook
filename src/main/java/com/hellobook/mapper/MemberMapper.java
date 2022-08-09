package com.hellobook.mapper;

import com.hellobook.domain.MemberVO;

public interface MemberMapper {
	public void insertMember(MemberVO mvo);
	public void insertAuth(String email);
	public MemberVO read(String userid);
}
