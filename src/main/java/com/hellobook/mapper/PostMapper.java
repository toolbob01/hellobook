package com.hellobook.mapper;

import java.util.List;

import com.hellobook.domain.PostFileVO;
import com.hellobook.domain.PostLikeVO;
import com.hellobook.domain.ReplyVO;
import com.hellobook.utility.Criteria;
import com.hellobook.domain.PostVO;


public interface PostMapper {

	public int selectPostCount(Criteria cri);
	
	public List<PostVO> selectAllPost(Criteria cri);
		public List<PostFileVO> selectFileByPno(int pno);
		public List<ReplyVO> selectThreeReplyByPno(int pno);
		public List<PostLikeVO> selectLikeByPno(int pno);
	
	public int insertPost(PostVO postVO);
	public int maxPno(String email);
	public int insertPostFile(PostFileVO fileVO);
	
	public int deletePost(int pno);
	public int deletePostFileByFno(int fno);
	public int deletePostFileByPno(int pno);
	
	public int updatePost(PostVO postVO);
	
	public int countLike(int pno);

	public int deleteLike(PostLikeVO likeVO);

	public int addLike(PostLikeVO likeVO);

	public PostVO postDetail(int pno);
	public List<ReplyVO> selectReplyByPno(int pno);
	public List<ReplyVO> selectDepthByRepno(int repno);
	
	public int insertComment(ReplyVO replyVO);
	public ReplyVO recentCommentByEmail(String email);
	

	public List<PostVO> selectMypost(String nickname);
	public List<PostVO> selectMyLikepost(String email);
	
	public int countPost(String email);
}
