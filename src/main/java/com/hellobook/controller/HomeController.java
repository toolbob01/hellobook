package com.hellobook.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.LocaleResolver;

import com.hellobook.utility.PageVO;
import com.hellobook.utility.SessionConfig;
import com.hellobook.domain.MemberVO;
import com.hellobook.domain.PostLikeVO;
import com.hellobook.domain.PostVO;
import com.hellobook.domain.ReplyVO;
import com.hellobook.service.MemberService;
import com.hellobook.service.PostService;
import com.hellobook.utility.Criteria;
import com.hellobook.utility.Time;
import com.hellobook.utility.UserSessionVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@AllArgsConstructor
@Log4j
public class HomeController {

	private PostService service;
	private MemberService member_service;
	
	@RequestMapping(value = "/index_test", method = RequestMethod.GET)
	public void index_test(Model model, Criteria cri, HttpServletRequest request) {
		
		int count = service.selectPostCount(cri);
		List<PostVO> post_list = service.selectAllPost(cri);

		for( PostVO postVO : post_list ) {
			int pno = postVO.getPno();
			postVO.setFile_list(service.selectFileByPno(pno)); 	    // Image
			postVO.setReply_list(service.selectThreeReplyByPno(pno));    // Reply
			List<ReplyVO> relpy_list = postVO.getReply_list();
			for( ReplyVO replyVO : relpy_list ) {
				replyVO.setTimer(Time.calculateTime(replyVO.getRepdate())); // Reply's Timer
			}
			postVO.setReply_cnt(relpy_list.size()); 	// Reply Count
			postVO.setLike_list(service.selectLikeByPno(pno)); 		// Like
			postVO.setLike_cnt(postVO.getLike_list().size());   	// Like Count
			postVO.setTimer(Time.calculateTime(postVO.getPdate())); // ex) 5분전 2시간전 3일전
		}

		model.addAttribute("post_list", post_list);
		model.addAttribute("pageVO" , new PageVO(cri, count));
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("username");
		List<MemberVO> friend_list = member_service.selectFriends(email); // Friend List
		model.addAttribute("friend_list", friend_list);

	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, Criteria cri, HttpServletRequest request) {
		int count = service.selectPostCount(cri);
		List<PostVO> post_list = service.selectAllPost(cri);

		for( PostVO postVO : post_list ) {
			int pno = postVO.getPno();
			postVO.setFile_list(service.selectFileByPno(pno)); 	    // Image
			postVO.setReply_list(service.selectThreeReplyByPno(pno));    // Reply
			List<ReplyVO> relpy_list = postVO.getReply_list();
			for( ReplyVO replyVO : relpy_list ) {
				replyVO.setTimer(Time.calculateTime(replyVO.getRepdate())); // Reply's Timer
			}
			postVO.setReply_cnt(relpy_list.size()); 	// Reply Count
			postVO.setLike_list(service.selectLikeByPno(pno)); 		// Like
			postVO.setLike_cnt(postVO.getLike_list().size());   	// Like Count
			postVO.setTimer(Time.calculateTime(postVO.getPdate())); // ex) 5분전 2시간전 3일전
		}

		model.addAttribute("post_list", post_list);
		model.addAttribute("pageVO" , new PageVO(cri, count));
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("username");
		
		List<MemberVO> friend_list = member_service.selectFriends(email); // Friend List
		model.addAttribute("friend_list", friend_list);
		
		List<MemberVO> Recommend_list = member_service.selectRecommendFriends(email); //Recommend List
		model.addAttribute("recommend_list", Recommend_list);
		
		//언어를 담는 locale// 기본은 ja
		String locale = session.getAttribute("org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE") != null?
				session.getAttribute("org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE").toString() : "ja";
		
		//서버 세션에 로그인 중인 사람을 담는 list
		List<UserSessionVO> loginUsers = SessionConfig.loginUserCheck(email);
		model.addAttribute("loginUsers",loginUsers);
		
		//로그아웃 한 유저를 담는 list
		List<UserSessionVO> logoutUsers = SessionConfig.LogoutUserCheck();
		if(logoutUsers != null) {
			for(UserSessionVO logoutUser : logoutUsers) {
				String timer = Time.calculateTime(logoutUser.getLastAccessTime(),locale);
				logoutUser.setTimer(timer);
			}
		}
		model.addAttribute("logoutUsers",logoutUsers);
		return "index";
	}

	@GetMapping("/next")
	@ResponseBody
	public List<PostVO> index_test(Model model, Criteria cri) {
		
		int count = service.selectPostCount(cri);
		List<PostVO> post_list = service.selectAllPost(cri);

		for( PostVO postVO : post_list ) {
			int pno = postVO.getPno();
			postVO.setFile_list(service.selectFileByPno(pno)); 	    // Image
			postVO.setReply_list(service.selectThreeReplyByPno(pno));    // Reply
			List<ReplyVO> relpy_list = postVO.getReply_list();
			for( ReplyVO replyVO : relpy_list ) {
				replyVO.setTimer(Time.calculateTime(replyVO.getRepdate())); // Reply's Timer
			}
			postVO.setReply_cnt(relpy_list.size()); 	// Reply Count
			postVO.setLike_list(service.selectLikeByPno(pno)); 		// Like
			postVO.setLike_cnt(postVO.getLike_list().size());   	// Like Count
			postVO.setTimer(Time.calculateTime(postVO.getPdate())); // ex) 5분전 2시간전 3일전
		}

		return post_list;
	}
	
	@GetMapping("/changelang")
	public @ResponseBody String changeLang() {
		return "success";
	}
}
