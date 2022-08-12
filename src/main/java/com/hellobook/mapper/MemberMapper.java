package com.hellobook.mapper;

import java.util.List;

import com.hellobook.domain.MemberVO;

public interface MemberMapper {
	public void insertMember(MemberVO mvo);
	public void insertAuth(String email);
	
	public MemberVO read(String userid);
	
	public MemberVO readByNickname(String nickname);
	public int checkEmail(String email);
	public int checkNickname(String nickname);
	
	
	public List<MemberVO> selectFriends(String email);
}
