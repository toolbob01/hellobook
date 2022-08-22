package com.hellobook.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hellobook.domain.MemberVO;
import com.hellobook.service.FriendService;

import lombok.extern.slf4j.Slf4j;



@Slf4j
@Controller
@RequestMapping("/friend/*")
public class FriendController {
	
	@Autowired
	private FriendService friendService;
	
	@GetMapping("list")
	public ModelAndView FriendList(@RequestParam(value="request", required=false) String nickname, ModelAndView mav) {
		
		log.info(nickname);
		mav.addObject("friendrequest", nickname);
		
		int count = friendService.countFriendList();
		
		List<MemberVO> list = new ArrayList();
		list = friendService.selectFriendList();
		mav.addObject("friendlist", list);
		mav.addObject("friendcount", count);
		mav.setViewName("/friend/list");
		return mav;
	}
	 
	@GetMapping("request")
	public String requestFriend(@RequestParam(value="request", required=false) String nickname) {
		
		log.info(nickname);
		
		return "/friend/list";
	}
	

	
	@GetMapping("search")
	public String searchFriend(@RequestParam(value="keyword", required=false, defaultValue="") String keyword, Model model) {
	
		log.info(keyword);
		
		MemberVO mvo= new MemberVO();
		
		mvo.setKeyword(keyword);

		
		List<MemberVO> list = new ArrayList<MemberVO>();
		list = friendService.findFriendList(mvo);
		model.addAttribute("friendfind", list);
		
		
		return "/friend/search";
		
		
	}
}
