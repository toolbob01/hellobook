package com.hellobook.controller;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hellobook.domain.MemberVO;
import com.hellobook.domain.PostFileVO;
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
	
	@PostMapping("/thumbnailUpdate")
	public String thumbnailUpdate(MemberVO mvo, @RequestParam("profile") MultipartFile profile, String nickname) {
		String uploadFileName = profile.getOriginalFilename();
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);

		//중복파일 처리
		UUID uuid = UUID.randomUUID();
		String uuidFileName = uuid.toString() + "_" + uploadFileName;

		//업로드 패스 구하기
		String uploadFolder = "c:\\hello_img"; // c:/hello_img
		uploadFolder = uploadFolder + File.separator + "member"; // c:/hello_img/member
		//업로드하는 경로와 파일 객체 생성
		File uploadSaveFile = new File(uploadFolder, uuidFileName); // c:/hello_img/member/aaa.jpg
		// 첨부파일 업로드 폴더에 저장하기
		String uploadUrl = uploadSaveFile.toString().substring(20);
		try {
			profile.transferTo(uploadSaveFile); // 파일 실제로 전송
			mvo.setProfile(uploadUrl);
			memberService.updateThumbnailByNickname(mvo);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error : Multipartfile - " + uploadFileName + " 's Transfering Fail ! ! !");
		}
		
		return "redirect:/mypage/profile/"+nickname;
	}

}
