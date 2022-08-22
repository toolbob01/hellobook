package com.hellobook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hellobook.domain.MemberVO;
import com.hellobook.mapper.FriendMapper;

@Service
public class FriendServiceImpl implements FriendService {
		
		@Autowired
		private FriendMapper friendMapper;

		@Override
		public List<MemberVO> selectFriendList(){
	
			return friendMapper.selectFriendList();
		}

		@Override
		public int countFriendList() {
			
			return friendMapper.countFriendList();
		}
		
	
		@Override
		public List<MemberVO> findFriendList(MemberVO mvo) {
			
			return friendMapper.findFriendList(mvo);
		}
		
		
		
		
}
