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
		public List<MemberVO> selectFriendList(MemberVO mvo) {
			// TODO Auto-generated method stub
			return friendMapper.selectFriendList(mvo);
		}








		@Override
		public List<MemberVO> requestFriendList(MemberVO mvo) {
			// TODO Auto-generated method stub
			return friendMapper.requestFriendList(mvo);
		}


		





		@Override
		public List<MemberVO> merequestFriendList(MemberVO mvo) {
			// TODO Auto-generated method stub
			return friendMapper.merequestFriendList(mvo);
		}








		@Override
		public List<MemberVO> requestFriend(MemberVO mvo) {
			// TODO Auto-generated method stub
			return friendMapper.requestFriend(mvo);
		}


		


		@Override
		public void requestInsert(MemberVO mvo) {

			friendMapper.requestInsert(mvo);
		}



		
		



		@Override
		public void requestInsert_reverse(MemberVO mvo) {

			friendMapper.requestInsert_reverse(mvo);
		}








		@Override
		public List<MemberVO> merequestDelete(MemberVO mvo) {
			// TODO Auto-generated method stub
			return friendMapper.merequestDelete(mvo);
		}








		@Override
		public List<MemberVO> requestDelete(MemberVO mvo) {
			// TODO Auto-generated method stub
			return friendMapper.requestDelete(mvo);
		}








		@Override
		public List<MemberVO> findFriendList(MemberVO mvo) {
			
			return friendMapper.findFriendList(mvo);
		}

		
		@Override
		public int countFriend(String email) {
		// TODO Auto-generated method stub
		return friendMapper.countFriend(email);
		}
		
}
