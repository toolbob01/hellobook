package com.hellobook.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String FriendList(@RequestParam(value="delete", required=false) String delete, 
							 @RequestParam(value="insert", required=false) String insert,
										   Model model, Principal principal) {
		
		    String userid = principal.getName();
		    MemberVO mvo= new MemberVO();
		    mvo.setRemail(userid);
		    
		    //친구 목록 
		    List<MemberVO> showfriendlist = new ArrayList();
		    showfriendlist = friendService.selectFriendList(mvo);
		    model.addAttribute("friendlist", showfriendlist);
		   
		    //친구 신청 목록
		    List<MemberVO> requestfriendlist = new ArrayList();
		    requestfriendlist = friendService.requestFriendList(mvo);
		    model.addAttribute("requestfriendlist", requestfriendlist);
		    
		    
		    //친구 요청 목록
		    List<MemberVO> merequestfriendlist = new ArrayList();
		    merequestfriendlist = friendService.merequestFriendList(mvo);
		    model.addAttribute("merequestfriendlist", merequestfriendlist);
		    
		    //친구 추가 및 요청 삭제
		    if(insert != null) {
		    log.info(insert);
		    mvo.setInsert(insert);
		    mvo.setRemail(userid);
		   
		    friendService.requestInsert(mvo);
		    friendService.merequestDelete(mvo);
		    }
		    
		    //친구 요청 거절
		    if(delete != null) {
		    
		    log.info(delete);
		    mvo.setEmail(delete);
		    friendService.requestDelete(mvo);
		    }
		    
			return "/friend/list";
	}
	

	


	@GetMapping("search")
	public String searchFriend(@RequestParam(value="keyword", required=false, defaultValue=" ") String keyword, Model model, Principal principal) {
	
		log.info(keyword);
		String userid = principal.getName();
		MemberVO mvo= new MemberVO();
		
		mvo.setKeyword(keyword);
		mvo.setUserid(userid);
		
		List<MemberVO> list = new ArrayList<MemberVO>();
		list = friendService.findFriendList(mvo);
		model.addAttribute("friendfind", list);
		
		
	    
		
		
		
		return "/friend/search";
		
		
	}
	
	@GetMapping("request")
	public String requestFriend(@RequestParam(value="request", required=false) String email, Principal principal) {
	
		String userid = principal.getName();
		log.info(email);
		log.info(userid);
		
		MemberVO mvo= new MemberVO();
		mvo.setRemail(userid);
		mvo.setEmail(email);
		
		friendService.requestFriend(mvo);
	    
	
		
		return "/friend/search";
		
		
	}
	
	
	
	

}
