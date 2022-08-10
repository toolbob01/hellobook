package com.hellobook.service;

import java.util.List;


import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service // 계층 구조상 주로 비즈니스 영역을 담당하는 객체임을 표시하기 위해 사용함.
@Log4j
@AllArgsConstructor // 생성자를 만들고 자동으로 주입함. (생성자를 만들지 않을 경우에는 @setter()를 이용해서 처리함)
public class PostServiceImpl implements PostService {

//	private NoticeMapper mapper;
//	private PostMapper post_mapper;
//	
//	@Override
//	public List<PostVO> selectAllPost(){
//		return post_mapper.selectAllPost();
//	}
//		@Override
//		public List<PostFileVO> selectFileByPno(int pno){
//			return post_mapper.selectFileByPno(pno);
//		}
//		@Override
//		public List<PostReplyVO> selectReplyByPno(int pno){
//			return post_mapper.selectReplyByPno(pno);
//		}
//		@Override
//		public List<PostLikeVO> selectLikeByPno(int pno){
//			return post_mapper.selectLikeByPno(pno);
//		}
//	
//	
//	@Override
//	public int insertHelloMember(HelloMember memberVO) {
//		return post_mapper.insertHelloMember(memberVO);
//	}
//	@Override
//	public int insertPost(PostVO postVO) {
//		return post_mapper.insertPost(postVO);
//	}
//	@Override
//	public int maxPno(String email) {	
//		return post_mapper.maxPno(email);
//	}
//	@Override
//	public int insertPostFile(PostFileVO postVO) {
//		return post_mapper.insertPostFile(postVO);
//	}
	
	

	
}
