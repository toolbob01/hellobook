package com.hellobook.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hellobook.domain.MemberVO;
import com.hellobook.service.MemberService;
import com.hellobook.utility.Message;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
public class MemberController {
	
	@Autowired
	private BCryptPasswordEncoder pwencoder;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("login")
	public String login(String error, Model model) {
		if(error != null) {
			model.addAttribute("error", "1");
		}
		return "/member/login";
	}
	
	@GetMapping("join")
	public String join() {
		return "/member/join";
	}
	
	//회원가입 정보 DB에 넣기
	@PostMapping("join")
	public ModelAndView insertMember(MemberVO mvo,ModelAndView mav) {
		log.info(mvo);
		String encPw = pwencoder.encode(mvo.getPassword());
		mvo.setPassword(encPw);
		memberService.insertMember(mvo);
		
		//mav는 메세지 전송 객체
		mav.addObject("data", new Message("회원가입에 성공하셨습니다.", "/member/login"));
		//data를 보낼곳 "Message.jsp"지정
		mav.setViewName("Message");
		return mav;
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
