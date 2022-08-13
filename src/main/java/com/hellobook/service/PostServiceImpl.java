package com.hellobook.service;

import java.util.List;



import org.springframework.stereotype.Service;

import com.hellobook.domain.PostFileVO;
import com.hellobook.domain.PostLikeVO;
import com.hellobook.domain.PostVO;
import com.hellobook.domain.ReplyVO;
import com.hellobook.mapper.PostMapper;
import com.hellobook.utility.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service // 계층 구조상 주로 비즈니스 영역을 담당하는 객체임을 표시하기 위해 사용함.
@Log4j
@AllArgsConstructor // 생성자를 만들고 자동으로 주입함. (생성자를 만들지 않을 경우에는 @setter()를 이용해서 처리함)
public class PostServiceImpl implements PostService {

	private PostMapper mapper;
	
	@Override
	public List<PostVO> selectAllPost(Criteria cri){
		return mapper.selectAllPost(cri);
	}
		@Override
		public int selectPostCount(Criteria cri) {
			return mapper.selectPostCount(cri);
		}
		@Override
		public List<PostFileVO> selectFileByPno(int pno){
			return mapper.selectFileByPno(pno);
		}
		@Override
		public List<ReplyVO> selectReplyByPno(int pno){
			return mapper.selectReplyByPno(pno);
		}
		@Override
		public List<PostLikeVO> selectLikeByPno(int pno){
			return mapper.selectLikeByPno(pno);
		}
	
	
	@Override
	public int insertPost(PostVO postVO) {
		return mapper.insertPost(postVO);
	}
		@Override
		public int maxPno(String email) {	
			return mapper.maxPno(email);
		}
	@Override
	public int insertPostFile(PostFileVO fileVO) {
		return mapper.insertPostFile(fileVO);
	}
	
	@Override
	public int deletePost(int pno) {
		return mapper.deletePost(pno);
	}
	@Override
	public int deletePostFile(int fno) {
		return mapper.deletePostFile(fno);
	}
	
	@Override
	public int countLike(int pno) {
		return mapper.countLike(pno);
	}
	@Override
	public int deleteLike(String email) {
		return mapper.deleteLike(email);
	}
	@Override
	public int addLike(PostLikeVO likeVO) {
		return mapper.addLike(likeVO);
	}
	
}
