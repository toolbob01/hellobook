package com.hellobook.mebertest;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hellobook.domain.ChatVO;
import com.hellobook.service.MemberService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MemberTests {

	@Autowired
	private BCryptPasswordEncoder pwencoder;

	@Autowired
	private MemberService memberService;
	
	@Test
	public void getNewChat() {
		
		//1. 로그인 한 사용자의 이름을 받아온다
		//세션에 있는 email받아오면 될거 같습니다
		String email = "test@test.com";
		
		
		//email을 토대로 자신이 들어가 있는 rno 값을 모두 읽어온다.
		//배열에 읽어온 rno값을 전부 담는다
		int[] rnoArr = memberService.getRno(email);
		
		
		//반복문을 통해 rno값을 이용해 가장 최신 mno를 찾는다.
		//채팅방은 있으나 내용이 없을 수 도 있으니 Integer타입으로 받아야 한다.
		Integer[] mnoArr = new Integer[rnoArr.length];
		
		int i = 0;
		
		for(int rno:rnoArr) {
			mnoArr[i] = memberService.getNewMno(rno);
			log.info("-------------------");
			log.info(mnoArr[i]);
			log.info("-------------------");
			i++;
		}
		
		
		//찾은 mno값과 email, rno를 이용해
		//방번호, 나와 대화중인 상대 닉네임, 프로필, 대화내용, 시간, 메세지번호를 읽어서 List에 담는다.
		List<ChatVO> chatList = new ArrayList<ChatVO>();
		int J = 0;
		for(Integer mno:mnoArr) {
			chatList.add(memberService.getNewChat(email,rnoArr[J], mno));
			J++;
		}
		
		log.info("-------------------");
		log.info(chatList);
		log.info("-------------------");
		
	}
}
