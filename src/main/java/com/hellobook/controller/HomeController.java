package com.hellobook.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hellobook.utility.PageVO;
import com.hellobook.domain.PostLikeVO;
import com.hellobook.domain.PostVO;
import com.hellobook.domain.ReplyVO;
import com.hellobook.service.MemberService;
import com.hellobook.service.PostService;
import com.hellobook.utility.Criteria;
import com.hellobook.utility.Time;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@AllArgsConstructor
@Log4j
public class HomeController {

	private PostService service;
	private MemberService member_service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, Criteria cri, HttpServletRequest request) {
		
		int count = service.selectPostCount(cri);
		List<PostVO> post_list = service.selectAllPost(cri);

		for( PostVO postVO : post_list ) {
			int pno = postVO.getPno();
			postVO.setFile_list(service.selectFileByPno(pno)); 	    // Image
			postVO.setReply_list(service.selectThreeReplyByPno(pno));    // Reply
			List<ReplyVO> relpy_list = postVO.getReply_list();
			for( ReplyVO replyVO : relpy_list ) {
				replyVO.setTimer(Time.calculateTime(replyVO.getRepdate())); // Reply's Timer
			}
			postVO.setReply_cnt(relpy_list.size()); 	// Reply Count
			postVO.setLike_list(service.selectLikeByPno(pno)); 		// Like
			postVO.setLike_cnt(postVO.getLike_list().size());   	// Like Count
			postVO.setTimer(Time.calculateTime(postVO.getPdate())); // ex) 5분전 2시간전 3일전
		}

		model.addAttribute("post_list", post_list);
		model.addAttribute("pageVO" , new PageVO(cri, count));
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("username");
		model.addAttribute("friend_list", member_service.selectFriends(email));
		return "index";
	}
	

}
