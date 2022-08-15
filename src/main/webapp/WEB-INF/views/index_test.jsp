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
				<div class="row post-box">
				  
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
												<span class="updateLink" onclick="location.href='/post/post_update'">게시물 수정</span>
												| 
												<span class="deleteLink" onclick="location.href='/post/post_delete'">게시물 삭제</span>
											</span>
										</div>
								     </c:if>
								</sec:authorize>
						</header>

						<!-- post 바디(이미지나 동영상 등 내용 입력 -->
						<div class="img_section">
							<div class="trans_inner">
								<div id="carousel${idx}" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">
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
								  <button class="carousel-control-prev" type="button" data-bs-target="#carousel${idx}" data-bs-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Previous</span>
								  </button>
								  <button class="carousel-control-next" type="button" data-bs-target="#carousel${idx}" data-bs-slide="next">
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
<!-- 							<div class="comment"> -->
<!-- 								<div class="nick_name">한En日ひ더미유저</div> -->
<!-- 								<div class="real_comment"> -->
<!-- 									<span class="hashTag" onclick="location.href='#'">@PungDaengYee</span> -->
<!-- 									더미 내용입니다. 日本語を打ったりwrite English~@#$%^&*()_+{}[]  -->
<!-- 								</div> -->
<!-- 							</div>  -->
							<c:forEach var="replyVO" items="${postVO.reply_list}" begin="0" end="2">
								<div class="comment">
									<div class="nick_name">${replyVO.nickname}</div>
									<div class="real_comment">
										<c:out value="${replyVO.rcontent}"/>
									</div>
								</div>
							</c:forEach>
<%-- 							<c:if test="${postVO.reply_list[3] != null}"> --%>
								<div class="more-comment-div">
									<span class="more-comment" data-pno="${postVO.pno}">...</span>
								</div>
<%-- 							</c:if> --%>
						</div>
					</article>
					<c:set var="idx" value="${idx + 1}"/>
					</c:forEach>
				  </c:when>
				  <c:otherwise>
				  	<div class="text-center fs-3 mt-5">
				  		No Post ...
				  		<p class="fs-5 mt-3">(post 테이블에 더미데이터 있으면 더미갯수만큼 포스팅 보임)</p>

				  		<p style="line-height: 1.5; text-align: left; font-size: 15px;">
				  			<br><br><br><br><br><br>
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
				  			로그인 된 유저 정보를 잘 받아오는가 확인
				  			<sec:authentication property="principal"/><br>
				  			<sec:authentication property="principal.Username"/><br>
				  			${nickname }
				  		</p>

				  	</div>
				  </c:otherwise>
				  </c:choose>

				</div> <!-- // post-box -->
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
							    <div class="carousel-item active">
							      <img src="/resources/imgs/long.jpg" alt="...">
							    </div>
							    <div class="carousel-item">
							      <img src="/resources/imgs/img_section/img01.jpg" alt="...">
							    </div>
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
									<img class="comment-profile-img on_cursor" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="comment-profile-flag">
										<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>
									</div>
									<div class="comment-name on_cursor align-self-center">Hanulso</div>
									<div class="comment-time align-self-center mx-5">1시간 전</div>
								</div>
								
								<div class="modal-posting-master-content">
									여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
								</div>
							</div>
						</div>
					</div>
				</div> <!-- / col-md-7 -->
				
				<div class="col-md-5 p-0">
					<div class="modal-detail-right">
						<div class="all-comment">		
							<p class="fs-5 mb-3">댓글 리스트</p>
							<!-- c:forEach -->
							<div class="comment-profile d-flex" id="comment-profile1">
								<img class="comment-profile-img on_cursor" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
								<div class="comment-profile-flag">
									<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>
								</div>
								<div class="comment-name on_cursor align-self-center">Hanulso</div>
								<div class="comment-time align-self-center mx-5">17분전</div>
								<div class="comment-cocoment align-self-center">답글 달기</div>
							</div>
							<div class="comment-content" id="comment-content1">
								하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 
								<!-- c:if 대댓글 개수가 1 이상이면 -->
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
								</div> <!-- / commment-depth-all -->
							</div> <!-- / comment-content -->
						</div> <!-- / all-comment -->
						
						<div class="comment-write-div">
							<span class="fs-5 mb-3">댓글 작성</span>
		                    <button class="msg_send_btn float-end" type="button" data-pno="85">
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
<!-- /Modal Test -->


<%@ include file="footer.jsp"%>