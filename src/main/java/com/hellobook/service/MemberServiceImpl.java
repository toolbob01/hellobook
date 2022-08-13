package com.hellobook.service;

<<<<<<< HEAD
=======
import java.util.List;

import java.util.Map;

>>>>>>> 2cb9d3a8478242b9acd7c37a4660fcae7eb8bd42
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
	public SessionVO read(String email) {
		SessionVO svo = memberMapper.read(email);
		return svo;
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
