package com.hellobook.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hellobook.domain.ChatVO;
import com.hellobook.domain.MemberVO;
import com.hellobook.domain.SessionVO;

public interface MemberMapper {
	public void insertMember(MemberVO mvo);
	public void insertAuth(String email);

	public SessionVO read(String userid); //for security(session)
	public MemberVO readByNickname(String nickname);
	
	public int checkEmail(String email);
	public int checkNickname(String nickname);

	public void changePwd(MemberVO mvo);
	public void quitMember(String email); //회원 탈퇴
	public int modify(MemberVO mvo); 
	
	public List<MemberVO> selectFriends(String email);
	
	public List<MemberVO> friendRecommend();
	
	public void updateThumbnailByNickname(MemberVO mvo); //프로필 사진 수정
	
	public List<MemberVO> selectAllMember();
	
	
	//나중에 지울 것
	//1. 내가 참여중인 채팅의 rno들을 가져온다
	public int[] getRno(String email);
	//2. rno를 토대로 가장 최신 채팅 번호를 가져온다. (반복)
	public Integer getNewMno(int rno);
	//3. mno를 토대로 채팅 내용과 및 프로필 등을 가져온다.
	public ChatVO getNewChat(@Param("email")String email,@Param("rno")int rno,@Param("mno")Integer mno);
	
}
