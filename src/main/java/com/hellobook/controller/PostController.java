package com.hellobook.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hellobook.domain.PostFileVO;
import com.hellobook.domain.PostVO;
import com.hellobook.service.PostService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/post/*")
@AllArgsConstructor
@Log4j
public class PostController {
	
	private PostService post_service;
	
	@GetMapping("post_write")
	public String postWrite() {
		return "/post/post_write";
	}
	
	
	@PostMapping("post_write")
	@PreAuthorize("principal.username == #postVO.email")
	public String postWriteUpload(Model model, PostVO postVO, RedirectAttributes rttr, @RequestParam("uploadfile") List<MultipartFile> file_list) {
		
		int insert_post_result = post_service.insertPost(postVO);
		int request_file_count = file_list.size();
		int insert_file_result = 0;
		
		int nowPno = post_service.maxPno(postVO.getEmail());
		
		if( insert_post_result == 1 ) {
			for( MultipartFile uploadfile : file_list ) {
				String uploadFileName = uploadfile.getOriginalFilename();
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1); 
				log.info("uploadFileName : " + uploadFileName);
				//중복파일 처리
				UUID uuid = UUID.randomUUID();
				String uuidFileName = uuid.toString() + "_" + uploadFileName;
				log.info("UUID File Name : " + uuidFileName);
				//업로드 패스 구하기
				String uploadFolder = "c:\\hello_img"; // c:/hello_img
				uploadFolder = uploadFolder + File.separator + "post"; // c:/hello_img/post
				//업로드하는 경로와 파일 객체 생성
				File uploadSaveFile = new File(uploadFolder, uuidFileName); // c:/hello_img/post/aaa.jpg
				log.info("uploadSaveFile : " + uploadSaveFile);
				// 첨부파일 업로드 폴더에 저장하기
				PostFileVO fileVO = PostFileVO.builder()
						  .pno(nowPno)
						  .email(postVO.getEmail())
						  .uuid(uuidFileName) // 테이블에 저장하기 위한 경로
						  .build();
				try {
					uploadfile.transferTo(uploadSaveFile); // 파일 실제로 전송
					insert_file_result += post_service.insertPostFile(fileVO);
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("Error : Multipartfile - " + uploadFileName + " 's Transfering Fail ! ! !");
				}
			} // for
		}else {
			rttr.addFlashAttribute("insert_post_result", insert_post_result);
			return "redirect:/";
		}
		
		rttr.addFlashAttribute("insert_post_result", insert_post_result);
		rttr.addFlashAttribute("request_file_count", request_file_count);
		rttr.addFlashAttribute("insert_file_result", insert_file_result);
		return "redirect:/";
	}
	
	
	@GetMapping("post_update")
	public String postUpdate() {
		return "/post/post_update";
	}
	
	
	
}
