package com.hellobook.mapper;

import java.util.List;

import com.hellobook.domain.MemberVO;
import com.hellobook.domain.SessionVO;

public interface MemberMapper {
	public void insertMember(MemberVO mvo);
	public void insertAuth(String email);
	
<<<<<<< HEAD
	public SessionVO read(String userid);
	
=======
	public MemberVO read(String userid);
>>>>>>> 2cb9d3a8478242b9acd7c37a4660fcae7eb8bd42
	public MemberVO readByNickname(String nickname);
	
	public int checkEmail(String email);
	public int checkNickname(String nickname);

	public void changePwd(MemberVO mvo);
	
	
	public List<MemberVO> selectFriends(String email);
}
