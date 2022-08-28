package com.hellobook.controller;

import java.util.ArrayList;
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
	
	@GetMapping("/loginUser")
	public String loginUser(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("username");
		
		//서버 세션에 로그인 중인 사람을 담은 list
		List<String> loginUsers = SessionConfig.loginUserCheck(email);
		model.addAttribute("loginUsers",loginUsers);
		
		//친구를 담는 리스트가 있어야 합니다.
		List<String> friend = new ArrayList<String>();
		friend.add("kumosun@naver.com");
		friend.add("test11@test.com");
		friend.add("test22@test.com");
		friend.add("test33@test.com");
		model.addAttribute("friend",friend);
		
		/*
		 * <c:forEach items="${friend}" var="friend">
				친구 ${friend } 님은 현재 <br>
				<c:choose>
					<c:when test="${fn:contains(loginUsers,friend)}">
						로그인 중입니다. <br>
					</c:when>
					<c:otherwise>
						로그인 중이 아닙니다.<br>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			붙여 넣기 사용
		 * 
		 */
		
		return "loginuser";
	}

}
