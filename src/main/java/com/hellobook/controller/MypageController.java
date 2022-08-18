package com.hellobook.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PostService postService;
	
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
	
//	@GetMapping({"/setting/","/setting/editprofile"})
//	public String editprofile() {
//		return "/mypage/setting/editprofile";
//	}
//	
//	
//
//	
//	
//	@GetMapping("/setting/changepwd")
//	public String changepwd() {
//		return "/mypage/setting/changepwd";
//	}
	
//	@GetMapping("/setting/quit")
//	public String quit() {
//		return "/mypage/setting/quit";
//	}

	@RequestMapping(value={"/setting/","/setting/editprofile"}, method=RequestMethod.GET)
    public String editprofile(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("username");
		SessionVO svo = memberService.read(email);
		model.addAttribute("svo", svo);
		
        return  "/mypage/setting/editprofile";
    }
	
    @RequestMapping(value={"/setting/","/setting/editprofile"}, method=RequestMethod.POST)
    public String editAccount(MemberVO mvo, HttpSession session) throws Exception {
        MemberVO loginUser = (MemberVO) session.getAttribute("check");
        String email = loginUser.getEmail(); //세션에 저장된 사용자 정보로부터 이메일을 알아낸다.
       
        if (mvo.getNickname() == null) {
            mvo.setNickname(loginUser.getNickname());
        }
        if (mvo.getBirth() == null) {
            mvo.setBirth(loginUser.getBirth());
        }
        
        if (mvo.getLanguage() == null) {
            mvo.setLanguage(loginUser.getLanguage());
        }
        
        if (mvo.getSex() == null) {
            mvo.setSex(loginUser.getSex());
        }
        
        if (mvo.getHobby() == null) {
            mvo.setHobby(loginUser.getHobby());
        }
        
              
        mvo.setEmail(email);
        int check = memberService.modify(mvo);
        if (check == 1) {
            session.setAttribute("check",mvo);
        }
       
        return "/mypage/setting/changepwd";
       
    }
   
    @RequestMapping(value="/setting/changepwd", method=RequestMethod.GET)
    public String changePasswd(HttpServletRequest request, Model model) {
    	
    	HttpSession session = request.getSession();
		String email = (String) session.getAttribute("username");
		SessionVO svo = memberService.read(email);
		model.addAttribute("svo", svo);
    	
        return "/mypage/setting/changepwd";
    }
   
    @RequestMapping(value="/setting/changepwd", method=RequestMethod.POST)
    public String changePasswd(String password, HttpSession session) throws Exception {
        String email = ((MemberVO)session.getAttribute("check")).getEmail();
       
        MemberVO mvo = new MemberVO();
        mvo.setEmail(email);
        mvo.setPassword(password);
       
        memberService.changePwd(mvo);
       
        return "/mypage/setting/changepwd";
    }

	
	
	
	
	
	
	
	
	  @RequestMapping(value="/setting/quit", method=RequestMethod.GET)
	    public String quit(HttpServletRequest request, Model model) {
		  HttpSession session = request.getSession();
			String email = (String) session.getAttribute("username");
			SessionVO svo = memberService.read(email);
			model.addAttribute("svo", svo);
	       
	        return "/mypage/setting/quit";
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
