package com.hellobook.service;

import com.hellobook.domain.MemberVO;

public interface FindpwdService {

	public int checkEmail(String email);
	public int changePwd(MemberVO mvo);
}
