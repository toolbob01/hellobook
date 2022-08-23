package com.hellobook.service;

import java.util.List;

import com.hellobook.domain.MemberVO;

public interface FriendService {
		
	 public List<MemberVO> selectFriendList();
	 
	 public int countFriendList();
	 
	 
	 
	 public List<MemberVO> findFriendList(MemberVO mvo);
}
