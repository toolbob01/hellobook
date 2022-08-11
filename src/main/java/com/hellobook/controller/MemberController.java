package com.hellobook.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.authentication.UserServiceBeanDefinitionParser;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.hellobook.auth.NaverLoginBO;
import com.hellobook.domain.MemberVO;
import com.hellobook.service.MemberService;
import com.hellobook.utility.Message;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
public class MemberController {
	
	private NaverLoginBO naverLoginBO;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	private BCryptPasswordEncoder pwencoder;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("login")
	public String login(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizaionUrl(session);
		model.addAttribute("naverUrl",naverAuthUrl);
		
		return "/member/login";
	}
	
	@RequestMapping(value="/memberNaverLogin", method= {RequestMethod.GET,RequestMethod.POST})
	public String memberNaverLogin(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception{
		OAuth2AccessToken oauthToken;
		//로그인 사용자 정보를 읽어옴
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		String apiResult = naverLoginBO.getUserProfile(oauthToken);
		log.info("UserProfile 정보 : "+apiResult);
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> apiJson = (Map<String, Object>)objectMapper.readValue(apiResult, Map.class).get("response");
		log.info("UserProfile 정보222 : "+apiJson);
		
		model.addAttribute("result",apiJson);
		
		
		return "/member/loginresult";
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
