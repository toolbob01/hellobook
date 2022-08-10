package com.hellobook.mebertest;

import java.sql.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hellobook.domain.MemberVO;
import com.hellobook.service.MemberService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
public class MemberTests {

	@Autowired
	private BCryptPasswordEncoder pwencoder;

	@Autowired
	private MemberService memberService;
	
	@Test
	public void memberInsertTest() {
		Date today = Date.valueOf("2022-08-10");
		
		for(int i=0;i<100;i++) {
			MemberVO mvo = new MemberVO();
			String encodepw = pwencoder.encode(Integer.toString(i));
			
			mvo.setEmail("member"+i+"@test.com");
			mvo.setPassword(encodepw);
			mvo.setBirth(today);
			mvo.setLanguage('K');
			mvo.setNickname("member"+i);
			mvo.setSex('M');
			mvo.setHobby("");
			
			memberService.insertMember(mvo);
		}
	}
}
