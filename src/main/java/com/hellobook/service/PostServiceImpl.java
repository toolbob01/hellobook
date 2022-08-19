package com.hellobook.service;

import java.util.List;



import org.springframework.stereotype.Service;

import com.hellobook.domain.PostFileVO;
import com.hellobook.domain.PostLikeVO;
import com.hellobook.domain.PostVO;
import com.hellobook.domain.ReplyVO;
import com.hellobook.mapper.PostMapper;
import com.hellobook.utility.Criteria;
import com.hellobook.utility.Time;

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
		public List<ReplyVO> selectThreeReplyByPno(int pno){
			return mapper.selectThreeReplyByPno(pno);
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
	public int deletePostFileByFno(int fno) {
		return mapper.deletePostFileByFno(fno);
	}
	@Override
	public int deletePostFileByPno(int pno) {
		return mapper.deletePostFileByPno(pno);
	}
	
	@Override
	public int updatePost(PostVO postVO) {
		return mapper.updatePost(postVO);
	}
	
	@Override
	public int countLike(int pno) {
		return mapper.countLike(pno);
	}
	@Override

	public int deleteLike(PostLikeVO likeVO) {
		return mapper.deleteLike(likeVO);

	}
	@Override
	public int addLike(PostLikeVO likeVO) {
		return mapper.addLike(likeVO);
	}
	
	@Override
	public PostVO postDetail(int pno) {
		return mapper.postDetail(pno);
	}
	@Override
	public List<ReplyVO> selectReplyByPno(int pno){
		List<ReplyVO> reply_list = mapper.selectReplyByPno(pno);
		for( ReplyVO replyVO : reply_list ) { // Reply List
			replyVO.setCocomment_list(mapper.selectDepthByRepno(replyVO.getRepno()));
			List<ReplyVO> cocoment_list = replyVO.getCocomment_list();
			for( ReplyVO cocoment : cocoment_list ) { // Cocoment List
				cocoment.setTimer(Time.calculateTime(cocoment.getRepdate())); // cocoment's Timer
			}
		}
		return reply_list;
	}
	
	@Override
	public List<PostVO> selectMypost(String nickname) {
		List<PostVO> pvo = mapper.selectMypost(nickname);
		return pvo;
	}
	
	@Override
	public List<PostVO> selectMyLikepost(String email) {
		List<PostVO> pvo = mapper.selectMyLikepost(email);
		return pvo;
	}

	@Override
	public int insertComment(ReplyVO replyVO) {
		return mapper.insertComment(replyVO);
	}
	@Override
	public ReplyVO recentCommentByEmail(String email) {
		return mapper.recentCommentByEmail(email);
	}
	
	
}
