package com.hellobook.mapper;

import java.util.List;

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
	public void quitMember(MemberVO mvo); //회원 탈퇴
	public int modify(MemberVO mvo); 
	
	public List<MemberVO> selectFriends(String email);
	
	public List<MemberVO> friendRecommend();
	
	public void updateThumbnailByNickname(MemberVO mvo); //프로필 사진 수정
	
	
	
}
