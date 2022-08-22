package com.hellobook.mapper;

import java.util.List;

import com.hellobook.domain.MemberVO;

public interface FriendMapper {
	
	public List<MemberVO> selectFriendList();
	
	public int countFriendList();
	
	
	
	public List<MemberVO> findFriendList(MemberVO mvo);
}
