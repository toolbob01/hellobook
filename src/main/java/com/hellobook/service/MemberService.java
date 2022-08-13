package com.hellobook.service;

<<<<<<< HEAD
=======

>>>>>>> 4e4741e2340eda88c8105de05910c69936a004cd
import java.util.List;
import java.util.Map;


import com.hellobook.domain.MemberVO;
import com.hellobook.domain.SessionVO;


public interface MemberService {

	public void insertMember(MemberVO mvo);
	public int checkEmail(String Email);
	public int checkNickname(String nickname);
<<<<<<< HEAD
	public void changePwd(MemberVO mvo);
	public SessionVO read(String email);
=======

	public SessionVO read(String email);

	public void changePwd(MemberVO mvo);

>>>>>>> 4e4741e2340eda88c8105de05910c69936a004cd
	public MemberVO readByNickname(String nickname);
	
	
	public List<MemberVO> selectFriends(String email);
}
