package com.hellobook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hellobook.domain.MemberVO;
import com.hellobook.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public void insertMember(MemberVO mvo) {
		memberMapper.insertMember(mvo);
		memberMapper.insertAuth(mvo.getEmail());
	}
	
	@Override
	public MemberVO read(String email) {
		MemberVO memberVO = memberMapper.read(email);
		return memberVO;
	}
	
	@Override
	public MemberVO readByNickname(String nickname) {
		MemberVO memberVO = memberMapper.readByNickname(nickname);
		return memberVO;
	}
}
