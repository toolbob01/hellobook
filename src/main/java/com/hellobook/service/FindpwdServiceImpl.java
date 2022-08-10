package com.hellobook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hellobook.domain.MemberVO;
import com.hellobook.mapper.FindpwdMapper;

@Service
public class FindpwdServiceImpl implements FindpwdService {

	@Autowired
	private FindpwdMapper findpwdMapper;
	
	@Override
	public int checkEmail(String email) {
		return findpwdMapper.checkEmail(email);
	}
	
	@Override
	public int changePwd(MemberVO mvo) {
		return findpwdMapper.changePwd(mvo);
	}
}
