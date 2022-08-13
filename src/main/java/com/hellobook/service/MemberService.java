package com.hellobook.service;

import java.util.List;
import java.util.Map;

>>>>>>> 2cb9d3a8478242b9acd7c37a4660fcae7eb8bd42
import com.hellobook.domain.MemberVO;
import com.hellobook.domain.SessionVO;


public interface MemberService {

	public void insertMember(MemberVO mvo);
	public int checkEmail(String Email);
	public int checkNickname(String nickname);
	public void changePwd(MemberVO mvo);
	public SessionVO read(String email);
	public MemberVO readByNickname(String nickname);
	
	
	public List<MemberVO> selectFriends(String email);
}
