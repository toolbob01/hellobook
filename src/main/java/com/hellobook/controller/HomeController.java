package com.hellobook.controller;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {

//	private PostService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
//		List<com.hellobook.domain.PostVO> post_list = service.selectAllPost();
//		for( PostVO postVO : post_list ) {
//			postVO.setFile_list(service.selectFileByPno(postVO.getPno()));
//			postVO.setReply_list(service.selectReplyByPno(postVO.getPno()));
//			postVO.setReply_cnt(service.selectReplyByPno(postVO.getPno()).size());
//			postVO.setLike_list(service.selectLikeByPno(postVO.getPno()));
//			postVO.setLike_cnt(service.selectLikeByPno(postVO.getPno()).size());
//			postVO.setTimer(Time.calculateTime(postVO.getPdate()));
//		}
//		
//		model.addAttribute("post_list", post_list);
		
		return "index";
	}
	

}
