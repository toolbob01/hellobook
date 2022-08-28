package com.hellobook.mapper;

import java.util.List;

import com.hellobook.domain.MemberVO;

public interface FriendMapper {
	
	public List<MemberVO> selectFriendList(MemberVO mvo);
	
	public List<MemberVO>  requestFriendList(MemberVO mvo);
	
	public List<MemberVO>  merequestFriendList(MemberVO mvo);
	
	public List<MemberVO> requestFriend(MemberVO mvo);
	
	public List<MemberVO> requestInsert(MemberVO mvo);
	
	public List<MemberVO> merequestDelete(MemberVO mvo);
	
	public List<MemberVO> requestDelete(MemberVO mvo);
	
	
	public List<MemberVO> findFriendList(MemberVO mvo);
	

}
