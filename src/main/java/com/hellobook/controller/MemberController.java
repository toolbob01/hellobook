package com.hellobook.controller;

import java.sql.Date;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.hellobook.auth.NaverLoginBO;
import com.hellobook.auth.SNSLogin;
import com.hellobook.auth.SnsValue;
import com.hellobook.domain.MemberVO;
import com.hellobook.domain.SessionVO;
import com.hellobook.security.CustomUserDetailsService;
import com.hellobook.service.MemberService;
import com.hellobook.utility.Message;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
public class MemberController {
	
	private NaverLoginBO naverLoginBO;
	
	@Inject
	private SnsValue googleSns;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
	@Autowired
	private BCryptPasswordEncoder pwencoder;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CustomUserDetailsService cuds;
	
	@GetMapping("login")
	public String login(Model model, HttpSession session) {
		//naver로그인 url 생성
		String naverAuthUrl = naverLoginBO.getAuthorizaionUrl(session);
		model.addAttribute("naverUrl",naverAuthUrl);
		
		//google로그인 url 생성
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String googelAuthUrl = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		model.addAttribute("googleUrl",googelAuthUrl);
		
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
			return "/member/naverJoin";
		}else {
			mvo.setPassword(pwencoder.encode(id));
			memberService.changePwd(mvo);
			
			UserDetails socialvo = (UserDetails)cuds.loadUserByUsername(email);
			log.info("socialvo: "+socialvo); //<<--principal
			Authentication autentication = new UsernamePasswordAuthenticationToken(socialvo, socialvo.getPassword(), socialvo.getAuthorities());
			SecurityContext securityContext = SecurityContextHolder.getContext();
			securityContext.setAuthentication(autentication);
			session = request.getSession(true);
			
			User user = (User)autentication.getPrincipal();
			user.getUsername();
			
			SessionVO svo = memberService.read(user.getUsername());
			
			session.setAttribute("username", user.getUsername());
			session.setAttribute("Nname", svo.getNickname());
			session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
			return "/index";
		}
	}
	
	@RequestMapping(value="/memberGoogleLogin", method= {RequestMethod.GET,RequestMethod.POST})
	public String memberGoogleLogin(Model model, @RequestParam(value="code") String code, HttpSession session,HttpServletRequest request) throws Exception{
		//1. code를 이용해서 access_token 받기
		//2. access_token을 이용해서 사용자 profile 정보 가져오기
		SNSLogin snsLogin = new SNSLogin(googleSns);
		String profile = snsLogin.getUserProfile(code);
		log.info("googleProfile: "+ profile);
		//3. DB 유저 존재 체크
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(profile);
		String password = rootNode.get("id").asText();
		String email = rootNode.get("email").asText();
		String nickname = rootNode.get("given_name").asText()+rootNode.get("family_name").asText();
		char language = rootNode.get("locale").asText().toUpperCase().charAt(0);
		
		MemberVO mvo = new MemberVO();
		mvo.setEmail(email);
		mvo.setPassword(password);
		mvo.setLanguage(language);
		mvo.setNickname(nickname);

		//4. 존재 안하면 생성// 존재하면 로그인
		int checkMember = memberService.checkEmail(email);
		
		if(checkMember == 0){
			model.addAttribute("mvo",mvo);
			return "/member/googleJoin";
		}else {
			mvo.setPassword(pwencoder.encode(password));
			memberService.changePwd(mvo);
			
			UserDetails socialvo = (UserDetails)cuds.loadUserByUsername(email);
			log.info("socialvo: "+socialvo); //<<--principal
			Authentication autentication = new UsernamePasswordAuthenticationToken(socialvo, socialvo.getPassword(), socialvo.getAuthorities());
			SecurityContext securityContext = SecurityContextHolder.getContext();
			securityContext.setAuthentication(autentication);
			session = request.getSession(true);
			
			User user = (User)autentication.getPrincipal();
			user.getUsername();
			
			SessionVO svo = memberService.read(user.getUsername());
			
			session.setAttribute("username", user.getUsername());
			session.setAttribute("Nname", svo.getNickname());
			
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
	public ModelAndView insertMember(MemberVO mvo,ModelAndView mav) {
		log.info(mvo);
		String encPw = pwencoder.encode(mvo.getPassword());
		mvo.setPassword(encPw);
		memberService.insertMember(mvo);
		
		//mav는 메세지 전송 객체
		mav.addObject("data", new Message("회원가입에 성공하셨습니다.", "/"));
		//data를 보낼곳 "Message.jsp"지정
		mav.setViewName("Message");
		return mav;
	}
	
	@PostMapping("socialJoin")
	public ModelAndView insertSocialMember(MemberVO mvo,ModelAndView mav, HttpServletRequest request) {
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
		mav.addObject("data", new Message("소셜로그인에 성공하셨습니다.", "/index"));
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
