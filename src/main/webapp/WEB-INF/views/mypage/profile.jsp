<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); 
%>
<%@ include file="../header.jsp" %>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<div class="container-fluid">
	<div class="container">
		<div class="container-mypage">
			<header class="mypage_header">
				<div class="mypage_thumbnail_a">
					<div class="mypage_thumbnail_b">
						<div class="mypage_thumbnail_c">
							<c:if test="${mvo.email == username}">
							<c:if test="${mvo.profile==null}">
							<button class="mypage_thumbnail_d" title="<spring:message code="profile.createThumbnail"/>">
									<img class="mypage_thumbnail_e" src="/resources/imgs/unknown_thumbnail.jpg">
							</button>
							</c:if>
							<c:if test="${mvo.profile!=null}">
							<button class="mypage_thumbnail_d" title="<spring:message code="profile.updateThumbnail"/>">
									<img class="mypage_thumbnail_e" src="/hello_img/member/${mvo.profile}">
							</button>
							</c:if>
							<div>
								<form id="thumbnail_update" enctype="multipart/form-data">
									<input type="hidden" name="nickname" value="${Nname}">
									<sec:csrfInput/>
									<input accept="image/jpeg,image/png,image/gif,image/jpg" class="mypage_thumbnail_f" type="file" name="profile">
								</form>
							</div>
							</c:if>
							<c:if test="${mvo.email != username}">
							<c:if test="${mvo.profile==null}">
							<div class="mypage_thumbnail_d_2">
								<img class="mypage_thumbnail_e" src="/resources/imgs/unknown_thumbnail.jpg">
							</div>
							</c:if>
							<c:if test="${mvo.profile!=null}">
							<div class="mypage_thumbnail_d_2">
								<img class="mypage_thumbnail_e" src="/hello_img/member/${mvo.profile}">
							</div>
							</c:if>
							<div>
								<form>
									<input accept="image/jpeg,image/png" class="mypage_thumbnail_f" type="file" name="image">
								</form>
							</div>
							</c:if>
							
						</div>
					</div>
				</div>
				<section class="mypage_profile_a">
					<div class="mypage_profile_b">
						<h2 class="mypage_profile_c" tabidex="-1">${mvo.nickname}</h2>
						<c:if test="${mvo.email == username}">
						<div class="mypage_profile_d">
							<div class="mypage_profile_e">
								<a class="btn btn-primary" href="/mypage/setting/editprofile"><spring:message code="profile.editProfileBtn"/></a>
							</div>
						</div>
						<div class="mypage_profile_g">
							<form id="mypage_profile_frm">
							<button class="mypage_profile_h" type="button">
								<div class="mypage_profule_i">
									<img src="https://img.icons8.com/ios-glyphs/30/000000/gear.png"/>
								</div>
							</button>
							</form>
						</div>
						</c:if>
					</div>
					<div class="mypage_margin">
						<div></div>
					</div>
					<ul class="mypage_info_a">
						<li class="mypage_info_b">
							<div class="mypage_info_c">
							<a href="#nav-tabContent" style="text-decoration: none;color:#000;"><spring:message code="profile.post"/></a>
							<span class="mypage_info_d">0</span>
							</div>
						</li>
						<li class="mypage_info_b">
							<div class="mypage_info_c">
							<a href="/friend/list" style="text-decoration: none;color:#000;"><spring:message code="profile.friend"/></a>
							<span class="mypage_info_d">0</span>
							</div>
						</li>
					</ul>
					<div class="mypage_nickname_a">
						<p style="color: #000;"><spring:message code="profile.introduce"/></p><br>
						<span class="mypage_nickname_b py-3">
							${mvo.intro}
						</span>
						<br>
					</div>
					<div class="mypage_nickname_a py-3">
						<p style="color: #000;"><spring:message code="profile.hobby"/></p><br>
						<span class="mypage_nickname_b py-3">
							<c:if test = "${fn:contains(mvo.hobby,1)}">
								<span class="badge bg-primary text-white"><spring:message code="profile.hobby.tour"/></span>
							</c:if>
							<c:if test = "${fn:contains(mvo.hobby,2)}">
								<span class="badge bg-secondary text-white"><spring:message code="profile.hobby.food"/></span>
							</c:if>
							<c:if test = "${fn:contains(mvo.hobby,3)}">
								<span class="badge bg-success text-white"><spring:message code="profile.hobby.lang"/></span>
							</c:if>
							<c:if test = "${fn:contains(mvo.hobby,4)}">
								<span class="badge bg-danger text-white"><spring:message code="profile.hobby.inst"/></span>
							</c:if>
							<c:if test = "${fn:contains(mvo.hobby,5)}">
								<span class="badge bg-warning text-dark"><spring:message code="profile.hobby.read"/></span>
							</c:if>
							<c:if test = "${fn:contains(mvo.hobby,6)}">
								<span class="badge bg-info text-dark"><spring:message code="profile.hobby.workout"/></span>
							</c:if>
							<c:if test = "${fn:contains(mvo.hobby,7)}">
								<span class="badge bg-dark text-white"><spring:message code="profile.hobby.photo"/></span>
							</c:if>
							<c:if test = "${fn:contains(mvo.hobby,8)}">
								<span class="badge bg-primary text-white"><spring:message code="profile.hobby.music"/></span>
							</c:if>
							<c:if test = "${fn:contains(mvo.hobby,9)}">
								<span class="badge bg-secondary text-white"><spring:message code="profile.hobby.animal"/></span>
							</c:if>
						</span>
						<br>
					</div>
				</section>
			</header>
			<div class="nav nav-tabs mypage_tablist_a" id="nav-tab" role="tablist">
				<button class="mypage_tablist_b" id="nav-post-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-post" aria-selected="true">
					<div class="mypage_tablist_c">
						<img src="https://img.icons8.com/ios-glyphs/30/000000/keypad.png"/><spring:message code="profile.mypost"/>
					</div>
				</button>
				<c:if test="${mvo.email == username}">
				<button class="mypage_tablist_b" id="nav-like-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-like" aria-selected="false">
					<div class="mypage_tablist_c">
						<img src="https://img.icons8.com/ios-glyphs/30/000000/filled-like.png"/><spring:message code="profile.mylike"/>
					</div>
				</button>
				</c:if>
			</div>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active mypage_content_a current" id="nav-home" role="tabpanel" aria-labelledby="nav-post-tab" tabindex="0">
					<div class="mypage_content_b">
						<div class="mypage_content_c">
							<c:if test="${pvoList.size()==0}">
								<div class="mypage_like_a">
									<div class="mypage_like_b">
										<h1><spring:message code="profile.empty.post1"/></h1>
										<p><spring:message code="profile.empty.post2"/></p>
										<span><spring:message code="profile.empty.post3"/></span>
									</div>
								</div>
							</c:if>
							<c:if test="${pvoList.size()!=0}">
								<div class="mypage_like_a">
								<div class="mypage_content_d">
								<div class="mypage_content_e">
								<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
							        
							        
							        <c:forEach var="PostVO" items="${pvoList}">
							        	<div class="col">
								          <div class="card shadow-sm posted">
								            <img src="/hello_img/post/${PostVO.file_list[0].uuid}" alt="..." width="100%" height="225">
											<div class="mypage_post_btn" style="position: relative;">
													<c:if test="${PostVO.email == username}">
													<a href="/post/post_update?pno=${PostVO.pno}&email=${username}" onclick="return confirm('${PostVO.pno}번 게시물을 수정하시겠습니까?')"><img src="https://img.icons8.com/ios-glyphs/30/000000/available-updates.png" style="position: absolute; top: -40px; left: 10px; z-index: 5;"/></a>
													</c:if>
													<a><img class="go_post" src="https://img.icons8.com/ios-glyphs/30/000000/enter-2.png" style="position: absolute; top: -40px; left: 140px; z-index: 5;" data-pno="${PostVO.pno}"/></a>
													<c:if test="${PostVO.email == username}">
									       			<a href="/post/post_delete?pno=${PostVO.pno}&email=${username}" onclick="return confirm('${PostVO.pno}번 게시물을 삭제하시겠습니까?')"><img src="https://img.icons8.com/ios-glyphs/30/000000/delete-forever.png" style="position: absolute; top: -40px; right: 10px; z-index: 5;"/></a>
									       			</c:if>
									          		
									          	</div>
								            
								          </div>
								          
								        </div>
							        </c:forEach>
							        
							      </div>
							      </div>
							  	</div>
						      </div>
							</c:if>
							
						</div>
					</div>
				</div>
				
				
				<div class="tab-pane fade mypage_content_a" id="nav-contact" role="tabpanel" aria-labelledby="nav-like-tab" tabindex="0">
					<div class="mypage_content_b">
						<div class="mypage_content_c">
							<c:if test="${likeList.size()==0}">
								<div class="mypage_like_a">
									<div class="mypage_like_b">
										<h1><spring:message code="profile.empty.like1"/></h1>
										<p><spring:message code="profile.empty.like2"/></p>
										<span><spring:message code="profile.empty.like3"/></span>
									</div>
								</div>
							</c:if>
							<c:if test="${likeList.size()!=0}">
								<div class="mypage_like_a">
								<div class="mypage_content_d">
								<div class="mypage_content_e">
								<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
							        
							        
							        <c:forEach var="LikeVO" items="${likeList}">
							        	<div class="col">
								          <div class="card shadow-sm posted">
								            <img src="/hello_img/post/${LikeVO.file_list[0].uuid}" alt="..." width="100%" height="225">
											<div class="mypage_post_btn" style="position: relative;">
													<c:if test="${LikeVO.email == username}">
													<a href="/post/post_update?pno=${LikeVO.pno}&email=${username}"><img src="https://img.icons8.com/ios-glyphs/30/000000/available-updates.png" style="position: absolute; top: -40px; left: 10px; z-index: 5;"/></a>
													</c:if>
													<a><img class="go_post" src="https://img.icons8.com/ios-glyphs/30/000000/enter-2.png" style="position: absolute; top: -40px; left: 140px; z-index: 5;" data-pno="${LikeVO.pno}"/></a>
													<c:if test="${LikeVO.email == username}">
									       			<a href="/post/post_delete?pno=${LikeVO.pno}&email=${username}"><img src="https://img.icons8.com/ios-glyphs/30/000000/delete-forever.png" style="position: absolute; top: -40px; right: 10px; z-index: 5;"/></a>
									       			</c:if>
									          		
									          	</div>
								            
								          </div>
								          
								        </div>
							        </c:forEach>
							        
							      </div>
							      </div>
							  	</div>
						      </div>
							</c:if>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal modal-hide fade py-5" tabindex="-1" role="dialog" id="mypagemodal" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-4 shadow">
      <!-- <div class="modal-body p-5"> -->
      	<div class="d-flex flex-column align-items-stretch flex-shrink-0">
		
		    <div class="list-group list-group-flush border-bottom scrollarea mp-st-sidebar_b">
		      <a href="/mypage/setting/editprofile" class="list-group-item list-group-item-action py-3 lh-sm">
		        <div class="d-flex w-100 align-items-center justify-content-between">
		          <strong class="mb-1" style="margin:auto;"><spring:message code="profile.link.editProfile"/></strong>
		        </div>
		      </a>
		      <a href="/mypage/setting/changepwd" class="list-group-item list-group-item-action py-3 lh-sm">
		        <div class="d-flex w-100 align-items-center justify-content-between">
		          <strong class="mb-1" style="margin:auto;"><spring:message code="profile.link.changePwd"/></strong>
		        </div>
		      </a>
		      <a href="/mypage/setting/quit" class="list-group-item list-group-item-action py-3 lh-sm">
		        <div class="d-flex w-100 align-items-center justify-content-between">
		          <strong class="mb-1" style="margin:auto;"><spring:message code="profile.link.quit"/></strong>
		        </div>
		      </a>
		
		      <a href="/mypage/setting/report" class="list-group-item list-group-item-action py-3 lh-sm">
		        <div class="d-flex w-100 align-items-center justify-content-between">
		          <strong class="mb-1" style="margin:auto;"><spring:message code="profile.link.report"/></strong>
		
		        </div>
		
		      </a>
		      <form action="/member/logout" method="post">
		      <sec:csrfInput/>
		      <button class="list-group-item list-group-item-action py-3 lh-sm mp-logout">
		        <div class="d-flex w-100 align-items-center justify-content-between">
		          <strong class="mb-1" style="margin:auto;"><spring:message code="profile.link.logout"/></strong>
		
		        </div>
		
		      </button>
		      </form>
		      <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
		        <div class="d-flex w-100 align-items-center justify-content-between">
		          <strong class="mb-1" style="margin:auto;"><spring:message code="profile.link.cancel"/></strong>
		
		        </div>
		
		      </a>
		      
		    </div>
		  </div>
      </div>
    <!-- </div> -->
  </div>
</div>

<!-- Post Modal -->
<div class="modal-background" id="postmodal">
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
		<!-- 									<div class="comment-time align-self-center mx-5">1<spring:message code="timer.hour"/></div> -->
										</div>
										
										<div class="modal-posting-master-content">
		<!-- 									 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! 여기는 두줄 이상 안잘림 ! 자동 개행 ! aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa -->
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
				<span class="fs-5 mb-3"><spring:message code="postmodal.writeComment"/></span>
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



<script>
 $(document).ready(function() {
	 $('.mypage_thumbnail_d').click(function() {
		 $('.mypage_thumbnail_f').click();
	 });
	 
	 $('.posted').hover(function() {
		 $(this).find($('.mypage_post_btn')).css('display','block');
	 },function() {
		 $(this).find($('.mypage_post_btn')).css('display','none');
	 });
 });
 
 $('.mypage_profile_h').on('click', function(){
	 $('#mypagemodal').modal('show');
 });
 // 모달 안의 취소 버튼에 이벤트를 건다.
 $('#closeModalBtn').on('click', function(){
	 $('#mypagemodal').modal('hide');  
 });
 
 $('.go_post').on('click', function(e){
		var nowPno = $(this).data("pno");
		e.preventDefault();
		// AJAX action
		$.ajax({
			type:"get",
			url:"/post/post_detail_modal?pno=" + nowPno,
			dataType:"json",
			success:function(PostVO){
				// carousel main
				$("#carousel-inner").append('<div class="carousel-item active">' + 
							      			'<img src="/hello_img/post/' + PostVO.file_list[0].uuid + '" alt="...">' + 
									    	'</div>');
				// carousel each from index 1 ~
				if( PostVO.file_list[1] != null ) {
					$.each(PostVO.file_list, function(i, fileVO){
						if(i>0) {
							$("#carousel-inner").append('<div class="carousel-item">' + 
								      						'<img src="/hello_img/post/' + fileVO.uuid + '" alt="...">' + 
								    					'</div>');
						}
					});
				}
				// Profile    
 				var comment_profile = '<img class="comment-profile-img on_cursor" src="/hello_img/member/' + PostVO.profile + '" alt="프로필사진">' + 
									  '<div class="comment-profile-flag">';
				if( PostVO.language == 'J' ) {
					comment_profile +=   '<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>' +  
									   '</div>' + 
									   '<div class="comment-name on_cursor align-self-center">' + PostVO.nickname + '</div>';
				}else {
					comment_profile +=   '<img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/>' + 
									   '</div>' + 
									   '<div class="comment-name on_cursor align-self-center">' + PostVO.nickname + '</div>';
				} 
				var cpt = PostVO.timer.slice(0, -1);
				var cpt_1 = PostVO.timer.slice(-1);
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
				$(".modal-posting-master-content").html(PostVO.content);
				// Comment List
 				$(".all-comment").append('<p class="fs-5 mb-3"><spring:message code="postmodal.commentList"/></p>');
				if( PostVO.reply_list[0] == null ) {
					$(".all-comment").append('<p class="fs-6 text-center mt-5">아직 댓글이 없습니다.</p>');
				}else {
					$.each(PostVO.reply_list, function(i, replyVO){
		 				$(".all-comment").append('<div class="comment-profile d-flex" id="comment-profile' + replyVO.repno + '"></div>' + 
	    				 						 '<div class="comment-content" id="comment-content' + replyVO.repno + '"></div>');
						var all_comment_profile = '<img class="comment-profile-img on_cursor" src="/hello_img/member/' + replyVO.profile + '" alt="프로필사진">' + 
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
									    	   '<div class="comment-name on_cursor align-self-center">' + replyVO.nickname + '</div>' + 
									    	   '<div class="comment-time align-self-center mx-5">' + acpt + '</div>' + 
									    	   '<div class="comment-cocoment align-self-center">답글 달기</div>';
			    	    $(".all-comment #comment-profile"+replyVO.repno).append(all_comment_profile);
						$(".all-comment #comment-content"+replyVO.repno).html(replyVO.rcontent);
						// Open&Close coComent script use id="collapse + replyVO.repno"
  	 					if( replyVO.cocomment_list[0] != null ){
							$(".all-comment #comment-content"+replyVO.repno).append('<div class="comment-accordion on_cursor mt-3 ms-3" data-bs-toggle="collapse" data-bs-target="#collapse' + replyVO.repno + '" aria-expanded="false">' + 
																	      				'<i class="bi bi-arrow-return-right fs-5"></i>' + 
																	      				'<span class="cocoment-open ms-3" data-oc="c">펼치기</span>' + 
																      				'</div>');
							$(".all-comment #comment-content"+replyVO.repno).append('<div class="collapse" id="collapse' + replyVO.repno + '"></div>');
 							$.each(replyVO.cocomment_list, function(k, cocommentVO) {
								var all_comment_collapse = '<div class="comment-depth">' + 
													         '<div class="comment-profile d-flex">' + 
													           '<img class="comment-profile-img on_cursor" src="/hello_img/member/' + cocommentVO.profile + '" alt="프로필사진">' + 
													           '<div class="comment-profile-flag">';
				                if( cocommentVO.language == 'J' ){  
				                	all_comment_collapse += '<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>';
				                }else{
				                	all_comment_collapse += '<img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/>';
				                }
				                all_comment_collapse += '</div>' + 
						           						'<div class="comment-name on_cursor align-self-center">' + cocommentVO.nickname + '</div>';
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
 							})
						}  
					}) // each
				} // reply_list[0] else
				
				// Comment Write Div's data-pno
				$(".comment-write-div .msg_send_btn").data("pno", PostVO.pno);
				// Display Block
				 $('#postmodal').css("display","block");
			}, error:function(){
				alert("Error - Post Detail Up");
			}
		});
		
		// Click 'background' to make display none
		$(document).mouseup(function (e){
			var modal = $(".modal-background");
			if( modal.has(e.target).length === 0){
				$(".modal-background").css('display','none');
				$("#carousel-inner").empty();
				$(".modal-detail-contents .comment-profile").empty();
				$(".modal-posting-master-content").html("");
				$(".all-comment").empty();
			}
		});
		
		// Click 'X' in Detail Modal to make display none
		 $('.closeModalBtn').on('click', function(){
			 $('.modal-background').css("display", "none");  
			 $("#carousel-inner").empty();
			 $(".modal-detail-contents .comment-profile").empty();
			 $(".modal-posting-master-content").html("");
			 $(".all-comment").empty();
		 });
		
		
		// Coment Insert
		$(".msg_send_btn").off().on("click", function(e){		
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
					return true; 
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
					success : function(data){
						if( data.depth == '2' ) {
							console.log(data);
							alert('This is Depth 2 coment !!!');
						} else {
							// if depth : 1
							$(".all-comment > p").remove();
	 		 				$(".all-comment").prepend('<p class="fs-5 mb-3">댓글 리스트</p>' + 
	 		 										 '<div class="comment-profile d-flex" id="comment-profile' + data.repno + '"></div>' + 
			 						 				 '<div class="comment-content" id="comment-content' + data.repno + '"></div>');
	 		 				var insert_all_comment_profile = '<img class="comment-profile-img on_cursor" src="/hello_img/member/' + data.profile + '" alt="프로필사진">' + 
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
					    	  							  '<div class="comment-cocoment align-self-center">답글 달기</div>';
							$(".all-comment #comment-profile"+data.repno).append(insert_all_comment_profile);
							$(".all-comment #comment-content"+data.repno).html(data.rcontent);
						}
						$("#commentInsert").val("");
					}, error:function(){
						alert("Error - Comment Insert ! ");
					}
				});
			}
		});
		
		
		// coComment Open Close
		$(".cocoment-open").on("click", function() {
			if( $(this).data("oc") == 'c' ){
				$(this).data("oc", "o")
				$(this).html("접기");
			}else {
				$(this).data("oc", "c")
				$(this).html("펼치기");
			}
		});
	
 });
 
 $('.mypage_thumbnail_f').on("change",function() {
	 var nickname = '<%=(String)session.getAttribute("Nname")%>'
	 $('#thumbnail_update').attr("action","/mypage/thumbnailUpdate/"+nickname);
	 $('#thumbnail_update').attr("method","post");
	 $('#thumbnail_update').submit();
 });
 
 $('.mp-logout').on("click",function() {
	 
 });
 
</script>
<%@ include file="../footer.jsp" %>