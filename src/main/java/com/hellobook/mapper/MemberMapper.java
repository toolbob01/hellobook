package com.hellobook.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hellobook.domain.MemberVO;
import com.hellobook.domain.SessionVO;

public interface MemberMapper {
	public void insertMember(MemberVO mvo);
	public void insertAuth(String email);

	public SessionVO read(String userid); //for security(session)
	public MemberVO readByNickname(String nickname);
	
	public int checkEmail(String email);
	public int checkNickname(String nickname);

//	public void modifyPasswd(@Param("email")String email, @Param("newPasswd")String newPasswd);
	public String pwCheck(String email);
	public int pwUpdate(@Param("email") String email, @Param("password") String password);
	
	public void quitMember(String email); //회원 탈퇴
	public int modify(MemberVO mvo); 
	
	public List<MemberVO> selectFriends(String email);
	
	public List<MemberVO> friendRecommend();
	
	public void updateThumbnailByNickname(MemberVO mvo); //프로필 사진 수정
	
	public List<MemberVO> selectAllMember();
	
}
