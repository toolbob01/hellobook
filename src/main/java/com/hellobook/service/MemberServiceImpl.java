package com.hellobook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hellobook.domain.ChatVO;
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
	
	public SessionVO read(String email) {
		SessionVO svo = memberMapper.read(email);
		return svo;
	}
	
	
	
	
	@Override
	public void changePwd(MemberVO mvo) {
		// TODO Auto-generated method stub
		
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
	
	@Override
	public void updateThumbnailByNickname(MemberVO mvo) {
		memberMapper.updateThumbnailByNickname(mvo);
	}
	
	@Override
	public void quitMember(String email) {
		memberMapper.quitMember(email);		
		
	}
	
	@Override
	public int modify(MemberVO mvo) {
	
		 return memberMapper.modify(mvo);
		 
	}
	
	@Override
	public List<MemberVO> selectAllMember() {
	
		return memberMapper.selectAllMember();
	}
<<<<<<< HEAD
	
=======

>>>>>>> 38ae114a9203af73883683eb8b6f85f3bbd20d38
	//나중에 지울 것
	@Override
	public int[] getRno(String email) {
		return memberMapper.getRno(email);
	}
	@Override
	public Integer getNewMno(int rno) {
		return memberMapper.getNewMno(rno);
	}
	@Override
	public ChatVO getNewChat(String email, int rno, Integer mno) {
		System.out.println(email);
		System.out.println(rno);
		System.out.println(mno);
		return memberMapper.getNewChat(email, rno, mno);
	}
<<<<<<< HEAD
=======

>>>>>>> 38ae114a9203af73883683eb8b6f85f3bbd20d38
	@Override
	public String pwCheck(String email) {
		
		return memberMapper.pwCheck(email);
	}
	
	@Override
	public int pwUpdate(String email, String hashedPw) {
		
		return memberMapper.pwUpdate(email, hashedPw);
	}
<<<<<<< HEAD
=======

>>>>>>> 38ae114a9203af73883683eb8b6f85f3bbd20d38
}
