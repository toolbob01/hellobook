package com.hellobook.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hellobook.domain.MemberVO;
import com.hellobook.domain.PostVO;
import com.hellobook.domain.ReplyVO;
import com.hellobook.domain.SessionVO;
import com.hellobook.service.MemberService;
import com.hellobook.service.PostService;
import com.hellobook.utility.Time;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage/*")
@Log4j
public class MypageController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private BCryptPasswordEncoder pwencoder;
	
	@GetMapping("/unknown")
	public String unknown() {
		return "/mypage/unknown";
	}
	
	@GetMapping("/profile/{nickname}")
	public String profile(@PathVariable String nickname, HttpServletRequest request, Model model) {
		MemberVO mvo = memberService.readByNickname(nickname);
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("username");
		
		List<PostVO> pvoList = postService.selectMypost(nickname);
		List<PostVO> likeList = postService.selectMyLikepost(email);
		if(mvo == null) {
			return "/mypage/unknown";
		} else {
			
			for( PostVO postVO : pvoList ) {
				int pno = postVO.getPno();
				postVO.setFile_list(postService.selectFileByPno(pno)); 	    // Image
				postVO.setReply_list(postService.selectThreeReplyByPno(pno));    // Reply
				List<ReplyVO> relpy_list = postVO.getReply_list();
				for( ReplyVO replyVO : relpy_list ) {
					replyVO.setTimer(Time.calculateTime(replyVO.getRepdate())); // Reply's Timer
				}
				postVO.setReply_cnt(relpy_list.size()); 	// Reply Count
				postVO.setLike_list(postService.selectLikeByPno(pno)); 		// Like
				postVO.setLike_cnt(postVO.getLike_list().size());   	// Like Count
				postVO.setTimer(Time.calculateTime(postVO.getPdate())); // ex) 5분전 2시간전 3일전
			}
			
			for( PostVO LikeVO : likeList ) {
				int pno = LikeVO.getPno();
				LikeVO.setFile_list(postService.selectFileByPno(pno)); 	    // Image
				LikeVO.setReply_list(postService.selectThreeReplyByPno(pno));    // Reply
				List<ReplyVO> relpy_list = LikeVO.getReply_list();
				for( ReplyVO replyVO : relpy_list ) {
					replyVO.setTimer(Time.calculateTime(replyVO.getRepdate())); // Reply's Timer
				}
				LikeVO.setReply_cnt(relpy_list.size()); 	// Reply Count
				LikeVO.setLike_list(postService.selectLikeByPno(pno)); 		// Like
				LikeVO.setLike_cnt(LikeVO.getLike_list().size());   	// Like Count
				LikeVO.setTimer(Time.calculateTime(LikeVO.getPdate())); // ex) 5분전 2시간전 3일전
			}
			
			model.addAttribute("mvo", mvo);
			model.addAttribute("pvoList", pvoList);
			model.addAttribute("likeList", likeList);
			return "/mypage/profile";
		}
		
	}

	@RequestMapping(value={"/setting/","/setting/editprofile"}, method=RequestMethod.GET)
    public String editprofile(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("username");
		SessionVO svo = memberService.read(email);
		model.addAttribute("svo", svo);
		
        return  "/mypage/setting/editprofile";
    }
	
    @RequestMapping(value="/setting/editprofile", method=RequestMethod.POST)
    public String editAccount(MemberVO mvo, HttpSession session) throws UnsupportedEncodingException {
        String email = (String) session.getAttribute("username");
        mvo.setEmail(email);
        System.out.println(mvo.toString());
        
        memberService.modify(mvo);
        
        SessionVO svo = new SessionVO();
        svo.setNickname(mvo.getNickname());
        session.setAttribute("Nname", svo.getNickname());
        
        String encodedParam = URLEncoder.encode(svo.getNickname(), "UTF-8");
        
        return "redirect:/mypage/profile/"+encodedParam;
       
    }
   
    //비밀번호 변경 요청
    @RequestMapping(value="/setting/changepwd", method=RequestMethod.GET)
    public String changePasswd(HttpServletRequest request, Model model) {
    	
    	HttpSession session = request.getSession();
    	String email = (String) session.getAttribute("username");
		SessionVO svo = memberService.read(email);
		model.addAttribute("svo", svo);
    	
        return "/mypage/setting/changepwd";
    }
    
    //비밀번호 변경처리
    @RequestMapping(value="/setting/changepwd", method=RequestMethod.POST)
    public String submitChangePassword(@Valid MemberVO mvo,BindingResult result) {
    	//로그 표시
    	if(log.isDebugEnabled()) {
    		log.debug("<<MemberVO>> : " + MemberVO);
    	}
    	
    	//유효성 체크
    	if(result.hasFieldErrors("passwd")) {
    		
    		 return "/mypage/setting/changepwd";
    	}
    	//비밀번호 인증
    	SessionVO svo = memberService.read(mvo.getEmail());
    	
    }
	
	
	
	
	
	  @RequestMapping(value="/setting/quit", method=RequestMethod.GET)
	    public String quit(HttpServletRequest request, Model model) {
		  HttpSession session = request.getSession();
			String email = (String) session.getAttribute("username");
			SessionVO svo = memberService.read(email);
			model.addAttribute("svo", svo);
	       
	        return "/mypage/setting/quit";
	    }
	  
	  @PostMapping(value="/setting/quit", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	  public ResponseEntity<String> removeEmail(@RequestBody MemberVO mvo) {
		  ResponseEntity<String> result = null;
		  
		  String putInPwd = mvo.getPassword();
		  SessionVO svo = memberService.read(mvo.getEmail());
		  
		  //입력받은 비밀번호(인코딩x)와 기존 비밀번호(인코딩o)를 비교
		  if(pwencoder.matches(putInPwd, svo.getPassword())) {
			  memberService.quitMember(mvo.getEmail());
			  
			  result = new ResponseEntity<String>("0",HttpStatus.OK);
		  }else{
			  result = new ResponseEntity<String>("1",HttpStatus.OK);
		  }
		  
		  return result != null? result : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	  }

	
	@GetMapping("/setting/report")
	public String report() {
		return "/mypage/setting/report";
	}
	
	@PostMapping("/thumbnailUpdate/{nickname}")
	public String thumbnailUpdate(MemberVO mvo, @RequestParam("profile") MultipartFile profile, @PathVariable String nickname) throws UnsupportedEncodingException {
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
		
		String encodedParam = URLEncoder.encode(nickname, "UTF-8");
		
		return "redirect:/mypage/profile/"+encodedParam;
	}

}
