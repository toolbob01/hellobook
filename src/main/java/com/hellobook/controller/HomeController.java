package com.hellobook.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hellobook.utility.PageVO;
import com.hellobook.domain.PostLikeVO;
import com.hellobook.domain.PostVO;
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
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, Criteria cri) {
		
		int count = service.selectPostCount(cri);
		List<PostVO> post_list = service.selectAllPost(cri);

		for( PostVO postVO : post_list ) {
			int pno = postVO.getPno();
			postVO.setFile_list(service.selectFileByPno(pno)); 	    // Image
			postVO.setReply_list(service.selectReplyByPno(pno));    // Reply
			postVO.setReply_cnt(postVO.getReply_list().size()); 	// Reply Count
			postVO.setLike_list(service.selectLikeByPno(pno)); 		// Like
			postVO.setLike_cnt(postVO.getLike_list().size());   	// Like Count
			postVO.setTimer(Time.calculateTime(postVO.getPdate())); // ex) 5분전 2시간전 3일전
		}

		model.addAttribute("post_list", post_list);
		model.addAttribute("pageVO" , new PageVO(cri, count));
		return "index";
	}
	

}
