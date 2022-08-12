package com.hellobook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hellobook.domain.MemberVO;
import com.hellobook.service.MemberService;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/unknown")
	public String unknown() {
		return "/mypage/unknown";
	}
	
	@GetMapping("/profile/{nickname}")
	public String profile(@PathVariable String nickname, Model model) {
		MemberVO mvo = memberService.readByNickname(nickname);
		if(mvo == null) {
			return "/mypage/unknown";
		} else {
			model.addAttribute("mvo", mvo);
			return "/mypage/profile";
		}
		
	}
	
	@GetMapping({"/setting/","/setting/editprofile"})
	public String editprofile() {
		return "/mypage/setting/editprofile";
	}
	
	@GetMapping("/setting/changepwd")
	public String changepwd() {
		return "/mypage/setting/changepwd";
	}
	
	@GetMapping("/setting/quit")
	public String quit() {
		return "/mypage/setting/quit";
	}
	
	@GetMapping("/setting/report")
	public String report() {
		return "/mypage/setting/report";
	}

}
