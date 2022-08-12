package com.hellobook.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.hellobook.auth.NaverLoginBO;
import com.hellobook.domain.MemberVO;
import com.hellobook.security.CustomUserDetailsService;
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
	
	@Autowired
	private CustomUserDetailsService cuds;
	
	@GetMapping("login")
	public String login(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizaionUrl(session);
		log.info("session: "+session);
		log.info("naverAuthUrl: "+naverAuthUrl);
		log.info("여기는 로그인 페이지 입니다.");
		model.addAttribute("naverUrl",naverAuthUrl);
		
		return "/member/login";
	}
	
	@RequestMapping(value="/memberNaverLogin", method= {RequestMethod.GET,RequestMethod.POST})
	public String memberNaverLogin(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request) throws Exception{
		OAuth2AccessToken oauthToken;
		//로그인 사용자 정보를 읽어옴
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		String apiResult = naverLoginBO.getUserProfile(oauthToken);
		log.info("UserProfile 정보 : "+apiResult);
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> apiJson = (Map<String, Object>)objectMapper.readValue(apiResult, Map.class).get("response");
		log.info("UserProfile 정보222 : "+apiJson);
		
		MemberVO mvo = new MemberVO();
		
		String birthYear = apiJson.get("birthyear").toString();
		String birthday = apiJson.get("birthday").toString();
		String date = birthYear+"-"+birthday;
		String gender = apiJson.get("gender").toString();
		
		String id = apiJson.get("id").toString();
		String nickName = apiJson.get("nickname").toString();
		String email = apiJson.get("email").toString();
		char sex = gender.charAt(0);
		Date birth = Date.valueOf(date);
		
		mvo.setEmail(email);
		mvo.setPassword(id);
		mvo.setNickname(nickName);
		mvo.setBirth(birth);
		mvo.setSex(sex);
		
		int checkMember = memberService.checkEmail(email);
		
		log.info("mvo: "+mvo);
		
		if(checkMember == 0){
			model.addAttribute("mvo",mvo);
			return "/member/socialJoin";
		}else {
			log.info("["+apiJson.get("email")+"]은 존재하는 아이디");
			
			UserDetails socialvo = (UserDetails)cuds.loadUserByUsername(email);
			log.info("socialvo: "+socialvo); //<<--principal
			Authentication autentication = new UsernamePasswordAuthenticationToken(socialvo, socialvo.getPassword(), socialvo.getAuthorities());
			SecurityContext securityContext = SecurityContextHolder.getContext();
			securityContext.setAuthentication(autentication);
			session = request.getSession(true);
			session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
			return "/index";
		}
	}
	
	@GetMapping("join")
	public String join() {
		return "/member/join";
	}
	
	//회원가입 정보 DB에 넣기
	@PostMapping("join")
	public ModelAndView insertMember(MemberVO mvo,ModelAndView mav, HttpServletRequest request) {
		log.info(mvo);
		String encPw = pwencoder.encode(mvo.getPassword());
		mvo.setPassword(encPw);
		memberService.insertMember(mvo);
		HttpSession session;
		//로그인 절차를 1번으로 줄여야 한다.
		//소셜 로그인 시 login.jsp말고 index로 이동되게 
		UserDetails socialvo = (UserDetails)cuds.loadUserByUsername(mvo.getEmail());
		log.info("socialvo: "+socialvo);
		Authentication autentication = new UsernamePasswordAuthenticationToken(socialvo, socialvo.getPassword(), socialvo.getAuthorities());
		SecurityContext securityContext = SecurityContextHolder.getContext();
		securityContext.setAuthentication(autentication);
		session = request.getSession(true);
		session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
		
		//mav는 메세지 전송 객체
		mav.addObject("data", new Message("소셜로그인에 성공하셨습니다.", "/"));
		//data를 보낼곳 "Message.jsp"지정
		mav.setViewName("Message");
		return mav;
	}
	
	@PostMapping("socialJoin")
	public ModelAndView insertSocialMember(MemberVO mvo,ModelAndView mav) {
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
	
	@GetMapping("checkEmail")
	public @ResponseBody String checkEmail(String email){
		int emailCheck = memberService.checkEmail(email);
		return emailCheck != 0? Integer.toString(emailCheck) : "0";
	}
	
	@GetMapping("checkNickname")
	public @ResponseBody String checkNickname(String nickname){
		int nicknameCheck = memberService.checkNickname(nickname);
		return nicknameCheck != 0? Integer.toString(nicknameCheck) : "0";
	}
}
