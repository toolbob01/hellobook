package com.hellobook.service;

import java.util.List;
import java.util.Map;


import com.hellobook.domain.MemberVO;
import com.hellobook.domain.SessionVO;


public interface MemberService {

	public void insertMember(MemberVO mvo);
	public int checkEmail(String Email);
	public int checkNickname(String nickname);
	public int modify(MemberVO mvo);
	
	public void changePwd(MemberVO mvo);
	public void quitMember(String email); //회원 탈퇴
	public SessionVO read(String email);
	public MemberVO readByNickname(String nickname);

	public List<MemberVO> selectFriends(String email);
	public void updateThumbnailByNickname(MemberVO mvo); //프로필 사진 수정
	
	public List<MemberVO> selectAllMember();
}
