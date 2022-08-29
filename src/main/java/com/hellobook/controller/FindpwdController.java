package com.hellobook.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hellobook.domain.MemberVO;
import com.hellobook.service.FindpwdService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@AllArgsConstructor
@RequestMapping("/findpwd/")
public class FindpwdController {
	
	@Autowired
	private FindpwdService findpwdService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private BCryptPasswordEncoder pwencoder;
	
	//이메일 등록 유무 확인
	@PostMapping(value = "/checkemail", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> findEmail(@RequestBody MemberVO mvo) {
		log.info(mvo);
		int emailCheck = findpwdService.checkEmail(mvo.getEmail());
		return emailCheck != 0?
				new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping(value = "/changePwd", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> changePwd(@RequestBody MemberVO mvo){
		String encPwd = pwencoder.encode(mvo.getPassword());
		mvo.setPassword(encPwd);
		
		int changeCheck = findpwdService.changePwd(mvo);
		System.out.println(changeCheck);
		return changeCheck == 1?
				new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//인증번호 전송
		@GetMapping("/getcode")
		public @ResponseBody String getCode(String email) {
			Random random = new Random();
			int checkNum = random.nextInt(888888)+111111;
			
			String setFrom = "HelloBook 관리자<kumosun@naver.com>";
			String toMail = email;
			String title = "HelloBook 비밀번호 변경 인증번호 메일입니다.";
			String content = "<p>HelloBook 고객지원센터입니다.</p>"
					+"<p>아래의 인증번호를 입력하여 비밀번호 변경을 완료해주세요.</p>"
					+"<p>인증번호 : "+checkNum+"</p>"
					+"<p>해당 인증번호를 복사하여 인증 확인란에 붙여넣기 해주세요.</p>"
					+"<p>감사합니다.</p>";
			
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content,true);
				mailSender.send(message);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			String code = Integer.toString(checkNum);
			log.info("인증번호 : "+code);
			
			return code;
		}
}
