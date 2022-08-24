package com.hellobook.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hellobook.domain.MemberVO;
import com.hellobook.domain.PostFileVO;
import com.hellobook.domain.PostLikeVO;
import com.hellobook.domain.PostVO;
import com.hellobook.domain.ReplyVO;
import com.hellobook.service.MemberService;
import com.hellobook.service.PostService;
import com.hellobook.utility.Time;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/post/*")
@AllArgsConstructor
@Log4j
public class PostController {
	
	private PostService post_service;
	private MemberService member_service;
	
	@GetMapping("post_write")
	public String postWrite() {
		return "/post/post_write";
	}
	
	
	@PostMapping("post_write")
	@PreAuthorize("isAuthenticated() and ( principal.username == #postVO.email )")
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
					insert_file_result += post_service.insertPostFile(fileVO); // 파일 DB에 저장
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("Error : Multipartfile - " + uploadFileName + " 's Transfering Fail ( pno : " + nowPno + " )");
				}
			} // for
		}else {
			rttr.addFlashAttribute("insert_post_result", insert_post_result);
			return "redirect:/";
		}
		
		rttr.addFlashAttribute("insert_post_result", insert_post_result);
		rttr.addFlashAttribute("insert_pno", nowPno);
		rttr.addFlashAttribute("request_file_count", request_file_count);
		rttr.addFlashAttribute("insert_file_result", insert_file_result);
		return "redirect:/";
	}
	
	
	@GetMapping("post_update")
	@PreAuthorize("isAuthenticated() and ( principal.username == #email )")
	public String postUpdate(Model model, int pno, String email) {
		
		PostVO postVO = post_service.postDetail(pno);
		postVO.setFile_list(post_service.selectFileByPno(pno));
		
		model.addAttribute("postVO", postVO);
		return "/post/post_update";
	}
	
	@PostMapping("post_update")
	@PreAuthorize("isAuthenticated() and ( principal.username == #postVO.email )")
	public String postUpdatePost( @RequestParam(name = "uploadfile", required = false) List<MultipartFile> file_list, 
							      @RequestParam(name = "existingFile", required = false) List<Integer> existing_list, // null pointer 방지용 -1 들어있음.
								  Model model, RedirectAttributes rttr, PostVO postVO ) {
		
		int update_result = 0;
		int request_file_count = file_list.size();
		int insert_file_result = 0;
		
		// 기존에 있던 ( Local Images + DB file ) 삭제
		List<PostFileVO> fileVO_list = post_service.selectFileByPno(postVO.getPno());
		
		for( PostFileVO fileVO : fileVO_list ) {
			if( !existing_list.contains(fileVO.getFno()) ) { // If not contained FNO
				if( post_service.deletePostFileByFno(fileVO.getFno()) == 1 ) { // If successed Delete FNO
			        try{
					    String srcFileName = URLDecoder.decode(fileVO.getUuid(),"UTF-8"); // UUID가 포함된 파일이름을 디코딩해줍니다.
					    String uploadPath = "c:\\hello_img" + File.separator + "post" ;
			            File file = new File(uploadPath + File.separator + srcFileName);
			            boolean result = false;
			            if( file.exists() ) {
				            result = file.delete();
				            if( !result ) { // result가 false일 때, 파일 삭제 실패로 간주하여 / 로 돌아감.
				            	System.out.println("Error - Post File Delete in Folder !!! ( pno : " + postVO.getPno() + ", fno : " + fileVO.getFno() + " )");
				    			rttr.addFlashAttribute("update_result", 0);
				            	return "redirect:/";
				            }
			            }
			        }catch (UnsupportedEncodingException e){
			            e.printStackTrace();
			        }
				}else { // DB에서 fno 삭제 실패 시 메서드는 계속 진행 되나, 콘솔창에 경고 알림.
					System.out.println("Error - Post File Delete in DB Fail !!! ( pno : " + postVO.getPno() + ", fno : " + fileVO.getFno() + " )");
				}
			} // If not contained FNO
		}
		System.out.println("---------------------------------------------------");
		// Post Update
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
					  .pno(postVO.getPno())
					  .email(postVO.getEmail())
					  .uuid(uuidFileName) // 테이블에 저장하기 위한 경로
					  .build();
			try {
				uploadfile.transferTo(uploadSaveFile); // 파일 실제로 전송
				insert_file_result += post_service.insertPostFile(fileVO); // 파일 DB에 저장
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Error : Multipartfile - " + uploadFileName + " 's Transfering Fail ( pno : " + postVO.getPno() + " )");
			}
		}
		
		update_result = post_service.updatePost(postVO);
		rttr.addFlashAttribute("update_result", update_result);
		rttr.addFlashAttribute("update_pno", postVO.getPno());
		rttr.addFlashAttribute("request_file_count", request_file_count);
		rttr.addFlashAttribute("insert_file_result", insert_file_result);
		return "redirect:/";
	}
	
	@GetMapping("post_delete")
	@PreAuthorize("isAuthenticated() and ( principal.username == #email )")
	public String postDelete(int pno, String email, RedirectAttributes rttr) {

		List<PostFileVO> file_list = post_service.selectFileByPno(pno);
		
		for( PostFileVO fileVO : file_list ) {
			if( post_service.deletePostFileByFno(fileVO.getFno()) == 1 ) {
		        try{
				    String srcFileName = URLDecoder.decode(fileVO.getUuid(),"UTF-8"); // UUID가 포함된 파일이름을 디코딩해줍니다.
				    String uploadPath = "c:\\hello_img" + File.separator + "post" ;
		            File file = new File(uploadPath + File.separator + srcFileName);
		            boolean result = false;
		            if( file.exists() ) {
			            result = file.delete();
			            if( !result ) { // result가 false일 때, 파일 삭제 실패로 간주하여 / 로 돌아감.
			            	System.out.println("Error - Post File Delete in Folder !!! ( pno : " + pno + ", fno : " + fileVO.getFno() + " )");
			    			rttr.addFlashAttribute("delete_result", 0);
			    			rttr.addFlashAttribute("delete_pno", pno);
			            	return "redirect:/";
			            }
		            }
		        }catch (UnsupportedEncodingException e){
		            e.printStackTrace();
		        }
			}else { // DB에서 fno 삭제 실패 시 메서드는 계속 진행 되나, 콘솔창에 경고 알림.
				System.out.println("Error - Post File Delete in DB Fail !!! ( pno : " + pno + ", fno : " + fileVO.getFno() + " )");
//				rttr.addFlashAttribute("delete_result", 0);
//				rttr.addFlashAttribute("delete_pno", pno);
//				return "redirect:/";
			}
		} 

		int delete_result = post_service.deletePost(pno);
		rttr.addFlashAttribute("delete_result", delete_result);
		rttr.addFlashAttribute("delete_pno", pno);
		return "redirect:/";
	}
	
	@GetMapping("like_delete") 
	@PreAuthorize("isAuthenticated() and ( principal.username == #email )")
	@ResponseBody
	public String deleteLike(String email, int pno) { 
		PostLikeVO likeVO = PostLikeVO.builder().pno(pno).email(email).build();
		post_service.deleteLike(likeVO);

		int result = post_service.countLike(pno);
		return Integer.toString(result);
	}
	
	@GetMapping("like_add") 
	@PreAuthorize("isAuthenticated() and ( principal.username == #email )")
	@ResponseBody
	public String addLike(String email, int pno) { 
		PostLikeVO likeVO = PostLikeVO.builder().email(email).pno(pno).build();
		post_service.addLike(likeVO);
		int result = post_service.countLike(pno);
		return Integer.toString(result);
	}
	
	@GetMapping("post_detail_modal") 
	@ResponseBody
	public PostVO postDetailModal(int pno) { 
		
		PostVO postVO = post_service.postDetail(pno);

		postVO.setFile_list(post_service.selectFileByPno(pno)); 	    // Image
		postVO.setReply_list(post_service.selectReplyByPno(pno));    // Reply
		List<ReplyVO> relpy_list = postVO.getReply_list();
		for( ReplyVO replyVO : relpy_list ) {
			replyVO.setTimer(Time.calculateTime(replyVO.getRepdate())); // Reply's Timer // coComent's Timer implemented in PostServiceImpl.java
		}
		postVO.setReply_cnt(postVO.getReply_list().size()); 	// Reply Count
		postVO.setLike_list(post_service.selectLikeByPno(pno)); 		// Like
		postVO.setLike_cnt(postVO.getLike_list().size());   	// Like Count
		postVO.setTimer(Time.calculateTime(postVO.getPdate())); // ex) 5분전 2시간전 3일전
		
		return postVO;
	}
	
	@PostMapping("comment_insert")
	@PreAuthorize("isAuthenticated() and ( principal.username == #replyVO.email )")
	@ResponseBody
	public ReplyVO commentInsert(ReplyVO replyVO) {
		
		/* 조건에 따라 Depth 바꾸기 + Refno 참조 */
		int insert_result = post_service.insertComment(replyVO);
		ReplyVO rVO = post_service.recentCommentByEmail(replyVO.getEmail());
		rVO.setTimer(Time.calculateTime(rVO.getRepdate()));

		return insert_result != 1 ? null : rVO;
	}
	
	@GetMapping("like_user_list") 
	@ResponseBody
	public List<PostLikeVO> like_user_list(int pno, HttpServletRequest request) { 
		
		// friendYN !!!
		List<PostLikeVO> like_list = post_service.selectLikeByPno(pno);
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("username");
		List<MemberVO> friend_list = member_service.selectFriends(email);
		
		for( PostLikeVO likeVO : like_list ) {
			for( MemberVO friendVO : friend_list ) {
				if( likeVO.getEmail().equals(friendVO.getEmail()) ) {
					likeVO.setFriendYN("Y");
					break;
				}
			}
		}
		
		return like_list;
	}
	
}
