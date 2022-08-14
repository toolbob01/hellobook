<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div class="container-fluid">
	<div class="container">
		<div class="container-mypage">
			<header class="mypage_header">
				<div class="mypage_thumbnail_a">
					<div class="mypage_thumbnail_b">
						<div class="mypage_thumbnail_c">
							<button class="mypage_thumbnail_d" title="프로필 사진 추가">
								<img alt="프로필 사진 추가" class="mypage_thumbnail_e" src="/resources/imgs/img_section/img02.jpg">
							</button>
							<div>
								<form id="thumbnail_update" enctype="multipart/form-data">
									<input type="hidden" name="nickname" value="${Nname}">
									<input accept="image/jpeg,image/png,image/gif,image/jpg" class="mypage_thumbnail_f" type="file" name="profile">
								</form>
							</div>
							
						</div>
					</div>
				</div>
				<section class="mypage_profile_a">
					<div class="mypage_profile_b">
						<h2 class="mypage_profile_c" tabindex="-1">hellobook</h2>
						<div class="mypage_profile_d">
							<div class="mypage_profile_e">
								<a class="btn btn-primary" href="/mypage/setting/editprofile">프로필 수정</a>
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
					</div>
					<div class="mypage_margin">
						<div></div>
					</div>
					<ul class="mypage_info_a">
						<li class="mypage_info_b">
							<div class="mypage_info_c">
							<a href="#nav-tabContent" style="text-decoration: none;color:#333;">게시물</a>
							<span class="mypage_info_d">0</span>
							</div>
						</li>
						<li class="mypage_info_b">
							<div class="mypage_info_c">
							<a href="/friend/list" style="text-decoration: none;color:#333;">친구</a>
							<span class="mypage_info_d">0</span>
							</div>
						</li>
					</ul>
					<div class="mypage_nickname_a">
						<p style="font-weight:700;">자기소개</p><br>
						<span class="mypage_nickname_b py-3">
							내 이름은 코난 탐정이죵~
						</span>
						<br>
					</div>
					<div class="mypage_nickname_a py-3">
						<p style="font-weight:700;">관심분야</p><br>
						<span class="mypage_nickname_b py-3">
							<span class="badge bg-primary text-white">여행</span>
							<span class="badge bg-secondary text-white">음식</span>
							<span class="badge bg-success text-white">언어</span>
							<span class="badge bg-danger text-white">악기</span>
							<span class="badge bg-warning text-dark">독서</span>
							<span class="badge bg-info text-dark">운동</span>
							<span class="badge bg-light text-dark">사진</span>
							<span class="badge bg-dark text-white">음악</span>
						</span>
						<br>
					</div>
				</section>
			</header>
			<div class="nav nav-tabs mypage_tablist_a" id="nav-tab" role="tablist">
				<button class="mypage_tablist_b" id="nav-post-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-post" aria-selected="true">
					<div class="mypage_tablist_c">
						<img src="https://img.icons8.com/ios-glyphs/30/000000/keypad.png"/>게시물
					</div>
				</button>
				
				<button class="mypage_tablist_b" id="nav-like-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-like" aria-selected="false">
					<div class="mypage_tablist_c">
						<img src="https://img.icons8.com/ios-glyphs/30/000000/filled-like.png"/>좋아요
					</div>
				</button>
			</div>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active mypage_content_a current" id="nav-home" role="tabpanel" aria-labelledby="nav-post-tab" tabindex="0">
					<div class="mypage_content_b">
						<div class="mypage_content_c">
							<div class="mypage_like_a">
								<div class="mypage_content_d">
								<div class="mypage_content_e">
								<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
							        <div class="col">
							          <div class="card shadow-sm posted">
							            
										<img src="/resources/imgs/img_section/img01.jpg" alt="..." width="100%" height="225" id="post9" style="z-index: 0;">
										
										<!-- 자기가 쓴 게시물일 경우만 보이게 sec:authorize access="isAuthenticated()" -->

											<div class="mypage_post_btn" style="position: relative;">
												<a href="/post/post_update"><img src="https://img.icons8.com/ios-glyphs/30/000000/available-updates.png" style="position: absolute; top: -40px; left: 10px; z-index: 5;"/></a>
												<a><img class="go_post" src="https://img.icons8.com/ios-glyphs/30/000000/enter-2.png" style="position: absolute; top: -40px; left: 140px; z-index: 5;"/></a>
								       			<a href="/post/post_delete"><img src="https://img.icons8.com/ios-glyphs/30/000000/delete-forever.png" style="position: absolute; top: -40px; right: 10px; z-index: 5;"/></a>
								          		
								          	</div>

							          	<!-- 게시물 수정 삭제 버튼 -->
							          </div>
							          
							        </div>
							        <div class="col">
							          <div class="card shadow-sm posted">
							            <img src="/resources/imgs/img_section/img02.jpg" alt="..." width="100%" height="225" id="post8">
							
							            <!-- 자기가 쓴 게시물일 경우만 보이게 sec:authorize access="isAuthenticated()" -->
										<div class="mypage_post_btn" style="position: relative;">
											<a href="/post/post_update"><img src="https://img.icons8.com/ios-glyphs/30/000000/available-updates.png" style="position: absolute; top: -40px; left: 10px; z-index: 5;"/></a>
											<a><img class="go_post" src="https://img.icons8.com/ios-glyphs/30/000000/enter-2.png" style="position: absolute; top: -40px; left: 140px; z-index: 5;"/></a>
							       			<a href="/post/post_delete"><img src="https://img.icons8.com/ios-glyphs/30/000000/delete-forever.png" style="position: absolute; top: -40px; right: 10px; z-index: 5;"/></a>
							          		
							          	</div>
							          	<!-- 게시물 수정 삭제 버튼 -->
							          </div>
							          
							        </div>
							        <div class="col">
							          <div class="card shadow-sm posted">
							            <img src="/resources/imgs/img_section/img03.jpg" alt="..." width="100%" height="225" id="post7">
										<!-- 자기가 쓴 게시물일 경우만 보이게 sec:authorize access="isAuthenticated()" -->
										<div class="mypage_post_btn" style="position: relative;">
											<a href="/post/post_update"><img src="https://img.icons8.com/ios-glyphs/30/000000/available-updates.png" style="position: absolute; top: -40px; left: 10px; z-index: 5;"/></a>
											<a><img class="go_post" src="https://img.icons8.com/ios-glyphs/30/000000/enter-2.png" style="position: absolute; top: -40px; left: 140px; z-index: 5;"/></a>
							       			<a href="/post/post_delete"><img src="https://img.icons8.com/ios-glyphs/30/000000/delete-forever.png" style="position: absolute; top: -40px; right: 10px; z-index: 5;"/></a>
							          		
							          	</div>
							          	<!-- 게시물 수정 삭제 버튼 -->
							            
							          </div>
							          
							        </div>
							        <div class="col">
							          <div class="card shadow-sm posted">
							            <img src="/resources/imgs/img_section/img04.jpg" alt="..." width="100%" height="225" id="post6">
										<!-- 자기가 쓴 게시물일 경우만 보이게 sec:authorize access="isAuthenticated()" -->
										<div class="mypage_post_btn" style="position: relative;">
											<a href="/post/post_update"><img src="https://img.icons8.com/ios-glyphs/30/000000/available-updates.png" style="position: absolute; top: -40px; left: 10px; z-index: 5;"/></a>
											<a><img class="go_post" src="https://img.icons8.com/ios-glyphs/30/000000/enter-2.png" style="position: absolute; top: -40px; left: 140px; z-index: 5;"/></a>
							       			<a href="/post/post_delete"><img src="https://img.icons8.com/ios-glyphs/30/000000/delete-forever.png" style="position: absolute; top: -40px; right: 10px; z-index: 5;"/></a>
							          		
							          	</div>
							          	<!-- 게시물 수정 삭제 버튼 -->
							            
							          </div>
							          
							        </div>
							        <div class="col">
							          <div class="card shadow-sm posted">
							            <img src="/resources/imgs/img_section/img05.jpg" alt="..." width="100%" height="225" id="post5">
										<!-- 자기가 쓴 게시물일 경우만 보이게 sec:authorize access="isAuthenticated()" -->
										<div class="mypage_post_btn" style="position: relative;">
											<a href="/post/post_update"><img src="https://img.icons8.com/ios-glyphs/30/000000/available-updates.png" style="position: absolute; top: -40px; left: 10px; z-index: 5;"/></a>
											<a><img class="go_post" src="https://img.icons8.com/ios-glyphs/30/000000/enter-2.png" style="position: absolute; top: -40px; left: 140px; z-index: 5;"/></a>
							       			<a href="/post/post_delete"><img src="https://img.icons8.com/ios-glyphs/30/000000/delete-forever.png" style="position: absolute; top: -40px; right: 10px; z-index: 5;"/></a>
							          		
							          	</div>
							          	<!-- 게시물 수정 삭제 버튼 -->
							            
							          </div>
							          
							        </div>
							        <div class="col">
							          <div class="card shadow-sm posted">
							            <img src="/resources/imgs/thumb.jpeg" alt="..." width="100%" height="225" id="post4">
										<!-- 자기가 쓴 게시물일 경우만 보이게 sec:authorize access="isAuthenticated()" -->
										<div class="mypage_post_btn" style="position: relative;">
											<a href="/post/post_update"><img src="https://img.icons8.com/ios-glyphs/30/000000/available-updates.png" style="position: absolute; top: -40px; left: 10px; z-index: 5;"/></a>
											<a><img class="go_post" src="https://img.icons8.com/ios-glyphs/30/000000/enter-2.png" style="position: absolute; top: -40px; left: 140px; z-index: 5;"/></a>
							       			<a href="/post/post_delete"><img src="https://img.icons8.com/ios-glyphs/30/000000/delete-forever.png" style="position: absolute; top: -40px; right: 10px; z-index: 5;"/></a>
							          		
							          	</div>
							          	<!-- 게시물 수정 삭제 버튼 -->
							            
							          </div>
							          
							        </div>
							        <div class="col">
							          <div class="card shadow-sm posted">
							            <img src="/resources/imgs/logo.png" alt="..." width="100%" height="225" id="post3">
										<!-- 자기가 쓴 게시물일 경우만 보이게 sec:authorize access="isAuthenticated()" -->
										<div class="mypage_post_btn" style="position: relative;">
											<a href="/post/post_update"><img src="https://img.icons8.com/ios-glyphs/30/000000/available-updates.png" style="position: absolute; top: -40px; left: 10px; z-index: 5;"/></a>
											<a><img class="go_post" src="https://img.icons8.com/ios-glyphs/30/000000/enter-2.png" style="position: absolute; top: -40px; left: 140px; z-index: 5;"/></a>
							       			<a href="/post/post_delete"><img src="https://img.icons8.com/ios-glyphs/30/000000/delete-forever.png" style="position: absolute; top: -40px; right: 10px; z-index: 5;"/></a>
							          		
							          	</div>
							          	<!-- 게시물 수정 삭제 버튼 -->
							            
							          </div>
							          
							        </div>
							        <div class="col">
							          <div class="card shadow-sm posted">
							            <img src="/resources/imgs/img_section/img01.jpg" alt="..." width="100%" height="225" id="post2">
										<!-- 자기가 쓴 게시물일 경우만 보이게 sec:authorize access="isAuthenticated()" -->
										<div class="mypage_post_btn" style="position: relative;">
											<a href="/post/post_update"><img src="https://img.icons8.com/ios-glyphs/30/000000/available-updates.png" style="position: absolute; top: -40px; left: 10px; z-index: 5;"/></a>
											<a><img class="go_post" src="https://img.icons8.com/ios-glyphs/30/000000/enter-2.png" style="position: absolute; top: -40px; left: 140px; z-index: 5;"/></a>
							       			<a href="/post/post_delete"><img src="https://img.icons8.com/ios-glyphs/30/000000/delete-forever.png" style="position: absolute; top: -40px; right: 10px; z-index: 5;"/></a>
							          		
							          	</div>
							          	<!-- 게시물 수정 삭제 버튼 -->
							            
							          </div>
							          
							        </div>
							        <div class="col">
							          <div class="card shadow-sm posted">
							            <img src="/resources/imgs/img_section/img02.jpg" alt="..." width="100%" height="225" id="post1">
										<!-- 자기가 쓴 게시물일 경우만 보이게 sec:authorize access="isAuthenticated()" -->
										<div class="mypage_post_btn" style="position: relative;">
											<a href="/post/post_update"><img src="https://img.icons8.com/ios-glyphs/30/000000/available-updates.png" style="position: absolute; top: -40px; left: 10px; z-index: 5;"/></a>
											<a><img class="go_post" src="https://img.icons8.com/ios-glyphs/30/000000/enter-2.png" style="position: absolute; top: -40px; left: 140px; z-index: 5;"/></a>
							       			<a href="/post/post_delete"><img src="https://img.icons8.com/ios-glyphs/30/000000/delete-forever.png" style="position: absolute; top: -40px; right: 10px; z-index: 5;"/></a>
							          		
							          	</div>
							          	<!-- 게시물 수정 삭제 버튼 -->
							            
							          </div>
							          
							        </div>
							      </div>
							      </div>
							  	</div>
						      </div>
						</div>
					</div>
				</div>
				
				
				<div class="tab-pane fade mypage_content_a" id="nav-contact" role="tabpanel" aria-labelledby="nav-like-tab" tabindex="0">
					<div class="mypage_content_b">
						<div class="mypage_content_c">
							<div class="mypage_like_a">
								<div class="mypage_like_b">
									<h1>좋아요한 게시물</h1>
									<p>내가 좋아요한 게시물 리스트를 보여줍니다.</p>
									<span>현재 내가 좋아요한 게시물이 없습니다.</span>
								</div>
							</div>
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
		          <strong class="mb-1" style="margin:auto;">프로필 수정</strong>
		        </div>
		      </a>
		      <a href="/mypage/setting/changepwd" class="list-group-item list-group-item-action py-3 lh-sm">
		        <div class="d-flex w-100 align-items-center justify-content-between">
		          <strong class="mb-1" style="margin:auto;">비밀번호 변경</strong>
		        </div>
		      </a>
		      <a href="/mypage/setting/quit" class="list-group-item list-group-item-action py-3 lh-sm">
		        <div class="d-flex w-100 align-items-center justify-content-between">
		          <strong class="mb-1" style="margin:auto;">회원탈퇴</strong>
		        </div>
		      </a>
		
		      <a href="/mypage/setting/report" class="list-group-item list-group-item-action py-3 lh-sm">
		        <div class="d-flex w-100 align-items-center justify-content-between">
		          <strong class="mb-1" style="margin:auto;">문제 신고</strong>
		
		        </div>
		
		      </a>
		      <a href="/member/logout" class="list-group-item list-group-item-action py-3 lh-sm">
		        <div class="d-flex w-100 align-items-center justify-content-between">
		          <strong class="mb-1" style="margin:auto;">로그아웃</strong>
		
		        </div>
		
		      </a>
		      <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
		        <div class="d-flex w-100 align-items-center justify-content-between">
		          <strong class="mb-1" style="margin:auto;">취소</strong>
		
		        </div>
		
		      </a>
		      
		    </div>
		  </div>
      </div>
    <!-- </div> -->
  </div>
</div>

<!-- Post Modal -->
<div class="modal modal-hide fade py-5" tabindex="-1" role="dialog" id="postmodal" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-4 shadow">
      <div class="modal-body p-5">
      	<div class="modal-detail">
		<div class="container-fluid">
			<div class="row">
			
							<div class="col-md-7" style="padding: 0px">
							<div class="modal-detail-left d-flex flex-column">
								<div class="trans_inner">
									<div id="carousel-modal1" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">
									  <div class="carousel-inner">
									    <div class="carousel-item active">
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
 
 $('.go_post').on('click', function(){
	 $('#postmodal').modal('show');
 });
 
 $('.mypage_thumbnail_f').on("change",function() {
	 $('#thumbnail_update').attr("action","/mypage/thumbnailUpdate");
	 $('#thumbnail_update').attr("method","post");
	 $('#thumbnail_update').submit();
 });
 
 
</script>
<%@ include file="../footer.jsp" %>