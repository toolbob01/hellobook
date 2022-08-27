package com.hellobook.service;

import java.util.List;

import java.util.Map;

import com.hellobook.domain.ChatVO;
<<<<<<< HEAD
=======

>>>>>>> 38ae114a9203af73883683eb8b6f85f3bbd20d38
import org.apache.ibatis.annotations.Param;

import com.hellobook.domain.MemberVO;
import com.hellobook.domain.SessionVO;


public interface MemberService {

	public void insertMember(MemberVO mvo);
	public int checkEmail(String Email);
	public int checkNickname(String nickname);
	public int modify(MemberVO mvo);
	
//	public void modifyPasswd(@Param("email")String email, @Param("newPasswd")String newPasswd);
	
	
	
	public String pwCheck(String email);
	
	public int pwUpdate(String email, String hashedPw);
	
	
	
	public void quitMember(String email); //회원 탈퇴
	public SessionVO read(String email);
	public MemberVO readByNickname(String nickname);

	public List<MemberVO> selectFriends(String email);
	public void updateThumbnailByNickname(MemberVO mvo); //프로필 사진 수정
	
	public List<MemberVO> selectAllMember();
<<<<<<< HEAD
	
=======

>>>>>>> 38ae114a9203af73883683eb8b6f85f3bbd20d38
	//test용 스크립트 // 나중에 지울 것
	public int[] getRno(String email);
	public Integer getNewMno(int rno);
	public ChatVO getNewChat(String email, int rno, Integer mno);
<<<<<<< HEAD
	
	public void changePwd(MemberVO mvo);
=======

	public void changePwd(MemberVO mvo);

>>>>>>> 38ae114a9203af73883683eb8b6f85f3bbd20d38
}
