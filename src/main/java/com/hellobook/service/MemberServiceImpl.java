package com.hellobook.service;

import java.util.List;

import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hellobook.domain.MemberVO;
import com.hellobook.domain.SessionVO;
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
	public int checkEmail(String email) {
		return memberMapper.checkEmail(email);
	}
	
	@Override
	public int checkNickname(String nickname) {
		return memberMapper.checkNickname(nickname);
	}
	
	@Override
<<<<<<< HEAD
	public SessionVO read(String email) {
		SessionVO svo = memberMapper.read(email);
		return svo;
=======

	public SessionVO read(String email) {
		SessionVO svo = memberMapper.read(email);
		return svo;
	}
>>>>>>> 4e4741e2340eda88c8105de05910c69936a004cd
	public void changePwd(MemberVO mvo) {
		memberMapper.changePwd(mvo);
	}
	
	@Override
	public MemberVO readByNickname(String nickname) {
		MemberVO memberVO = memberMapper.readByNickname(nickname);
		return memberVO;
	}



	@Override
	public List<MemberVO> selectFriends(String email){
		return memberMapper.selectFriends(email);
	}
}
