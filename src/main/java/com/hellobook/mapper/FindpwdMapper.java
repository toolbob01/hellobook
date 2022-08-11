package com.hellobook.mapper;

import com.hellobook.domain.MemberVO;

public interface FindpwdMapper {

	public int checkEmail(String email);
	public int changePwd(MemberVO mvo);
}
