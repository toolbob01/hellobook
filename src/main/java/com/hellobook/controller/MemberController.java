package com.hellobook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hellobook.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
public class MemberController {
	
	@GetMapping("login")
	public String login() {
		return "/member/login";
	}
	
	@GetMapping("join")
	public String join() {
		return "/member/join";
	}
	
	@GetMapping("findpwd")
	public String findPwd() {
		return "/member/find_pwd";
	}
	
	@PostMapping("regtest")
	public String regtest(MemberVO mvo,Model model) {
		log.info(mvo);
		model.addAttribute("mvo",mvo);
		return "/member/regtest";
	}
}
