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
	public List<MemberVO> selectRecommendFriends(String email) {
		return memberMapper.friendRecommend(email);
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

	@Override
	public String pwCheck(String email) {
		
		return memberMapper.pwCheck(email);
	}
	
	@Override
	public int pwUpdate(String email, String hashedPw) {
		
		return memberMapper.pwUpdate(email, hashedPw);
	}
}
