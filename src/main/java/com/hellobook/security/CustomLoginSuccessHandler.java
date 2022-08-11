package com.hellobook.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.hellobook.domain.MemberVO;
import com.hellobook.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	@Autowired
	private MemberService memberService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)throws IOException, ServletException {
		log.warn("Login Success");

		User user = (User)auth.getPrincipal();
		user.getUsername();
		
		MemberVO mvo = memberService.read(user.getUsername());
		
		HttpSession session = request.getSession();
		session.setAttribute("username", user.getUsername());
		session.setAttribute("nickname", mvo.getNickname());
		
		response.sendRedirect("/");
	}
}
