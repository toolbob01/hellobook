package com.hellobook.mapper;

import java.util.List;

import com.hellobook.domain.PostFileVO;
import com.hellobook.domain.PostLikeVO;
import com.hellobook.domain.ReplyVO;
import com.hellobook.utility.Criteria;
import com.hellobook.domain.PostVO;


public interface PostMapper {

	public List<PostVO> selectAllPost(Criteria cri);
		public List<PostFileVO> selectFileByPno(int pno);
		public List<ReplyVO> selectReplyByPno(int pno);
		public List<PostLikeVO> selectLikeByPno(int pno);
	
	public int insertPost(PostVO postVO);
	public int maxPno(String email);
	public int insertPostFile(PostFileVO fileVO);
	
	public int deletePost(int pno);
	public int deletePostFile(int fno);
	

}
