<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>


<div class="container-fluid">
	<div class="container">
		<div class="row post-main-view-row">
		
			
			<!-- post -->
			<div class="col-lg-7">
				<div class="row post-box">
				  
				  <c:choose>
				  <c:when test="${post_list[0] == null}">
					<c:forEach var="postVO" items="${post_list}">
					<article class="contents">
						<!-- post 헤더 -->
						<header class="top post-header">
							<div class="user_container" onclick="location.href='#'">
								<div class="profile_img">
									<img src="/resources/imgs/thumb02.jpg" alt="프로필이미지">
								</div>
								<div class="profile_flag">
									<img class="flag_icon" src="https://img.icons8.com/color/25/000000/japan-circular.png"/>
								</div>
								<div class="user_name">
									<div class="nick_name m_text">Hanulso</div>
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
								<div id="carousel1" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">
								  <div class="carousel-inner">
								    <div class="carousel-item active">
								      <img src="/resources/imgs/long.jpg" alt="...">
								    </div>
								    <div class="carousel-item">
								      <img src="/resources/imgs/img_section/img01.jpg" alt="...">
								    </div>
								    <div class="carousel-item">
								      <img src="/resources/imgs/thumb.jpeg" alt="...">
								    </div>
								  </div>
								  <button class="carousel-control-prev" type="button" data-bs-target="#carousel1" data-bs-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Previous</span>
								  </button>
								  <button class="carousel-control-next" type="button" data-bs-target="#carousel1" data-bs-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="visually-hidden">Next</span>
								  </button>
								</div>
							</div>
						</div>

						<!-- post 아이콘(좋아요, 댓글, 공유 // 책갈피 기능) -->
						<div class="bottom_icons">
							<div class="left_icons">
								<div class="sprite_heart_icon_outline on_cursor" name="39" data-name="heartbeat"></div>
								<span class="heart-count on_cursor">39 명이 좋아합니다</span>
							</div>
							<div class="right_icon">
<!-- 							<div class="sprite_bubble_icon"></div> -->
								<div class="sprite_share_icon on_cursor" data-name="share"></div>
							</div>
						</div>

						<div class="posting-master">
							<p class="posting-master-name">Hanulso</p>
							<div class="posting-master-content">
								두줄 이상 잘린다  두줄 이상 잘린다  두줄 이상 잘린다  두줄 이상 잘린다 두줄 이상 잘린다  두줄 이상 잘린다  두줄 이상 잘린다  두줄 이상 잘린다 두줄 이상 잘린다  두줄 이상 잘린다  두줄 이상 잘린다  두줄 이상 잘린다
							</div>
						</div>

						<div class="timer">36분 전</div>

						<!-- post 댓글 div -->
						<div class="comment_container">
							<div class="comment">
								<div class="nick_name">한국인유저</div>
								<div class="real_comment">
									<span class="hashTag" onclick="location.href='#'">@PungDaengYee</span>
									강아지가 너무 귀여워요!
								</div>
							</div>
							<div class="comment">
								<div class="nick_name">日本人ユーザー</div>
								<div class="real_comment">
									尻尾が長すぎ ! 尻尾が長すぎ ! 尻尾が長すぎ ! 尻尾が長すぎ ! 尻尾が長すぎ ! 尻尾が長すぎ ! 尻尾が長すぎ ! 尻尾が長すぎ ! 尻尾が長すぎ ! 尻尾が長すぎ ! 
								</div>
							</div>
							<div class="comment">
								<div class="nick_name">English User</div>
								<div class="real_comment">
									Only three comments visible. Click ... under here to see more comments
								</div>
							</div>
							<div class="more-comment-div">
								<span class="more-comment">...</span>
							</div>
						</div>
					</article>
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
				  		</p>
				  	</div>
				  </c:otherwise>
				  </c:choose>

				</div> <!-- // post-box -->
			</div> <!-- // col-lg-7 -->
			


			<div class="col-md-3" align="center">
				<div class="side_box sticky-side my-5">
				
					<!-- 개인 프로필
					<div class="user_profile">
						<div class="profile_thumb">
							<img src="imgs/thumb.jpeg" alt="프로필사진">
						</div>
						<div class="detail">
							<div class="id m_text">Hellobook</div>
							<div class="ko_name">헬로북</div>
						</div>
					</div> -->
					
					<article class="story">
						<header class="story_header">
							<div>친구 리스트</div>
							<div class="sprite_more_icon" data-name="more" onclick="location.href='/friend/list'"></div>
						</header>

						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb" onclick="location.href='#'">
									<img class="profile_img_side" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="profile_flag_side"><img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/></div>
								</div>

								<div class="detail">
									<div class="id" onclick="location.href='#'">im_online</div>
									<div class="time">
										<div class="online-circle"></div>
										<span class="time-status">온라인</span>
									</div>
								</div>
								
								<div class="msg-link">
									<i class="bi bi-chat-dots" onclick="location.href='#'"></i>
								</div>
							</div>
						</div>
						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb" onclick="location.href='#'">
									<img class="profile_img_side" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="profile_flag_side"><img src="https://img.icons8.com/color/22/000000/japan-circular.png"/></div>
								</div>

								<div class="detail">
									<div class="id" onclick="location.href='#'">im_online</div>
									<div class="time">
										<div class="online-circle"></div>
										<span class="time-status">온라인</span>
									</div>
								</div>
								
								<div class="msg-link">
									<i class="bi bi-chat-dots" onclick="location.href='#'"></i>
								</div>
							</div>
						</div>
						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb">
									<img class="profile_img_side" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="profile_flag_side"><img src="https://img.icons8.com/color/22/000000/japan-circular.png"/></div>
								</div>

								<div class="detail">
									<div class="id">offlineUser</div>
									<div class="time">
										<div class="offline-circle"></div>
										<span class="time-status">1시간 전</span>
									</div>
								</div>
								
								<div class="msg-link">
									<i class="bi bi-chat-dots" onclick="location.href='#'"></i>
								</div>
							</div>
						</div>
						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb">
									<img class="profile_img_side" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="profile_flag_side"><img src="https://img.icons8.com/color/22/000000/japan-circular.png"/></div>
								</div>

								<div class="detail">
									<div class="id">offlineUser</div>
									<div class="time">
										<div class="offline-circle"></div>
										<span class="time-status">2시간 전</span>
									</div>
								</div>
								
								<div class="msg-link">
									<i class="bi bi-chat-dots" onclick="location.href='#'"></i>
								</div>
							</div>
						</div>
						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb">
									<img class="profile_img_side" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="profile_flag_side"><img src="https://img.icons8.com/color/22/000000/japan-circular.png"/></div>
								</div>

								<div class="detail">
									<div class="id">offlineUser</div>
									<div class="time">
										<div class="offline-circle"></div>
										<span class="time-status">3시간 전</span>
									</div>
								</div>
								
								<div class="msg-link">
									<i class="bi bi-chat-dots" onclick="location.href='#'"></i>
								</div>
							</div>
						</div>
					</article>

					<article class="recommend">
						<header class="reco_header">
							<div>친구 추천</div>
<!-- 							<div class="more">모두 보기</div> -->
							<div class="sprite_more_icon" data-name="more" onclick="location.href='/'"></div>
						</header>

						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb">
									<img class="profile_img_side" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="profile_flag_side"><img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/></div>
								</div>

								<div class="detail">
									<div class="id">im_online</div>
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
						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb">
									<img class="profile_img_side" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="profile_flag_side"><img src="https://img.icons8.com/color/22/000000/japan-circular.png"/></div>
								</div>

								<div class="detail">
									<div class="id">offlineUser</div>
									<div class="time">
										<div class="offline-circle"></div>
										<span class="time-status">3시간 전</span>
									</div>
								</div>
								
								<div class="msg-link">
									<i class="bi bi-plus-lg" onclick="location.href='#'"></i>
								</div>
							</div>
						</div>
						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb">
									<img class="profile_img_side" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="profile_flag_side"><img src="https://img.icons8.com/color/22/000000/japan-circular.png"/></div>
								</div>

								<div class="detail">
									<div class="id">offlineUser</div>
									<div class="time">
										<div class="offline-circle"></div>
										<span class="time-status">3시간 전</span>
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
    <a href="board.do?pageNum=1&amount=${pageVO.cri.amount}&type=${pageVO.cri.type}&keyword=${pageVO.cri.keyword}"></a> 
    <a class="prevPage" href="board.do?pageNum=${pageVO.startPage - 1}&amount=${pageVO.cri.amount}&type=${pageVO.cri.type}&keyword=${pageVO.cri.keyword}"></a> 

    <c:forEach var="num" begin="${pageVO.startPage}" end="${pageVO.endPage}">
	  <a href="board.do?pageNum=${num}&amount=${pageVO.cri.amount}&type=${pageVO.cri.type}&keyword=${pageVO.cri.keyword}"></a> 			
    </c:forEach>
  
    <a class="nextPage" href="board.do?pageNum=${pageVO.endPage + 1}&amount=${pageVO.cri.amount}&type=${pageVO.cri.type}&keyword=${pageVO.cri.keyword}"></a> 
    <a href="board.do?pageNum=${pageVO.realEnd}&amount=${pageVO.cri.amount}&type=${pageVO.cri.type}&keyword=${pageVO.cri.keyword}"></a> 
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
			
				<div class="col-md-7" style="padding: 0px">
				<div class="modal-detail-left d-flex flex-column">
					<div class="trans_inner">
						<div id="carousel-modal1" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">
						  <div class="carousel-inner">
						    <div class="carousel-item active">
						      <img src="/resources/imgs/long.jpg" alt="...">
						    </div>
						    <div class="carousel-item">
						      <img src="/resources/imgs/img_section/img01.jpg" alt="...">
						    </div>
						    <div class="carousel-item">
						      <img src="/resources/imgs/logo.png" alt="...">
						    </div>
						    <div class="carousel-item">
						      <img src="/resources/imgs/thumb.jpeg" alt="...">
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
				</div>
				
				<div class="col-md-5" style="padding: 0;">
					<div class="modal-detail-right">
						<div class="all-comment">				
								
							<p class="fs-5 mb-3">댓글 리스트</p>
							
							
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
							</div>
							<!-- c:if 대댓글 개수가 1 이상이면 -->
							<div class="mt-3 ms-3 on_cursor">
								<i class="bi bi-arrow-return-right fs-5"></i>
								<span class="cocoment-open ms-3">펼치기 / 접기</span>
							</div>
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
									<span class="hashTag" onclick="location.href='#'">@JSHanulso</span>장수하늘소는 딱정벌레 종류의 곤충 중에서 가장 크며 중국 만주 동북부, 시베리아 우수리 지방 및 우리나라 경기도 광릉지역 등에 분포하고 있다.
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
									<span class="hashTag" onclick="location.href='#'">@JSHanulso</span>장수하늘소는 딱정벌레 종류의 곤충 중에서 가장 크며 중국 만주 동북부, 시베리아 우수리 지방 및 우리나라 경기도 광릉지역 등에 분포하고 있다.
								</div>
							</div>
							
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
							</div>
							<!-- c:if 대댓글 개수가 1 이상이면 -->
							<div class="mt-3 ms-3 on_cursor">
								<i class="bi bi-arrow-return-right fs-5"></i>
								<span class="cocoment-open ms-3">펼치기 / 접기</span>
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
									<span class="hashTag" onclick="location.href='#'">@JSHanulso</span>장수하늘소는 딱정벌레 종류의 곤충 중에서 가장 크며 중국 만주 동북부, 시베리아 우수리 지방 및 우리나라 경기도 광릉지역 등에 분포하고 있다.
								</div>
							</div>
						</div>
						
						<div class="comment-write-div">
							<span class="fs-5 mb-3">댓글 작성</span>
		                    <button class="msg_send_btn float-end" type="button">
		                       <i class="fa fa-paper-plane-o"  aria-hidden="true"></i>
		                    </button>
							<div class="form-floating">
							  <textarea class="form-control" placeholder="Leave a comment here"></textarea>
							</div>
						</div>
						
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div>
<!-- /Modal Test -->

<script type="text/javascript">
	onclick = function deligationFunc(e) {
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
	}
	
	// Side Bar - Hover
	$(".thumb_user").hover(function(){
		$(this).css("background-color", "rgb(204 204 204 / 19%)");
		$(this).children('.msg-link').css("display","block");
	},function(){
		$(this).css("background-color", "#ffffff");
		$(this).children('.msg-link').css("display","none");
	})
	
	// Modal - Detail
	$(".more-comment").on("click", function(){
		$(".modal-background").css("display","block");
	})
	
	$(document).mouseup(function (e){
		var modal = $(".modal-background");
		if( modal.has(e.target).length === 0){
			$(".modal-background").css('display','none');
		}
	});
	
	// 모달 안의 X 버튼에 이벤트를 건다.
	 $('.closeModalBtn').on('click', function(){
		 $('.modal-background').css("display", "none");  
	 });
	
	
	// Infinity Scroll
 	function YesScroll () {
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
	YesScroll()
</script>
<%@ include file="footer.jsp"%>