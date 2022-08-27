<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<!-- <script type="text/javascript" src="/resources/js/index.js"></script> -->



<div class="container-fluid">
	<div class="container">
		<div class="row post-main-view-row">
			
			<!-- post -->
			<div class="col-lg-7">
				<div class="row post-box" id="post-box">
				  
<%-- 				  <c:choose>
				  <c:when test="${post_list[0] != null}">
				    <c:set var="idx" value="1"/> <!-- id 식별용 idx -->
					<c:forEach var="postVO" items="${post_list}">
					<article class="contents"> --%>
						<!-- post 헤더 -->
<%-- 						<header class="top post-header">
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
							</div> --%>
<%-- 								<sec:authorize access="isAuthenticated()">
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
						</header> --%>

						<!-- post 바디(이미지나 동영상 등 내용 입력 -->
<%-- 						<div class="img_section">
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
						</div> --%>

						<!-- post 아이콘(좋아요, 댓글, 공유 // 책갈피 기능) -->
<%-- 						<div class="bottom_icons">
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
						</div> --%>

						<!-- post 댓글 div -->
<%-- 						<div class="comment_container">
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
					</article> --%>
<%-- 					<c:set var="idx" value="${idx + 1}"/>
					</c:forEach>
				  </c:when>
				  <c:otherwise>
				  	<div class="text-center fs-3 mt-5">
				  		No Post ...
				  	</div>
				  </c:otherwise>
				  </c:choose> --%>

				</div> <!-- // post-box -->
				<p id="msg-loading"><spring:message code="index.loading"/></p>
			</div> <!-- // col-lg-7 -->
			


			<div class="col-md-3" align="center">
				<div class="side_box sticky-side my-5">
					
					<article class="story">
						<header class="story_header">
							<div><spring:message code="index.friendList"/></div>
							<div class="sprite_more_icon" data-name="more" onclick="location.href='/friend/list'"></div>
						</header>

					  <c:choose>
						<c:when test="${friend_list[0] != null}">
						<c:forEach var="friendVO" items="${friend_list}">
							<div class="scroll_inner">
								<div class="thumb_user">
									<div class="profile_thumb" onclick="location.href='/mypage/profile/${friendVO.nickname}'">
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
										<div class="id" onclick="location.href='/mypage/profile/${friendVO.nickname}'">${friendVO.nickname}</div>
										<div class="time">
											<div class="online-circle"></div>
											<span class="time-status">온라인</span>
<!-- 											<div class="offline-circle"></div> -->
<!-- 											<span class="time-status">1시간 전</span> -->
										</div>
									</div>
									
									<div class="msg-link">
										<i class="bi bi-chat-dots" onclick="location.href='/chat/chat_list?email=${username}&who=${friendVO.nickname}'"></i>
									</div>
								</div>
							</div>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="no_friend">
								<p><spring:message code="index.noFriend"/></p>
							</div>
						</c:otherwise>
					  </c:choose>
					</article>

					<article class="recommend">
						<header class="reco_header">
							<div><spring:message code="index.friendRecommend"/></div>
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
								<div class="comment-cocoment align-self-center" data-refno="">답글 달기</div>
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
							<span class="fs-5 mb-3"><spring:message code="postmodal.writeComment"/></span>
							<span class="depth2div ms-2">
<!-- 								<span class="depth2nick">@イェーイ韓国人</span> -->
<!-- 								<span class="depth2x on_cursor"><i class="bi bi-x-lg"></i></span> -->
							</span>
		                    <button class="msg_send_btn float-end" id="msg_send_btn" type="button" data-pno="" data-refno="0" data-depth="1">
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
				<div class="col-md-12">
					
					<div id="like-user-list" class="like-user-list hello-scroll">
						<p class="text-center fs-3 my-4"><spring:message code="index.heartList"/></p>
						<div id="like-user-list-detail">
						
<!-- 							<div class="d-flex justify-content-between align-items-center luld">
								<div class="top post-header ms-5">
									<div class="user_container" onclick="location.href='#'">
										<div class="profile_img">
											<img src="/hello_img/member/lego_worker.jpg" alt="프로필이미지">
										</div>
										<div class="profile_flag">
											<img class="flag_icon" src="https://img.icons8.com/color/25/000000/japan-circular.png"/>
										</div>
										<div class="user_name">
											<div class="nick_name m_text">Hello_User</div>
											<div class="mt-1 s_text">東京, 日本</div>
										</div>
									</div>
								</div>
								<div class="me-5">
									<button type="button" class="btn btn-outline-info">친구 추가</button>
								</div>
							</div> -->
							
						</div>
					</div>
					
				</div>
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
				alert('<spring:message code="index.insertPostSuccess"/> ! ( ' + insert_pno + ' <spring:message code="index.pno"/> )'); // transalte
			}else{
				alert('<spring:message code="index.insertPostFail"/> ! '); // transalte
			}
		}
		var request_file_count = "${request_file_count}";
		var insert_file_result = "${insert_file_result}";
		if( request_file_count != null && request_file_count != "" && insert_file_result != null && insert_file_result != "" && !history.state ){
			if( parseInt(request_file_count) != parseInt(insert_file_result) ){
				alert('<spring:message code="index.insertFileFail"/> ! ( ' + insert_file_result + ' / ' + request_file_count + ' )'); // transalte
			}
		}
		var delete_result = "${delete_result}";
		var delete_pno = "${delete_pno}";
		if( delete_result != null && delete_result != "" && delete_pno != null && delete_pno != "" && !history.state ){
			if( parseInt(delete_result) == 1 ) {
				alert('<spring:message code="index.deletePostSuccess"/> ! ( ' + delete_pno + ' <spring:message code="index.pno"/> )'); // transalte
			}else {
				alert('<spring:message code="index.deletePostFail"/> ! ( ' + delete_pno + ' <spring:message code="index.pno"/> )'); // transalte
			}
		}
		var update_result = "${update_result}";
		var update_pno = "${update_pno}";
		if( update_result != null && update_result != "" && update_pno != null && update_pno != "" && !history.state ){
			if( parseInt(update_result) == 1 ) {
				alert('<spring:message code="index.updatePostSuccess"/> ! ( ' + update_pno + ' <spring:message code="index.pno"/> )'); // transalte
			}else {
				alert('<spring:message code="index.updatePostFail"/> ! ( ' + update_pno + ' <spring:message code="index.pno"/> )'); // transalte
			}
		}
		history.replaceState({},null,null);
	})
	
	
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
					$("#heart-count" + heart_pno).html(data + " <spring:message code='index.likeCount'/>"); // transalte
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
					$("#heart-count" + heart_pno).html(data + " <spring:message code='index.likeCount'/>"); // transalte
				}, error:function(){
					alert("Error - Like Add");
				}
			})
		}
	})
	
	// Like User List on Modal
	$(document).on("click", ".heart-count", function() {
		var lul_pno = $(this).data("pno");
		$(".modal-background2").css("display", "block");
		$.ajax({
			type:"get",
			url:"/post/like_user_list?pno=" + lul_pno,
			dataType:"json",
			success:function(like_list){
				if( like_list[0] == null ) {
					let luld = '<p class="mt-5 text-center fs-5"><spring:message code="index.noHeart"/></p>'; // transalte
					$("#like-user-list-detail").append(luld);
				}else {
					$.each(like_list, function(luld_i, likeVO){
						let luld = 
							'<div class="d-flex justify-content-between align-items-center luld">' + 
								'<div class="top post-header ms-5">' + 
									'<div class="user_container" onclick="location.href=\'/mypage/profile/' + likeVO.nickname + '\'">' + 
										'<div class="profile_img">' + 
											'<img src="/hello_img/member/' + likeVO.profile + '" alt="profile">' + 
										'</div>' + 
										'<div class="profile_flag">';
									if( likeVO.language == 'J' ) {
										luld += 
											'<img class="flag_icon" src="https://img.icons8.com/color/25/000000/japan-circular.png"/>';
									}else {
										luld += 
											'<img class="flag_icon" src="https://img.icons8.com/color/25/000000/south-korea-circular.png"/>'; 
									}
									luld += 
										'</div>' + 
										'<div class="user_name">' + 
											'<div class="nick_name m_text">' + likeVO.nickname + '</div>' + 
// 											'<div class="mt-1 s_text">東京, 日本</div>' + // transalte
										'</div>' + 
									'</div>' + 
								'</div>' + 
								'<div class="me-5">';							
									if( '${username}' == likeVO.email ) {
										luld += 
									'<div></div>'
									}else {
										if( likeVO.friendYN == 'Y' ) {
											luld += 
									'<button type="button" class="btn btn-outline-secondary"><spring:message code="index.removeFriend"/></button>'; // transalte
										}else {
											luld += 
									'<button type="button" class="btn btn-outline-info"><spring:message code="index.addFriend"/></button>'; // transalte
										}	
									}
									luld += 
								'</div>' + 
							'</div>';
							$("#like-user-list-detail").append(luld);
					})
				}
			}, error:function(){
				alert("Error - Like User List ! ");
			}
		})
	})
	
	// Like User List - Hover
	$(document).on("mouseenter", ".luld", function(){
    	$(this).css("background-color", "rgb(204 204 204 / 19%)");
    });
	$(document).on("mouseleave", ".luld", function(){
    	$(this).css("background-color", "#ffffff");
    });
	
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
 				var comment_profile = '<img class="comment-profile-img on_cursor" src="/hello_img/member/' + postVO.profile + '" alt="프로필사진" onclick="location.href=\'/mypage/profile/' + postVO.nickname + '\'">' + 
									  '<div class="comment-profile-flag">';
				if( postVO.language == 'J' ) {
					comment_profile +=   '<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>' +  
									   '</div>' + 
									   '<div class="comment-name on_cursor align-self-center" onclick="location.href=\'/mypage/profile/' + postVO.nickname + '\'">' + postVO.nickname + '</div>';
				}else {
					comment_profile +=   '<img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/>' + 
									   '</div>' + 
									   '<div class="comment-name on_cursor align-self-center" onclick="location.href=\'/mypage/profile/' + postVO.nickname + '\'">' + postVO.nickname + '</div>';
				} 
				var cpt = postVO.timer.slice(0, -1);
				var cpt_1 = postVO.timer.slice(-1);
				if(cpt_1 == 's') {
					if(cpt == '1') {
						cpt += '<spring:message code="timer.sec"/>';
					}else {
						cpt += '<spring:message code="timer.sec2"/>';
					}
					
				}else if(cpt_1 == 'm') {
					if(cpt == '1') {
						cpt += '<spring:message code="timer.min"/>';
					}else {
						cpt += '<spring:message code="timer.min2"/>';
					}
					
				}else if(cpt_1 == 'h') {
					if(cpt == '1') {
						cpt += '<spring:message code="timer.hour"/>';
					}else {
						cpt += '<spring:message code="timer.hour2"/>';
					}
					
				}else if(cpt_1 == 'd') {
					if(cpt == '1') {
						cpt += '<spring:message code="timer.day"/>';
					}else {
						cpt += '<spring:message code="timer.day2"/>';
					}
					
				}else if(cpt_1 == 'M') {
					if(cpt == '1') {
						cpt += '<spring:message code="timer.month"/>';
					}else {
						cpt += '<spring:message code="timer.month2"/>';
					}
					
				}else if(cpt_1 == 'y') {
					if(cpt == '1') {
						cpt += '<spring:message code="timer.year"/>';
					}else {
						cpt += '<spring:message code="timer.year2"/>';
					}
					
				}
 				comment_profile += '<div class="comment-time align-self-center mx-5">' + cpt + '</div>';
				$(".modal-detail-contents .comment-profile").append(comment_profile); 
				
				// Post Content
				$(".modal-posting-master-content").html(postVO.content);
				// Comment List
 				$(".all-comment").append('<p class="fs-5 mb-3"><spring:message code="postmodal.commentList"/></p>');
				if( postVO.reply_list[0] == null ) {
					$(".all-comment").append('<p class="fs-6 text-center mt-5"><spring:message code="postmodal.noComment"/></p>');  // transalte
				}else {
					$.each(postVO.reply_list, function(i, replyVO){
		 				$(".all-comment").append('<div class="comment-profile d-flex" id="comment-profile' + replyVO.repno + '"></div>' + 
	    				 						 '<div class="comment-content" id="comment-content' + replyVO.repno + '"></div>');
						var all_comment_profile = '<img class="comment-profile-img on_cursor" src="/hello_img/member/' + replyVO.profile + '" alt="profile" onclick="location.href=\'/mypage/profile/' + replyVO.nickname + '\'">' + 
						  						  '<div class="comment-profile-flag">';
						if( replyVO.language == 'J' ) {
							all_comment_profile += '<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>';
						}else {
							all_comment_profile += '<img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/>';
						}
						var acpt = replyVO.timer.slice(0, -1);
						var acpt_1 = replyVO.timer.slice(-1);
						if(acpt_1 == 's') {
							if(acpt == '1') {
								acpt += '<spring:message code="timer.sec"/>';
							}else {
								acpt += '<spring:message code="timer.sec2"/>';
							}
							
						}else if(acpt_1 == 'm') {
							if(acpt == '1') {
								acpt += '<spring:message code="timer.min"/>';
							}else {
								acpt += '<spring:message code="timer.min2"/>';
							}
							
						}else if(acpt_1 == 'h') {
							if(acpt == '1') {
								acpt += '<spring:message code="timer.hour"/>';
							}else {
								acpt += '<spring:message code="timer.hour2"/>';
							}
							
						}else if(acpt_1 == 'd') {
							if(acpt == '1') {
								acpt += '<spring:message code="timer.day"/>';
							}else {
								acpt += '<spring:message code="timer.day2"/>';
							}
							
						}else if(acpt_1 == 'M') {
							if(acpt == '1') {
								acpt += '<spring:message code="timer.month"/>';
							}else {
								acpt += '<spring:message code="timer.month2"/>';
							}
							
						}else if(acpt_1 == 'y') {
							if(acpt == '1') {
								acpt += '<spring:message code="timer.year"/>';
							}else {
								acpt += '<spring:message code="timer.year2"/>';
							}
							
						}
						all_comment_profile += '</div>' + 
									    	   '<div class="comment-name on_cursor align-self-center" onclick="location.href=\'/mypage/profile/' + replyVO.nickname + '\'">' + replyVO.nickname + '</div>' + 
									    	   '<div class="comment-time align-self-center mx-5">' + acpt + '</div>' + 
									    	   '<div class="comment-cocoment align-self-center" data-repno="' + replyVO.repno + '"><spring:message code="postModal.coComment"/></div>'; // transalte
			    	    $(".all-comment #comment-profile"+replyVO.repno).append(all_comment_profile);
						$(".all-comment #comment-content"+replyVO.repno).html(replyVO.rcontent);
						// Open&Close coComent script use id="collapse + replyVO.repno"
  	 					if( replyVO.cocomment_list[0] != null ){
							$(".all-comment #comment-content"+replyVO.repno).append('<div class="comment-accordion on_cursor mt-3 ms-3" data-bs-toggle="collapse" data-bs-target="#collapse' + replyVO.repno + '" aria-expanded="false">' + 
																	      				'<i class="bi bi-arrow-return-right fs-5"></i>' + 
																	      				'<span class="cocoment-open ms-3" data-oc="c"><spring:message code="postModal.cocoOpen"/></span>' + 
																      				'</div>');
							$(".all-comment #comment-content"+replyVO.repno).append('<div class="collapse" id="collapse' + replyVO.repno + '"></div>');
 							$.each(replyVO.cocomment_list, function(k, cocommentVO) {
								var all_comment_collapse = '<div class="comment-depth">' + 
													         '<div class="comment-profile d-flex">' + 
													           '<img class="comment-profile-img on_cursor" src="/hello_img/member/' + cocommentVO.profile + '" alt="profile" onclick="location.href=\'/mypage/profile/' + cocommentVO.nickname + '\'">' + 
													           '<div class="comment-profile-flag">';
				                if( cocommentVO.language == 'J' ){  
				                	all_comment_collapse += '<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>';
				                }else{
				                	all_comment_collapse += '<img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/>';
				                }
				                all_comment_collapse += '</div>' + 
						           						'<div class="comment-name on_cursor align-self-center" onclick="location.href=\'/mypage/profile/' + cocommentVO.nickname + '\'">' + cocommentVO.nickname + '</div>';
        						var acct = cocommentVO.timer.slice(0, -1);
        						var acct_1 = cocommentVO.timer.slice(-1);
        						if(acct_1 == 's') {
        							if(acct == '1') {
        								acct += '<spring:message code="timer.sec"/>';
        							}else {
        								acct += '<spring:message code="timer.sec2"/>';
        							}
        						}else if(acct_1 == 'm') {
        							if(acct == '1') {
        								acct += '<spring:message code="timer.min"/>';
        							}else {
        								acct += '<spring:message code="timer.min2"/>';
        							}
        						}else if(acct_1 == 'h') {
        							if(acct == '1') {
        								acct += '<spring:message code="timer.hour"/>';
        							}else {
        								acct += '<spring:message code="timer.hour2"/>';
        							}
        						}else if(acct_1 == 'd') {
        							if(acct == '1') {
        								acct += '<spring:message code="timer.day"/>';
        							}else {
        								acct += '<spring:message code="timer.day2"/>';
        							}
        						}else if(acct_1 == 'M') {
        							if(acct == '1') {
        								acct += '<spring:message code="timer.month"/>';
        							}else {
        								acct += '<spring:message code="timer.month2"/>';
        							}
        						}else if(acct_1 == 'y') {
        							if(acct == '1') {
        								acct += '<spring:message code="timer.year"/>';
        							}else {
        								acct += '<spring:message code="timer.year2"/>';
        							}
        						}					
        						all_comment_collapse += '<div class="comment-time align-self-center mx-5">' + acct + '</div>' + 
												         '</div>' + 
												         '<div class="comment-content">' + 
												         	cocommentVO.rcontent +
												         '</div>' + 
												       '</div>';
							    $("#collapse" + replyVO.repno).append(all_comment_collapse);
 							})
						}  
					}) // each
				} // reply_list[0] else
				
				// Comment Write Div's data-pno
				$(".comment-write-div .msg_send_btn").data("pno", postVO.pno);
				// Display Block
				$(".modal-background").fadeIn( 300, function() {
					$(this).css("display","block");
				} );
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
	$(document).mouseup(function (e){
		var modal2 = $(".modal-background2");
		if( modal2.has(e.target).length === 0){
			$(".modal-background2").css('display','none');
			$("#like-user-list-detail").empty();
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
	 $('.closeModalBtn2').on('click', function(){
		 $('.modal-background2').css("display", "none");  
		 $("#like-user-list-detail").empty();
	 });
	
	// Coment Depth 2 Add
	$(document).on("click", ".comment-cocoment", function() {
		$(".depth2div").empty();
		var cocoRef = $(this).data("repno");
		var cocoNick = $(this).closest(".comment-profile").children(".comment-name").html();
		$("#msg_send_btn").data("refno", cocoRef);
		$("#msg_send_btn").data("depth", "2");
		var cocoAt = '<span class="depth2nick">@' + cocoNick + '</span>' + 
					 '<span class="depth2x on_cursor"> <i class="bi bi-x-lg"></i></span>';
		$(".depth2div").append(cocoAt);
	})
	
	// Coment Depth 2 Remove
	$(document).on("click", ".depth2x", function(){
		$("#msg_send_btn").data("refno", "0");
		$("#msg_send_btn").data("depth", "1");
		$(".depth2div").empty();
	})
		 
	// Coment Insert
	$(".msg_send_btn").on("click", function(e){		
		e.preventDefault();
		var pno = $(this).data("pno");
		var email = '${username}';
		var rcontent = $("#commentInsert").val();
		var refno = $(this).data("refno");
		var depth = $(this).data("depth");
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		if( rcontent == "" ) {
			alert('<spring:message code="index.pleaseComment"/>'); //translate
		}else {
			// AJAX action
			if( !confirm('<spring:message code="index.confirmComment"/>') ) { //translate
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
					rcontent : rcontent,
					refno : refno,
					depth : depth
				},
				beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				success:function(data){
					if( data.depth == '2' ) {
						var accpt = data.timer.slice(0, -1);
						var accpt_1 = data.timer.slice(-1);
						if(accpt_1 == 's') {
							if(accpt_1 == '1') {
								accpt += '<spring:message code="timer.sec"/>';
							}else{
								accpt += '<spring:message code="timer.sec2"/>';
							}
						}else if(accpt_1 == 'm') {
							if(accpt_1 == '1') {
								accpt += '<spring:message code="timer.min"/>';
							}else{
								accpt += '<spring:message code="timer.min2"/>';
							}
						}else if(accpt_1 == 'h') {
							if(accpt_1 == '1') {
								accpt += '<spring:message code="timer.hour"/>';
							}else{
								accpt += '<spring:message code="timer.hour2"/>';
							}
						}else if(accpt_1 == 'd') {
							if(accpt_1 == '1') {
								accpt += '<spring:message code="timer.day"/>';
							}else{
								accpt += '<spring:message code="timer.day2"/>';
							}
						}else if(accpt_1 == 'M') {
							if(accpt_1 == '1') {
								accpt += '<spring:message code="timer.month"/>';
							}else{
								accpt += '<spring:message code="timer.month2"/>';
							}
						}else if(accpt_1 == 'y') {
							if(accpt_1 == '1') {
								accpt += '<spring:message code="timer.year"/>';
							}else{
								accpt += '<spring:message code="timer.year2"/>';
							}
						}
						// 처음 달리는 대댓글일 때
						if( $("#collapse" + data.refno).length == 0 ) {
							$(".all-comment #comment-content"+data.refno).append('<div class="comment-accordion on_cursor mt-3 ms-3" data-bs-toggle="collapse" data-bs-target="#collapse' + data.refno + '" aria-expanded="false">' + 
																	      			 '<i class="bi bi-arrow-return-right fs-5"></i>' + 
																	      		     '<span class="cocoment-open ms-3" data-oc="c"><spring:message code="postModal.cocoOpen"/></span>' + 
																      			 '</div>');
							$(".all-comment #comment-content"+data.refno).append('<div class="collapse show" id="collapse' + data.refno + '">');
						}
						var dAllComCol = '<div class="comment-depth">' + 
								         '<div class="comment-profile d-flex">' + 
								           '<img class="comment-profile-img on_cursor" src="/hello_img/member/' + data.profile + '" alt="profile">' + 
								           '<div class="comment-profile-flag">';
						if( data.language == 'J' ){  
							dAllComCol += '<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>';
						}else{
							dAllComCol += '<img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/>';
						}
						dAllComCol += '</div>' + 
										'<div class="comment-name on_cursor align-self-center">' + data.nickname + '</div>' + 
										'<div class="comment-time align-self-center mx-5">' + accpt + '</div>' + 
							          '</div>' + 
							          '<div class="comment-content">' + 
							             data.rcontent +
							          '</div>' + 
							          '</div>';
						$("#collapse" + data.refno).prepend(dAllComCol);
						}else {
							// if depth : 1
							$(".all-comment > p").remove();
	 		 				$(".all-comment").prepend('<p class="fs-5 mb-3"><spring:message code="postmodal.commentList"/></p>' + 
	 		 										 '<div class="comment-profile d-flex" id="comment-profile' + data.repno + '"></div>' + 
			 						 				 '<div class="comment-content" id="comment-content' + data.repno + '"></div>');
	 		 				var insert_all_comment_profile = '<img class="comment-profile-img on_cursor" src="/hello_img/member/' + data.profile + '" alt="profile">' + 
							  								 '<div class="comment-profile-flag">';
							if( data.language == 'J' ) {
								insert_all_comment_profile += '<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>';
							}else {
								insert_all_comment_profile += '<img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/>';
							}
							insert_all_comment_profile += '</div>' + 
					    	  							  '<div class="comment-name on_cursor align-self-center">' + data.nickname + '</div>';
							var accpt = data.timer.slice(0, -1);
							var accpt_1 = data.timer.slice(-1);
							if(accpt_1 == 's') {
								if(accpt == '1') {
									accpt += '<spring:message code="timer.sec"/>';
								}else {
									accpt += '<spring:message code="timer.sec2"/>';
								}
								
							}else if(accpt_1 == 'm') {
								if(accpt == '1') {
									accpt += '<spring:message code="timer.min"/>';
								}else {
									accpt += '<spring:message code="timer.min2"/>';
								}
								
							}else if(accpt_1 == 'h') {
								if(accpt == '1') {
									accpt += '<spring:message code="timer.hour"/>';
								}else {
									accpt += '<spring:message code="timer.hour2"/>';
								}
								
							}else if(accpt_1 == 'd') {
								if(accpt == '1') {
									accpt += '<spring:message code="timer.day"/>';
								}else {
									accpt += '<spring:message code="timer.day2"/>';
								}
								
							}else if(accpt_1 == 'M') {
								if(accpt == '1') {
									accpt += '<spring:message code="timer.month"/>';
								}else {
									accpt += '<spring:message code="timer.month2"/>';
								}
								
							}else if(accpt_1 == 'y') {
								if(accpt == '1') {
									accpt += '<spring:message code="timer.year"/>';
								}else {
									accpt += '<spring:message code="timer.year2"/>';
								}
								
							}			
							insert_all_comment_profile += '<div class="comment-time align-self-center mx-5">' + accpt + '</div>' + 
					    	  							  '<div class="comment-cocoment align-self-center" data-repno="' + data.repno + '"><spring:message code="postModal.coComment"/></div>'; //translate
							$(".all-comment #comment-profile"+data.repno).append(insert_all_comment_profile);
							$(".all-comment #comment-content"+data.repno).html(data.rcontent);
						}
						$("#commentInsert").val("");
						$("#msg_send_btn").data("refno", "0");
						$("#msg_send_btn").data("depth", "1");
						$(".depth2div").empty();
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
			$(this).html('<spring:message code="postModal.cocoClose"/>');
		}else {
			$(this).data("oc", "c")
			$(this).html('<spring:message code="postModal.cocoOpen"/>');
		}
	})

	// Post Update
	$(document).on("click",".updateLink",function() {
		var updatePno = $(this).data("pno");
		var updateUser = '${username}';
		if( confirm(updatePno + "<spring:message code='index.confirmUpdate'/>") ) { //translate
			location.href = '/post/post_update?pno=' + updatePno + '&email=' + updateUser;
		}
	})
	// Post Delete
	$(document).on("click",".deleteLink",function() {
		var deletePno = $(this).data("pno");
		var deleteUser = '${username}';
		if( confirm(deletePno + "<spring:message code='index.confirmDelete'/>") ) { //translate
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
				if( post_list[0] == null ) {
				    $("#post-box").append('<div class="text-center fs-3 my-5"><spring:message code="index.noPost"/></div>'); // transalte
				    $("#msg-loading").css("display", "none");
					console.log('No Post... 생성 완료');
				}else{
	$.each(post_list, function(postVO_i, postVO){
	 					let nextArticle = 
	'<article class="contents post-fade-in">' + 
		'<!-- post 헤더 -->' + 
		'<header class="top post-header">' + 
			'<div class="user_container" onclick="location.href=\'/mypage/profile/' + postVO.nickname + '\'">' + 
				'<div class="profile_img">' + 
					'<img src="/hello_img/member/' + postVO.profile + '" alt="profile">' + 
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
// 					'<div class="mt-1 s_text">東京, 日本</div>' + // transalte
				'</div>' + 
			'</div>'; 
						if ( postVO.email == '${username}' ) {
							nextArticle += 
			'<div class="updateDeleteDiv">' + 
				'<span class="updateDeleteContent">' + 
					'<span class="updateLink" data-pno="' + postVO.pno + '"><spring:message code="index.postUpdate"/></span>' + 
					' | ' +  
					'<span class="deleteLink" data-pno="' + postVO.pno + '"><spring:message code="index.postDelete"/></span>' + 
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
				'<span class="heart-count on_cursor" id="heart-count' + postVO.pno + '" data-pno="' + postVO.pno + '">' + 
					postVO.like_cnt + ' <spring:message code="index.likeCount"/>' + // transalte
				'</span>' + 
			'</div>' + 
			'<div class="d-flex align-items-center">' + 
			    // Kakao Share Test
   				'<span><a id="kakaotalk-sharing-btn" href="javascript:shareMessage()" data-nick="' + postVO.nickname + '" data-pno="' + postVO.pno + '" onclick="kakaoData(this)"><img src="/resources/imgs/kakao_share_icon_big.png" alt="Kakao Share" style="width:43px; height:43px; margin-right:10px;"/></a></span>' + 
				// Line Share Test
				'<span class="on_cursor line_share" data-nick="' + postVO.nickname + '" data-pno="' + postVO.pno + '" onclick="sendNaverLine(this)"><img src="/resources/imgs/line_share_icon_big.png" alt="Line Share" style="width:33px; height:33px; margin-right:10px;"></img></span>' +
			'</div>' + 
		'</div>' + 
		'<div class="posting-master">' + 
			'<p class="posting-master-name on_cursor" onclick="location.href=\'/mypage/profile/' + postVO.nickname + '\'">' + postVO.nickname + '</p>' + 
			'<div class="posting-master-content">' + 
				postVO.content + 
			'</div>' + 
		'</div>' + 
		'<div class="timer">';
		var articleTimer = postVO.timer.slice(0, -1);
		var articleTimer_1 = postVO.timer.slice(-1);
		if(articleTimer_1 == 's') {
			if(articleTimer == '1') {
				articleTimer += '<spring:message code="timer.sec"/>';
			}else {
				articleTimer += '<spring:message code="timer.sec2"/>';
			}
			
		}else if(articleTimer_1 == 'm') {
			if(articleTimer == '1') {
				articleTimer += '<spring:message code="timer.min"/>';
			}else {
				articleTimer += '<spring:message code="timer.min2"/>';
			}
			
		}else if(articleTimer_1 == 'h') {
			if(articleTimer == '1') {
				articleTimer += '<spring:message code="timer.hour"/>';
			}else {
				articleTimer += '<spring:message code="timer.hour2"/>';
			}
			
		}else if(articleTimer_1 == 'd') {
			if(articleTimer == '1') {
				articleTimer += '<spring:message code="timer.day"/>';
			}else {
				articleTimer += '<spring:message code="timer.day2"/>';
			}
			
		}else if(articleTimer_1 == 'M') {
			if(articleTimer == '1') {
				articleTimer += '<spring:message code="timer.month"/>';
			}else {
				articleTimer += '<spring:message code="timer.month2"/>';
			}
			
		}else if(articleTimer_1 == 'y') {
			if(articleTimer == '1') {
				articleTimer += '<spring:message code="timer.year"/>';
			}else {
				articleTimer += '<spring:message code="timer.year2"/>';
			}
			
		}		
		nextArticle += 
			articleTimer + 
		'</div>' + 
		'<!-- post 댓글 div -->' + 
		'<div class="comment_container">';
						for( var relpy_i in postVO.reply_list ) {
							nextArticle += 
			'<div class="comment">' + 
				'<div class="nick_name on_cursor" onclick="location.href=\'/mypage/profile/' + postVO.reply_list[relpy_i].nickname + '\'">' + postVO.reply_list[relpy_i].nickname + '</div>' + 
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
						console.log( (postVO_i + 1) + ' '  + '. article 생성 완료');
					})
				}
				observeLastChild(io); // 
			}, error:function(){
				alert("Error - Next Page's Data ! ");
			}
		})
    }

    // IntersectionObserver 갱신 함수 
    function observeLastChild(intersectionObserver) {

        const listChildren = document.querySelectorAll(".post-box article");
        const listParent = document.querySelectorAll(".post-box")

        listChildren.forEach(ea => { // ea : End Article
            if (!ea.nextElementSibling && pageNum < realEnd) { 
                intersectionObserver.observe(ea) // ea에 대하여 관측 시작
                console.log('------- ea에 대하여 관측 시작'); //
                console.log(ea); //
            } else if (pageNum >= realEnd) { 
                intersectionObserver.disconnect()
                msgLoading.textContent = "最後のページ";
               	console.log('最後のページ --- 관측 종료'); //
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
                msgLoading.classList.add("post-fade-in") 
                // 다음 데이터 가져오기: 자연스러운 연출을 위해 setTimeout 사용
                setTimeout(() => {
                    addData(++pageNum) 
                    console.log('addData(++pageNum) - ' + pageNum); 
                    observer.unobserve(entry.target)
                    //observeLastChild(observer) 
                    msgLoading.classList.remove("post-fade-in") 
                }, 1000)
            }
        })
    }, observerOption)

    // 초기 데이터 생성
    addData(pageNum) // 
    //observeLastChild(io) // IntersectionObserver 갱신 함수
	
	// Line Share Test
	function sendNaverLine(e) {
        var line_nick = $(e).data("nick");
        var line_pno = $(e).data("pno");
    	var line_title = "[Welcome to HelloBook]";
        var line_summary = "'" + line_nick + "'s post";
        var line_br = "\n";
        var line_link = "http://localhost:8088/post/post_detail/" + line_pno;
        var line_img = "https://media.discordapp.net/attachments/591977740350128139/1012435521412272188/hello_book_logo.jpg?";
        var line_url = "http://line.me/R/msg/text/?" + 
						encodeURIComponent(line_title + line_br + line_summary + line_br + line_link);
        var openNewWindow = window.open("about:blank");
        openNewWindow.location.href = line_url;
    }

    // Kakao Share Test 
      Kakao.init("a7ba4a0aa3292ea9684a93aa38bba597");
	  var kakao_nick = "";
	  var kakao_pno = "";
	  var kakao_img = "https://media.discordapp.net/attachments/591977740350128139/1012435521412272188/hello_book_logo.jpg";
      function kakaoData(e) {
    	  kakao_nick = $(e).data("nick");
    	  kakao_pno = $(e).data("pno");
      }
	  function shareMessage() {
	    Kakao.Share.sendDefault({
	      objectType: 'feed',
	      content: {
	        title: "[HelloBook] " + kakao_nick + "'s post",
	        description: '#HelloBook #Korea #Japan #学習 #言語交換',
	        imageUrl: kakao_img,
	        link: {
	          mobileWebUrl: 'http://localhost:8088/post/post_detail/' + kakao_pno, // 'https://developers.kakao.com'
	          webUrl: 'http://localhost:8088/post/post_detail/' + kakao_pno,
	        },
	      },
// 	      social: {
// 	        likeCount: 286,
// 	        commentCount: 45,
// 	        sharedCount: 845,
// 	      },
	      buttons: [
	        {
	          title: '웹으로 보기',
	          link: {
	            mobileWebUrl: 'http://localhost:8088/post/post_detail/' + kakao_pno,
	            webUrl: 'http://localhost:8088/post/post_detail/' + kakao_pno,
	          },
	        },
	        {
	          title: '앱으로 보기',
	          link: {
	            mobileWebUrl: 'http://localhost:8088/post/post_detail/' + kakao_pno,
	            webUrl: 'http://localhost:8088/post/post_detail/' + kakao_pno,
	          },
	        },
	      ],
	    })
	  }
    
</script>

<%@ include file="footer.jsp"%>