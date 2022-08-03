<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="/resources/css/mypage.css">
<div class="container-fluid">
	<div class="container">
		<div class="container-mypage">
			<header class="mypage_header">
				<div class="mypage_thumbnail_a">
					<div class="mypage_thumbnail_b">
						<div class="mypage_thumbnail_c">
							<button class="mypage_thumbnail_d" title="프로필 사진 추가">
								<img alt="프로필 사진 추가" class="mypage_thumbnail_e" src="/resources/imgs/thumb.jpeg">
							</button>
							<div>
								<form>
									<input accept="image/jpeg,image/png" class="mypage_thumbnail_f" type="file" name="image">
								</form>
							</div>
							
						</div>
					</div>
				</div>
				<section class="mypage_profile_a">
					<div class="mypage_profile_b">
						<h2 class="mypage_profile_c" tabidex="-1">hellobook</h2>
						<div class="mypage_profile_d">
							<div class="mypage_profile_e">
								<a class="mypage_profile_f" href="/mypage/setting">프로필 수정</a>
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
							게시물
							<span class="mypage_info_d">0</span>
							</div>
						</li>
						<li class="mypage_info_b">
							<div class="mypage_info_c">
							친구
							<span class="mypage_info_d">0</span>
							</div>
						</li>
					</ul>
					<div class="mypage_nickname_a">
						<span class="mypage_nickname_b">
							홍길동
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
				<button class="mypage_tablist_b" id="nav-saved-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-saved" aria-selected="false">
					<div class="mypage_tablist_c">
						<img src="https://img.icons8.com/ios-glyphs/30/000000/save--v1.png"/>저장됨
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
							<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
						        <div class="col">
						          <div class="card shadow-sm">
						            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect> </svg>
						
						           
						          </div>
						        </div>
						        <div class="col">
						          <div class="card shadow-sm">
						            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect> </svg>
						
						            
						          </div>
						        </div>
						        <div class="col">
						          <div class="card shadow-sm">
						            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect> </svg>
						
						            
						          </div>
						        </div>
						        <div class="col">
						          <div class="card shadow-sm">
						            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect> </svg>
						
						            
						          </div>
						        </div>
						        <div class="col">
						          <div class="card shadow-sm">
						            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect> </svg>
						
						            
						          </div>
						        </div>
						        <div class="col">
						          <div class="card shadow-sm">
						            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect> </svg>
						
						            
						          </div>
						        </div>
						        <div class="col">
						          <div class="card shadow-sm">
						            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect> </svg>
						
						            
						          </div>
						        </div>
						        <div class="col">
						          <div class="card shadow-sm">
						            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect> </svg>
						
						            
						          </div>
						        </div>
						        <div class="col">
						          <div class="card shadow-sm">
						            <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect></svg>
						
						            
						          </div>
						        </div>
						      </div>
						</div>
					</div>
				</div>
				
				<div class="tab-pane fade mypage_content_a" id="nav-profile" role="tabpanel" aria-labelledby="nav-saved-tab" tabindex="0">
					<div class="mypage_content_b">
						<div class="mypage_content_c">
							저장됨
						</div>
					</div>
				</div>
				
				<div class="tab-pane fade mypage_content_a" id="nav-contact" role="tabpanel" aria-labelledby="nav-like-tab" tabindex="0">
					<div class="mypage_content_b">
						<div class="mypage_content_c">
							좋아요
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
      <div class="modal-body p-5">
      	<button type="button" class="btn btn-lg btn-hellobook mt-5 w-100" data-bs-dismiss="modal">프로필 수정</button>
        <button type="button" class="btn btn-lg btn-hellobook mt-5 w-100" data-bs-dismiss="modal">로그아웃</button>
        <button type="button" class="btn btn-lg btn-hellobook mt-5 w-100" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<script>
 $(document).ready(function() {
	 $('.mypage_thumbnail_d').click(function() {
		 $('.mypage_thumbnail_f').click();
	 });
 });
 
 $('.mypage_profile_h').on('click', function(){
	 $('#mypagemodal').modal('show');
 });
 // 모달 안의 취소 버튼에 이벤트를 건다.
 $('#closeModalBtn').on('click', function(){
	 $('#mypagemodal').modal('hide');  
 });
 
 
</script>
<%@ include file="../footer.jsp" %>