<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<!-- <script type="text/javascript" src="/resources/js/index.js"></script> -->



<div class="container-fluid">
	<div class="container">
		<div class="row post-main-view-row">


<!-- 		<div class="m-5 border border-2 border-dark" style="line-height: 1.5; font-size: 13px;">
			<br><br>
			<p style="font-family: 'Kosugi Maru';">한국어 한글 우리나라말 日本語　ひらがな　カタカナ Kosugi Maru AAA bbb CCC</p>
			<p style="font-family: 'Sawarabi Gothic', sans-serif;">한국어 한글 우리나라말 日本語　ひらがな　カタカナ Sawarabi Gothic AAA bbb CCC</p>
			<p style="font-family: 'Murecho', sans-serif;">한국어 한글 우리나라말 日本語　ひらがな　カタカナ Murecho', sans-serif AAA bbb CCC</p>
			<p style="font-family: 'Nanum Gothic', sans-serif;">한국어 한글 우리나라말 日本語　ひらがな　カタカナ Nanum Gothic', sans-serif AAA bbb CCC</p>
			<p style="font-family: 'Inconsolata';">한국어 한글 우리나라말 日本語　ひらがな　カタカナ Inconsolata AAA bbb CCC</p>
			<p style="font-family: 'Nunito', sans-serif;">한국어 한글 우리나라말 日本語　ひらがな　カタカナ Nunito', sans-serif AAA bbb CCC</p>
			<p style="font-family: 'Noto Sans KR';">한국어 한글 우리나라말 日本語　ひらがな　カタカナ Nunito', sans-serif AAA bbb CCC</p>
			<br><br>
			<span style="font-family: 'Nanum Gothic', sans-serif;">한국어 한글 우리나라말</span>
			<span style="font-family: 'Sawarabi Gothic', sans-serif;">日本語　ひらがな　カタカナ</span>
			<span style="font-family: 'Sawarabi Gothic', sans-serif;"> english English AAA bbb CCC</span>
			<br><br>
			<span style="font-family: 'Noto Sans KR';">한국어 한글 우리나라말</span>
			<br><br>
			<span style="font-family: 'Nanum Gothic', sans-serif;">한국어 한글 우리나라말</span>
			<span style="font-family: 'Sawarabi Gothic', sans-serif;">日本語　ひらがな　カタカナ</span>
			<span style="font-family: 'Nunito', sans-serif;"> english English AAA bbb CCC</span>
			<br><br>
			<span style="font-family: 'Nanum Gothic', sans-serif;">한국어 한글 우리나라말</span>
			<span style="font-family: 'Sawarabi Gothic', sans-serif;">日本語　ひらがな　カタカナ</span>
			<span style="font-family: 'Noto Sans KR';"> english English AAA bbb CCC</span>
			<br><br>
		</div> -->
			
			<!-- post -->
			<div class="col-lg-7">
				<div class="row post-box" id="post-box">
				  
				  <c:choose>
				  <c:when test="${post_list[0] != null}">
				    <c:set var="idx" value="1"/> <!-- id 식별용 idx -->
					<c:forEach var="postVO" items="${post_list}">
					<article class="contents">
						<!-- post 헤더 -->
						<header class="top post-header">
							<div class="user_container" onclick="location.href='#'">
								<div class="profile_img">
									<img src="/hello_img/member/${postVO.profile}" alt="프로필이미지">
								</div>
								<div class="profile_flag">
									<c:choose>
									  <c:when test="${postVO.language eq 'J'}">
									  	<img class="flag_icon" src="https://img.icons8.com/color/25/000000/japan-circular.png"/>
									  </c:when>
									  <c:otherwise>
									    <img class="flag_icon" src="https://img.icons8.com/color/25/000000/south-korea-circular.png"/>
									  </c:otherwise>
									</c:choose>
								</div>
								<div class="user_name">
									<div class="nick_name m_text">${postVO.nickname}</div>
									<div class="mt-1 s_text">東京, 日本</div>
								</div>
							</div>
<!-- 							<div class="sprite_more_icon" data-name="more" onclick="location.href='#'"></div> -->
								<sec:authorize access="isAuthenticated()">
								     <c:if test="${postVO.email eq username}">
										<div class="updateDeleteDiv">
											<span class="updateDeleteContent">
												<span class="updateLink" data-pno="${postVO.pno}">게시물 수정</span>
												| 
												<span class="deleteLink" data-pno="${postVO.pno}">게시물 삭제</span>
											</span>
										</div>
								     </c:if>
								</sec:authorize>
						</header>

						<!-- post 바디(이미지나 동영상 등 내용 입력 -->
						<div class="img_section">
							<div class="trans_inner">
								<div id="carousel${postVO.pno}" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">
								  <div class="carousel-inner">
								    <div class="carousel-item active">
								      <img src="/hello_img/post/${postVO.file_list[0].uuid}" alt="...">
								    </div>
								    <c:forEach var="fileVO" items="${postVO.file_list}" begin="1">
									    <div class="carousel-item">
									      <img src="/hello_img/post/${fileVO.uuid}" alt="...">
									    </div>
								    </c:forEach>
								  </div>
								  <button class="carousel-control-prev" type="button" data-bs-target="#carousel${postVO.pno}" data-bs-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Previous</span>
								  </button>
								  <button class="carousel-control-next" type="button" data-bs-target="#carousel${postVO.pno}" data-bs-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Next</span>
								  </button>
								</div>
							</div>
						</div>

						<!-- post 아이콘(좋아요, 댓글, 공유 // 책갈피 기능) -->
						<div class="bottom_icons">
							<div class="left_icons">
						        <c:set var="contain" value="n"/>
						        <c:forEach var="like" items="${postVO.like_list}">
						          <c:if test="${like.email eq username}">
						            <c:set var="contain" value="y"/>
						          </c:if>
						        </c:forEach>
						        <c:choose>
						          <c:when test="${contain eq 'y'}">
						            <div class="sprite_heart_icon_outline on on_cursor heart-btn" data-heart="y" data-pno="${postVO.pno}" data-name="heartbeat"></div>
						          </c:when>
						          <c:otherwise>
						            <div class="sprite_heart_icon_outline on_cursor heart-btn" data-heart="n" data-pno="${postVO.pno}" data-name="heartbeat"></div>
						          </c:otherwise>
						        </c:choose>
								
								<span class="heart-count on_cursor" id="heart-count${postVO.pno}">
									${postVO.like_cnt} 명이 좋아합니다
								</span>
							</div>
							<div class="right_icon">
<!-- 							<div class="sprite_bubble_icon"></div> -->
								<div class="sprite_share_icon on_cursor" data-name="share"></div>
							</div>
						</div>

						<div class="posting-master">
							<p class="posting-master-name">${postVO.nickname}</p>
							<div class="posting-master-content">
								<c:out value="${postVO.content}"/>
							</div>
						</div>

						<div class="timer">
							${postVO.timer}
						</div>

						<!-- post 댓글 div -->
						<div class="comment_container">
							<c:forEach var="replyVO" items="${postVO.reply_list}" begin="0" end="2">
								<div class="comment">
									<div class="nick_name">${replyVO.nickname}</div>
									<div class="real_comment">
										<c:out value="${replyVO.rcontent}"/>
									</div>
								</div>
							</c:forEach>
							<div class="more-comment-div">
								<span class="more-comment" data-pno="${postVO.pno}">...</span>
							</div>
						</div>
					</article>
					<c:set var="idx" value="${idx + 1}"/>
					</c:forEach>
				  </c:when>
				  <c:otherwise>
				  	<div class="text-center fs-3 mt-5">
				  		No Post ...
				  		<p class="fs-5 mt-3" style="line-height: 1.5;">
				  			-> post_write -> 포스팅 추가 <br>
				  			-> Index에서 방금 작성한 포스팅 확인 <br>
				  			<br>
				  			... 버튼 클릭시 모달 작동 <br>
				  			-> 댓글 입력 후 모달댓글창에 추가되는지 확인<br>
				  			-> 오라클에서 depth 값 2로 입력해서 더미 대댓글 추가<br>
				  			-> 모달창 대댓글 펼치기/접기 버튼 확인 <br>
				  		</p>

				  		<p style="line-height: 1.5; text-align: left; font-size: 15px;">
				  			<br><br><br><br>
			  				로그인 된 유저 정보를 잘 받아오는가 확인<br>
			  				==================================================================<br>
				  			<sec:authentication property="principal"/><br>
				  			==================================================================<br>
				  			principal.Username = <sec:authentication property="principal.Username"/><br>
				  			$Nname = ${Nname }<br>
				  			$username = ${username }<br>
				  			<br><br>
				  			January <span style="font-size: 12px;">한국어한국어한국어한국어 한국어한국어한국어한국어</span><br>
				  			February <span style="font-size: 12px;">한국어한국어한국어한국어 한국어한국어한국어한국어</span><br>
				  			March <span style="font-size: 12px;">한국어한국어한국어한국어한국어 한국어한국어한국어</span><br>
				  			April <span style="font-size: 12px;">englishENGLISHenglish ENGLISHenglishENGLISH</span><br>
				  			June <span style="font-size: 12px;">ENGLISHenglish ENGLISHenglishENGLISH</span><br>
				  			July <span style="font-size: 12px;">englishENGLISHenglish ENGLISHenglishENGLISH</span><br>
				  			October <span style="font-size: 12px;">ひらがなカタカナ漢字　ひらがなカタカナ漢字</span><br>
				  			September <span style="font-size: 12px;">漢字　ひらがなカタカナ漢字</span><br>
				  			August <span style="font-size: 12px;">カタカナ漢字　ひらがなカタカナ漢字</span><br>
				  			십일월 <span style="font-size: 12px;">한글한글한글</span><br>
				  			십이월 <span style="font-size: 12px;">english english ENGLISH</span><br>
				  			십삼월 <span style="font-size: 12px;">ひらがなカタカナ漢字　ひらがなカタカナ漢字</span><br>
				  			<br><br><br>
				  		</p>

				  	</div>
				  </c:otherwise>
				  </c:choose>

				</div> <!-- // post-box -->
				<p id="msg-loading">....... 次のデータをローディング中 .......</p>
			</div> <!-- // col-lg-7 -->
			


			<div class="col-md-3" align="center">
				<div class="side_box sticky-side my-5">
					
					<article class="story">
						<header class="story_header">
							<div>친구 리스트</div>
							<div class="sprite_more_icon" data-name="more" onclick="location.href='/friend/list'"></div>
						</header>

					  <c:choose>
						<c:when test="${friend_list[0] != null}">
						<c:forEach var="friendVO" items="${friend_list}">
							<div class="scroll_inner">
								<div class="thumb_user">
									<div class="profile_thumb" onclick="location.href='#'">
										<img class="profile_img_side" src="/hello_img/member/${friendVO.profile}" alt="프로필사진">
										<c:choose>
										  <c:when test="${friendVO.language eq 'J'}">
										    <div class="profile_flag_side"><img src="https://img.icons8.com/color/22/000000/japan-circular.png"/></div>
										  </c:when>
										  <c:otherwise>
										    <div class="profile_flag_side"><img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/></div>
										  </c:otherwise>
										</c:choose>
									</div>
	
									<div class="detail">
										<div class="id" onclick="location.href='#'">${friendVO.nickname}</div>
										<div class="time">
											<div class="online-circle"></div>
											<span class="time-status">온라인</span>
<!-- 											<div class="offline-circle"></div> -->
<!-- 											<span class="time-status">1시간 전</span> -->
										</div>
									</div>
									
									<div class="msg-link">
										<i class="bi bi-chat-dots" onclick="location.href='#'"></i>
									</div>
								</div>
							</div>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="no_friend">
								<p>아직 친구가 없습니다</p>
							</div>
						</c:otherwise>
					  </c:choose>
					</article>

					<article class="recommend">
						<header class="reco_header">
							<div>친구 추천</div>
<!-- 							<div class="more">모두 보기</div> -->
							<div class="sprite_more_icon" data-name="more" onclick="location.href='#'"></div>
						</header>

						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb">
									<img class="profile_img_side" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="profile_flag_side"><img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/></div>
								</div>

								<div class="detail">
									<div class="id">아직구현X</div>
									<div class="time">
										<div class="online-circle"></div>
										<span class="time-status">온라인</span>
									</div>
								</div>
								
								<div class="msg-link">
									<i class="bi bi-plus-lg" onclick="location.href='#'"></i>
								</div>
							</div>
						</div>
					</article>
				</div> <!-- side_box -->
			</div> <!-- col-md-3 -->


			<!-- Pagination -->
			<div class="pagination">
			    <a class="prevPage" href="/?pageNum=${pageVO.cri.pageNum - 1}&amount=${pageVO.cri.amount}&type=${pageVO.cri.type}&keyword=${pageVO.cri.keyword}"></a> 
			
			    <c:forEach var="num" begin="${pageVO.startPage}" end="${pageVO.endPage}">
				  <a href="/?pageNum=${num}&amount=${pageVO.cri.amount}&type=${pageVO.cri.type}&keyword=${pageVO.cri.keyword}"></a> 			
			    </c:forEach>
			  
			    <a class="nextPage" href="/?pageNum=${pageVO.cri.pageNum + 1}&amount=${pageVO.cri.amount}&type=${pageVO.cri.type}&keyword=${pageVO.cri.keyword}"></a> 
			</div>


		</div> <!-- post-main-view-row -->
	</div> <!-- container -->
</div> <!-- container-fluid -->


<div class="modal-background">
	<div class="closeModalBtnDiv">
		<span class="closeModalBtn fs-5 text-white on_cursor">X</span>
	</div>

	<div class="modal-detail">
		<div class="container-fluid">
			<div class="row">
			
				<div class="col-md-7 p-0">
					<div class="modal-detail-left d-flex flex-column">
						<div class="trans_inner">
							<div id="carousel-modal1" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">
							  <div class="carousel-inner" id="carousel-inner">
<!-- 							    <div class="carousel-item active"> -->
<!-- 							      <img src="/resources/imgs/long.jpg" alt="..."> -->
<!-- 							    </div> -->
<!-- 							    <div class="carousel-item"> -->
<!-- 							      <img src="/resources/imgs/img_section/img01.jpg" alt="..."> -->
<!-- 							    </div> -->
							  </div>
							  <button class="carousel-control-prev" type="button" data-bs-target="#carousel-modal1" data-bs-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Previous</span>
							  </button>
							  <button class="carousel-control-next" type="button" data-bs-target="#carousel-modal1" data-bs-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Next</span>
							  </button>
							</div>
						</div>
						<div class="modal-detail-contents">
							<div class="posting-master">
								<div class="comment-profile d-flex">
<!-- 									<img class="comment-profile-img on_cursor" src="/resources/imgs/thumb02.jpg" alt="프로필사진"> -->
<!-- 									<div class="comment-profile-flag"> -->
<!-- 										<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/> -->
<!-- 									</div> -->
<!-- 									<div class="comment-name on_cursor align-self-center">Hanulso</div> -->
<!-- 									<div class="comment-time align-self-center mx-5">1시간 전</div> -->
								</div>
								
								<div class="modal-posting-master-content">
									<!-- Post Content 내용 -->
								</div>
							</div>
						</div>
					</div>
				</div> <!-- / col-md-7 -->
				
				<div class="col-md-5 p-0">
					<div class="modal-detail-right">
						<div class="all-comment">		
							<!-- <p class="fs-5 mb-3">댓글 리스트</p>

							<div class="comment-profile d-flex">
								<img class="comment-profile-img on_cursor" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
								<div class="comment-profile-flag">
									<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>
								</div>
								<div class="comment-name on_cursor align-self-center">Hanulso</div>
								<div class="comment-time align-self-center mx-5">17분전</div>
								<div class="comment-cocoment align-self-center">답글 달기</div>
							</div>
							<div class="comment-content">
								하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 

								<div class="comment-accordion on_cursor mt-3 ms-3" data-bs-toggle="collapse" data-bs-target="#haveToInputRno" aria-expanded="false">
									<i class="bi bi-arrow-return-right fs-5"></i>
									<span class="cocoment-open ms-3" data-oc="c">펼치기</span>
								</div>
								<div class="collapse" id="haveToInputRno">
									<div class="comment-depth">
										<div class="comment-profile d-flex">
											<img class="comment-profile-img on_cursor" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
											<div class="comment-profile-flag">
												<img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/>
											</div>
											<div class="comment-name on_cursor align-self-center">Hanulso</div>
											<div class="comment-time align-self-center mx-5">17분전</div>
										</div>
										<div class="comment-content">
											<span class="hashTag" onclick="location.href='#'">@JSHanulso</span>
											장수하늘소는 딱정벌레 종류의 곤충 중에서 가장 크며 중국 만주 동북부, 시베리아 우수리 지방 및 우리나라 경기도 광릉지역 등에 분포하고 있다.
										</div>
									</div>
									<div class="comment-depth">
										<div class="comment-profile d-flex">
											<img class="comment-profile-img on_cursor" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
											<div class="comment-profile-flag">
												<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>
											</div>
											<div class="comment-name on_cursor align-self-center">Hanulso</div>
											<div class="comment-time align-self-center mx-5">17분전</div>
										</div>
										<div class="comment-content">
											<span class="hashTag" onclick="location.href='#'">@JSHanulso</span>
											장수하늘소는 딱정벌레 종류의 곤충 중에서 가장 크며 중국 만주 동북부, 시베리아 우수리 지방 및 우리나라 경기도 광릉지역 등에 분포하고 있다.
										</div>
									</div> -->
								<!-- </div> --> <!-- / commment-depth-all -->
							<!-- </div> --> <!-- / comment-content -->
						</div> <!-- / all-comment -->
						
						<div class="comment-write-div">
							<span class="fs-5 mb-3">댓글 작성</span>
		                    <button class="msg_send_btn float-end" type="button" data-pno="">
		                       <i class="fa fa-paper-plane-o" aria-hidden="true"></i>
		                    </button>
							<div class="form-floating">
							  <textarea class="form-control" placeholder="Leave a comment here" id="commentInsert"></textarea>
							</div>
						</div>
						
					</div>
				</div> <!-- / col-md-5 -->
				
			</div>
		</div>
	</div>
</div>

<div class="modal-background2">
	<div class="closeModalBtnDiv2">
		<span class="closeModalBtn2 fs-5 text-white on_cursor">X</span>
	</div>

	<div class="modal-detail2">
		<div class="container-fluid">
			<div class="row">
				
				좋아요를 누른 회원 리스트

			</div>
		</div>
	</div>
</div>
<!-- /Modal Test -->

<script>
 
    // Post CRUD Alert Script
	$(document).ready(function() {
		
		var insert_post_result = "${insert_post_result}";
		var insert_pno = "${insert_pno}";
		if( insert_post_result != null && insert_post_result != "" && !history.state ){
			if( parseInt(insert_post_result) == 1 ){
				alert('Insert Post Success ! ( ' + insert_pno + ' 번 게시글 )');
			}else{
				alert('Insert Post Fail ! ');
			}
		}
		var request_file_count = "${request_file_count}";
		var insert_file_result = "${insert_file_result}";
		if( request_file_count != null && request_file_count != "" && insert_file_result != null && insert_file_result != "" && !history.state ){
			if( parseInt(request_file_count) != parseInt(insert_file_result) ){
				alert('Insert Image file Fail ! ( ' + insert_file_result + ' / ' + request_file_count + ' )');
			}
		}
		var delete_result = "${delete_result}";
		var delete_pno = "${delete_pno}";
		if( delete_result != null && delete_result != "" && delete_pno != null && delete_pno != "" && !history.state ){
			if( parseInt(delete_result) == 1 ) {
				alert('Delete Post Success ! ( ' + delete_pno + ' 번 게시글 )');
			}else {
				alert('Delete Post Fail ! ( ' + delete_pno + ' 번 게시글 )');
			}
		}
		var update_result = "${update_result}";
		var update_pno = "${update_pno}";
		if( update_result != null && update_result != "" && update_pno != null && update_pno != "" && !history.state ){
			if( parseInt(update_result) == 1 ) {
				alert('Update Post Success ! ( ' + update_pno + ' 번 게시글 )');
			}else {
				alert('Update Post Fail ! ( ' + update_pno + ' 번 게시글 )');
			}
		}
		history.replaceState({},null,null);
	})

	// original Template Script
/*  	onclick = function deligationFunc(e) {
		let elem = e.target;
		if(elem.getAttribute('data-name') == null){
			elem = null;
			return;
		}
		if (elem.matches('[data-name="heartbeat"]')) {
			console.log("하트");
		} else if (elem.matches('[data-name="bookmark"]')) {
			console.log("북마크");
		} else if (elem.matches('[data-name="share"]')) {
			console.log("공유");
		} else if (elem.matches('[data-name="commentheart"]')) {
			console.log("코멘트하트");
		}
		if (elem.matches('[data-name="more"]')) {
			console.log("더보기");
		}

		elem.classList.toggle('on');
	} */
	
	// Click heart-btn -> By status of data-heart, Adding or Removing user in like_list
	$(document).on("click", ".heart-btn" ,function(e) {
		var heart_stat = $(this).data("heart");
		var heart_user = '${username}';
		var heart_pno = $(this).data("pno");
		if( heart_stat == 'y' ) {
			$(this).data("heart", "n");
			$(this).removeClass("on");
			e.preventDefault();
			$.ajax({
				type:"get",
				url:"/post/like_delete?email=" + heart_user + "&pno=" + heart_pno,
				dataType:"json",
				success:function(data){
					$("#heart-count" + heart_pno).html(data + " 명이 좋아합니다");
				}, error:function(){
					alert("Error - Like Delete");
				}
			})
		}else {
			$(this).data("heart", "y");
			$(this).addClass("on");
			e.preventDefault();
			$.ajax({
				type:"get",
				url:"/post/like_add?email=" + heart_user + "&pno=" + heart_pno,
				dataType:"json",
				success:function(data){
					$("#heart-count" + heart_pno).html(data + " 명이 좋아합니다");
				}, error:function(){
					alert("Error - Like Add");
				}
			})
		}
	})
	
	// Side Bar - Hover
	$(".thumb_user").hover(function(){
		$(this).css("background-color", "rgb(204 204 204 / 19%)");
		$(this).children('.msg-link').css("display","block");
	},function(){
		$(this).css("background-color", "#ffffff");
		$(this).children('.msg-link').css("display","none");
	})
	
	// Modal - Detail
	$(document).on("click", ".more-comment" ,function(e) {
		var nowPno = $(this).data("pno");
		e.preventDefault();
		// AJAX action
		$.ajax({
			type:"get",
			url:"/post/post_detail_modal?pno=" + nowPno,
			dataType:"json",
			success:function(postVO){
				console.log(postVO);
				console.log(postVO.file_list);
				// carousel main
				$("#carousel-inner").append('<div class="carousel-item active">' + 
														      			'<img src="/hello_img/post/' + postVO.file_list[0].uuid + '" alt="...">' + 
															    	'</div>');
				// carousel each from index 1 ~
				if( postVO.file_list[1] != null ) {
					$.each(postVO.file_list, function(i, fileVO){
						if(i>0) {
							$("#carousel-inner").append('<div class="carousel-item">' + 
								      						'<img src="/hello_img/post/' + fileVO.uuid + '" alt="...">' + 
								    					'</div>');
						}
					})
				}
				// Profile    
				if( postVO.language == 'J' ){
					$(".modal-detail-contents .comment-profile").append('<img class="comment-profile-img on_cursor" src="/hello_img/member/' + postVO.profile + '" alt="프로필사진">' + 
																		'<div class="comment-profile-flag">' + 
																			'<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>' +  
																		'</div>' + 
																		'<div class="comment-name on_cursor align-self-center">' + postVO.nickname + '</div>' + 
																		'<div class="comment-time align-self-center mx-5">' + postVO.timer + '</div>');
				}else {
					$(".modal-detail-contents .comment-profile").append('<img class="comment-profile-img on_cursor" src="/hello_img/member/' + postVO.profile + '" alt="프로필사진">' + 
																		'<div class="comment-profile-flag">' + 
																			'<img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/>' + 
																		'</div>' + 
																		'<div class="comment-name on_cursor align-self-center">' + postVO.nickname + '</div>' + 
																		'<div class="comment-time align-self-center mx-5">' + postVO.timer + '</div>');
				}
				// Post Content
				$(".modal-posting-master-content").html(postVO.content);
				// Comment List
 				$(".all-comment").append('<p class="fs-5 mb-3">댓글 리스트</p>');
				if( postVO.reply_list[0] == null ) {
					$(".all-comment").append('<p class="fs-6 text-center mt-5">아직 댓글이 없습니다.</p>');
				}else {
					$.each(postVO.reply_list, function(i, replyVO){
		 				$(".all-comment").append('<div class="comment-profile d-flex" id="comment-profile' + replyVO.repno + '"></div>' + 
	    				 						 '<div class="comment-content" id="comment-content' + replyVO.repno + '"></div>');
						if( replyVO.language == 'J' ) {
							$(".all-comment #comment-profile"+replyVO.repno).append('<img class="comment-profile-img on_cursor" src="/hello_img/member/' + replyVO.profile + '" alt="프로필사진">' + 
																	  '<div class="comment-profile-flag">' + 
																	      '<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>' + 
															    	  '</div>' + 
															    	  '<div class="comment-name on_cursor align-self-center">' + replyVO.nickname + '</div>' + 
															    	  '<div class="comment-time align-self-center mx-5">' + replyVO.timer + '</div>' + 
															    	  '<div class="comment-cocoment align-self-center">답글 달기</div>');
						}else {
							$(".all-comment #comment-profile"+replyVO.repno).append('<img class="comment-profile-img on_cursor" src="/hello_img/member/' + replyVO.profile + '" alt="프로필사진">' + 
																	  '<div class="comment-profile-flag">' + 
																	      '<img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/>' + 
															    	  '</div>' + 
															    	  '<div class="comment-name on_cursor align-self-center">' + replyVO.nickname + '</div>' + 
															    	  '<div class="comment-time align-self-center mx-5">' + replyVO.timer + '</div>' + 
															    	  '<div class="comment-cocoment align-self-center">답글 달기</div>');
						}
						$(".all-comment #comment-content"+replyVO.repno).html(replyVO.rcontent);
						// Open&Close coComent script use id="collapse + replyVO.repno"
  	 					if( replyVO.cocomment_list[0] != null ){
							$(".all-comment #comment-content"+replyVO.repno).append('<div class="comment-accordion on_cursor mt-3 ms-3" data-bs-toggle="collapse" data-bs-target="#collapse' + replyVO.repno + '" aria-expanded="false">' + 
																	      				'<i class="bi bi-arrow-return-right fs-5"></i>' + 
																	      				'<span class="cocoment-open ms-3" data-oc="c">펼치기</span>' + 
																      				'</div>');
							$(".all-comment #comment-content"+replyVO.repno).append('<div class="collapse" id="collapse' + replyVO.repno + '"></div>');
 							$.each(replyVO.cocomment_list, function(k, cocommentVO) {
								if( cocommentVO.language == 'J' ){
									$(".all-comment #collapse" + replyVO.repno).append('<div class="comment-depth">' + 
																				         '<div class="comment-profile d-flex">' + 
																				           '<img class="comment-profile-img on_cursor" src="/hello_img/member/' + cocommentVO.profile + '" alt="프로필사진">' + 
																				           '<div class="comment-profile-flag">' + 
																			                 '<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>' + 
																				           '</div>' + 
																				           '<div class="comment-name on_cursor align-self-center">' + cocommentVO.nickname + '</div>' + 
																				           '<div class="comment-time align-self-center mx-5">' + cocommentVO.timer + '</div>' + 
																				         '</div>' + 
																				         '<div class="comment-content">' + 
																				         	cocommentVO.rcontent +
																				         '</div>' + 
																				       '</div>');
								}else {
									$(".all-comment #collapse" + replyVO.repno).append('<div class="comment-depth">' + 
																			     '<div class="comment-profile d-flex">' + 
																			       '<img class="comment-profile-img on_cursor" src="/hello_img/member/' + cocommentVO.profile + '" alt="프로필사진">' + 
																			       '<div class="comment-profile-flag">' + 
																		             '<img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/>' + 
																			       '</div>' + 
																			       '<div class="comment-name on_cursor align-self-center">' + cocommentVO.nickname + '</div>' + 
																			       '<div class="comment-time align-self-center mx-5">' + cocommentVO.timer + '</div>' + 
																			     '</div>' + 
																			     '<div class="comment-content">' + 
																			     	cocommentVO.rcontent +
																			     '</div>' + 
																			   '</div>');
								}
 							})
						}  
					}) // each
				} // reply_list[0] else
				
				// Comment Write Div's data-pno
				$(".comment-write-div .msg_send_btn").data("pno", postVO.pno);
				// Display Block
				$(".modal-background").css("display","block");
			}, error:function(){
				alert("Error - Post Detail Up");
			}
		})
	})
	
	// Click 'background' to make display none
	$(document).mouseup(function (e){
		var modal = $(".modal-background");
		if( modal.has(e.target).length === 0){
			$(".modal-background").css('display','none');
			$("#carousel-inner").empty();
			$(".modal-detail-contents .comment-profile").empty();
			$(".modal-posting-master-content").html("");
			$(".all-comment").empty();
			$("#commentInsert").val("");
		}
	});
	
	// Click 'X' in Detail Modal to make display none
	 $('.closeModalBtn').on('click', function(){
		 $('.modal-background').css("display", "none");  
		 $("#carousel-inner").empty();
		 $(".modal-detail-contents .comment-profile").empty();
		 $(".modal-posting-master-content").html("");
		 $(".all-comment").empty();
		 $("#commentInsert").val("");
	 });
	
	
	// Coment Insert
	$(".msg_send_btn").on("click", function(e){		
		e.preventDefault();
		var pno = $(this).data("pno");
		var email = '${username}';
		var rcontent = $("#commentInsert").val();
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		if( rcontent == "" ) {
			alert('댓글 내용을 작성해주세요.');
		}else {
			// AJAX action
			if( !confirm('댓글을 작성하시겠습니까?') ) {
				$("#commentInsert").val(""); 
				return ; 
			}
			$.ajax({
				type:"post",
				url:"/post/comment_insert",
				dataType:"json",
				data : {
					pno : pno,
					email : email,
					rcontent : rcontent
				},
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				success:function(data){
					if( data.depth == '2' ) {
						console.log(data);
						alert('This is Depth 2 coment !!!');
					}else {
						// if depth : 1
						$(".all-comment > p").remove();
 		 				$(".all-comment").prepend('<p class="fs-5 mb-3">댓글 리스트</p>' + 
 		 										 '<div class="comment-profile d-flex" id="comment-profile' + data.repno + '"></div>' + 
		 						 				 '<div class="comment-content" id="comment-content' + data.repno + '"></div>');
						if( data.language == 'J' ) {
							$(".all-comment #comment-profile"+data.repno).append('<img class="comment-profile-img on_cursor" src="/hello_img/member/' + data.profile + '" alt="프로필사진">' + 
																	  '<div class="comment-profile-flag">' + 
																	      '<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>' + 
															    	  '</div>' + 
															    	  '<div class="comment-name on_cursor align-self-center">' + data.nickname + '</div>' + 
															    	  '<div class="comment-time align-self-center mx-5">' + data.timer + '</div>' + 
															    	  '<div class="comment-cocoment align-self-center">답글 달기</div>');
						}else {
							$(".all-comment #comment-profile"+data.repno).append('<img class="comment-profile-img on_cursor" src="/hello_img/member/' + data.profile + '" alt="프로필사진">' + 
																	  '<div class="comment-profile-flag">' + 
																	      '<img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/>' + 
															    	  '</div>' + 
															    	  '<div class="comment-name on_cursor align-self-center">' + data.nickname + '</div>' + 
															    	  '<div class="comment-time align-self-center mx-5">' + data.timer + '</div>' + 
															    	  '<div class="comment-cocoment align-self-center">답글 달기</div>');
						}
						$(".all-comment #comment-content"+data.repno).html(data.rcontent);
					}
					$("#commentInsert").val("");
				}, error:function(){
					alert("Error - Comment Insert ! ");
				}
			})
		}
	})
	
	// coComment Open Close
	$(document).on("click",".cocoment-open",function() {
		if( $(this).data("oc") == 'c' ){
			$(this).data("oc", "o")
			$(this).html("접기");
		}else {
			$(this).data("oc", "c")
			$(this).html("펼치기");
		}
	})

	// Post Update
	$(document).on("click",".updateLink",function() {
		var updatePno = $(this).data("pno");
		var updateUser = '${username}';
		if( confirm(updatePno + " 번 게시물을 수정하시겠습니까?") ) {
			location.href = '/post/post_update?pno=' + updatePno + '&email=' + updateUser;
		}
	})
	// Post Delete
	$(document).on("click",".deleteLink",function() {
		var deletePno = $(this).data("pno");
		var deleteUser = '${username}';
		if( confirm(deletePno + " 번 게시물을 삭제하시겠습니까?") ) {
			location.href = '/post/post_delete?pno=' + deletePno + '&email=' + deleteUser;
		}
	})
	
	// Infinity Scroll
	var totalRow = parseInt('${pageVO.total}');
	var realEnd = parseInt('${pageVO.realEnd}');
	var pageNum = parseInt('${pageVO.cri.pageNum}');
	var amount = parseInt('${pageVO.cri.amount}'); 
	var type = '${pageVO.cri.type}'; 
	var keyword = '${pageVO.cri.keyword}'; 
	const msgLoading = document.getElementById("msg-loading");
	
	console.log("total : " + totalRow);
	console.log("pageNum : " + pageNum);
	console.log("realEnd : " + realEnd);
	console.log("amount : " + amount);
	console.log("type : " + type);
	console.log("keyword : " + keyword);
    
    // 데이터 추가 함수
    function addData(nextPage) { 
		$.ajax({
			type:"get",
			url:"/next?pageNum=" + nextPage + "&amount=" + amount + "&type=" + type + "&keyword=" + keyword,
			dataType:"json",
			success:function(post_list){
				var contain = 'n';
				$.each(post_list, function(postVO_i, postVO){
					let nextArticle = 
'<article class="contents post-fade-in">' + 
	'<!-- post 헤더 -->' + 
	'<header class="top post-header">' + 
		'<div class="user_container" onclick="location.href=\'#\'">' + 
			'<div class="profile_img">' + 
				'<img src="/hello_img/member/' + postVO.profile + '" alt="프로필이미지">' + 
			'</div>' + 
			'<div class="profile_flag">';
					if ( postVO.language == 'J' ) {
						nextArticle += '<img class="flag_icon" src="https://img.icons8.com/color/25/000000/japan-circular.png"/>';
					}else if ( postVO.language == 'K' ) {
						nextArticle += '<img class="flag_icon" src="https://img.icons8.com/color/25/000000/south-korea-circular.png"/>';
					}
					nextArticle += 
			'</div>' + 
			'<div class="user_name">' + 
				'<div class="nick_name m_text">' + postVO.nickname + '</div>' + 
				'<div class="mt-1 s_text">東京, 日本</div>' + 
			'</div>' + 
		'</div>'; 
					if ( postVO.email == '${username}' ) {
						nextArticle += 
		'<div class="updateDeleteDiv">' + 
			'<span class="updateDeleteContent">' + 
				'<span class="updateLink" data-pno="' + postVO.pno + '">게시물 수정</span>' + 
				'|' +  
				'<span class="deleteLink" data-pno="' + postVO.pno + '">게시물 삭제</span>' + 
			'</span>' + 
		'</div>';
					}
					nextArticle += 
	'</header>' + 
	'<!-- post 바디(이미지나 동영상 등 내용 입력 -->' + 
	'<div class="img_section">' + 
		'<div class="trans_inner">' + 
			'<div id="carousel' + postVO.pno + '" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">' + 
			  '<div class="carousel-inner">' + 
			    '<div class="carousel-item active">' + 
			      '<img src="/hello_img/post/' + postVO.file_list[0].uuid + '" alt="...">' + 
			    '</div>'; 
			    	if( postVO.file_list[1] != null ) {
			    		for( var file_i in postVO.file_list ) {
			    			if( file_i != 0 ) {
			    				nextArticle += 
			    '<div class="carousel-item">' + 
			      '<img src="/hello_img/post/' + postVO.file_list[file_i].uuid + '" alt="...">' + 
			    '</div>';
			    			}
			    		}
			    	}
			    	nextArticle += 
			  '</div>' + 
			  '<button class="carousel-control-prev" type="button" data-bs-target="#carousel' + postVO.pno + '" data-bs-slide="prev">' + 
			    '<span class="carousel-control-prev-icon" aria-hidden="true"></span>' + 
			    '<span class="visually-hidden">Previous</span>' + 
			  '</button>' + 
			  '<button class="carousel-control-next" type="button" data-bs-target="#carousel' + postVO.pno + '" data-bs-slide="next">' + 
			    '<span class="carousel-control-next-icon" aria-hidden="true"></span>' + 
			    '<span class="visually-hidden">Next</span>' + 
			  '</button>' + 
			'</div>' + 
		'</div>' + 
	'</div>' + 
	'<!-- post 아이콘(좋아요, 댓글, 공유 // 책갈피 기능) -->' + 
	'<div class="bottom_icons">' + 
		'<div class="left_icons">';
					var like_user = '${username}';
					for( var like_i in postVO.like_list ) {
						if( postVO.like_list[like_i].email == like_user ) {
							contain = 'y';
						}
					}
					
					if( contain == 'y' ) {
						nextArticle += 
			'<div class="sprite_heart_icon_outline on on_cursor heart-btn" data-heart="y" data-pno="' + postVO.pno + '" data-name="heartbeat"></div>'; 
					} else {
						nextArticle += 
			'<div class="sprite_heart_icon_outline on_cursor heart-btn" data-heart="n" data-pno="' + postVO.pno + '" data-name="heartbeat"></div>';
					}
					contain = 'n';
					nextArticle += 			
			'<span class="heart-count on_cursor" id="heart-count' + postVO.pno + '">' + 
				postVO.like_cnt + ' 명이 좋아합니다' + 
			'</span>' + 
		'</div>' + 
		'<div class="right_icon">' + 
			'<div class="sprite_share_icon on_cursor" data-name="share"></div>' + 
		'</div>' + 
	'</div>' + 

	'<div class="posting-master">' + 
		'<p class="posting-master-name">' + postVO.nickname + '</p>' + 
		'<div class="posting-master-content">' + 
			postVO.content + 
		'</div>' + 
	'</div>' + 
	'<div class="timer">' + 
		postVO.timer + 
	'</div>' + 
	'<!-- post 댓글 div -->' + 
	'<div class="comment_container">';
					for( var relpy_i in postVO.reply_list ) {
						nextArticle += 
		'<div class="comment">' + 
			'<div class="nick_name">' + postVO.reply_list[relpy_i].nickname + '</div>' + 
			'<div class="real_comment">' + 
				postVO.reply_list[relpy_i].rcontent + 
			'</div>' + 
		'</div>';
					}
					nextArticle += 
		'<div class="more-comment-div">' + 
			'<span class="more-comment" data-pno="' + postVO.pno + '">...</span>' + 
		'</div>' + 
	'</div>' + 
'</article>';
				    $("#post-box").append(nextArticle);
					console.log( postVO_i + '. article 생성 완료');
				})
			}, error:function(){
				alert("Error - Next Page's Data ! ");
			}
		})
    }

    // IntersectionObserver 갱신 함수 (마지막 artice 요소를 감시하도록 함)
    function observeLastChild(intersectionObserver) {

        const listChildren = document.querySelectorAll(".post-box article");
        listChildren.forEach(ea => { // ea : End Article
            if (!ea.nextElementSibling && pageNum < realEnd) { 
                intersectionObserver.observe(ea) // ea에 대하여 관측 시작
                console.log(ea);
            } else if (pageNum >= realEnd) { 
                intersectionObserver.disconnect()
                msgLoading.textContent = "最後のページ" ///// *msgLoading
            }
        })
    }

    // IntersectionObeserver 부분 (옵저버 옵션)
    const observerOption = {
        root: null,
        rootMargin: "0px 0px 0px 0px",
        threshold: 0.5
    }

    // IntersectionObserver 인스턴스 생성
    const io = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            // entry.isIntersecting: 특정 요소가 뷰포트와 50%(threshold 0.5) 교차되었으면
            if (entry.isIntersecting) {
                msgLoading.classList.add("post-fade-in") ///// *msgLoading
                // 다음 데이터 가져오기: 자연스러운 연출을 위해 setTimeout 사용
                setTimeout(() => {
                    addData(++pageNum) ///// *currentPage
                    console.log('addData(++pageNum) - ' + pageNum); // 
                    observer.unobserve(entry.target)
                    observeLastChild(observer)
                    msgLoading.classList.remove("post-fade-in") ///// *msgLoading
                }, 1000)
            }
        })
    }, observerOption)

    // 초기 데이터 생성
    //addData(pageNum) // 데이터 추가 함수  ///// *currentPage
    observeLastChild(io) // IntersectionObserver 갱신 함수
	
	
	
	
	
	
	
	
	// Infinity Scroll
/*  	function YesScroll () {
		const pagination = document.querySelector('.paginaiton'); // 페이지네이션 정보획득
		const fullContent = document.querySelector('.post-box'); // 전체를 둘러싼 컨텐츠 정보획득
		const screenHeight = screen.height; // 화면 크기
		let oneTime = false; // 일회용 글로벌 변수
		document.addEventListener('scroll',OnScroll,{passive:true}) // 스크롤 이벤트함수정의
	 	function OnScroll () { //스크롤 이벤트 함수
	    	const fullHeight = fullContent.clientHeight; // infinite 클래스의 높이   
	    	const scrollPosition = pageYOffset; // 스크롤 위치
	    	if (fullHeight-screenHeight/2 <= scrollPosition && !oneTime) { // 만약 전체높이-화면높이/2가 스크롤포지션보다 작아진다면, 그리고 oneTime 변수가 거짓이라면
				oneTime = true; // oneTime 변수를 true로 변경해주고,
				console.log('인피니티 스클로 감지 !!!');
	      		madeBox(); // 컨텐츠를 추가하는 함수를 불러온다.
	    	}
	  	}
		
		const nextLink = pagination.querySelector('.nextPage'); // .pagination 의 .nextPage 링크
		const nextURL = nextLink.getAttribute('href'); // .nextPage의 링크 주소
		
		function madeBox() {
			const xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() { 
			  if (xhr.readyState === xhr.DONE) { 
			    if (xhr.status === 200 || xhr.status === 201) {
			      const data = xhr.response; // 다음페이지의 정보
			      const addList = data.querySelector('.contents'); // 다음페이지에서 list아이템을 획득 (contents = article)
			      fullContent.appendChild(addList); // infinite에 list를 더해주기
			      oneTime = false; // oneTime을 다시 false로 돌려서 madeBox를 불러올 수 있게 해주기
			    } else {
			      console.error(xhr.response);
			    }
			  }
			};
			xhr.open('GET', nextURL); // 다음페이지의 정보를 get
			xhr.send();
			xhr.responseType = "document";
		}
	}
	YesScroll();*/
	
 
</script>

<%@ include file="footer.jsp"%>