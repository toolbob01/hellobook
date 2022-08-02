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
									<input accept="image/jpeg,image/png" class="mypage_thumbnail_f" type="file">
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
								<a class="mypage_profile_f" href="#">프로필 편집</a>
							</div>
						</div>
						<div class="mypage_profile_g">
							<button class="mypage_profile_h" type="button">
								<div class="mypage_profule_i">
									<img src="https://img.icons8.com/ios-glyphs/30/000000/gear.png"/>
								</div>
							</button>
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
				<button class="mypage_tablist_b" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">
					<div class="mypage_tablist_c">
						<img src="https://img.icons8.com/ios-glyphs/30/000000/keypad.png"/>게시물
					</div>
				</button>
				<button class="mypage_tablist_b" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">
					<div class="mypage_tablist_c">
						<img src="https://img.icons8.com/ios-glyphs/30/000000/save--v1.png"/>저장됨
					</div>
				</button>
				<button class="mypage_tablist_b" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">
					<div class="mypage_tablist_c">
						<img src="https://img.icons8.com/ios-glyphs/30/000000/filled-like.png"/>좋아요
					</div>
				</button>
			</div>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active mypage_content_a current" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
					<div class="mypage_content_b">
						<div class="mypage_content_c">
							게시물
						</div>
					</div>
				</div>
				
				<div class="tab-pane fade mypage_content_a" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
					<div class="mypage_content_b">
						<div class="mypage_content_c">
							저장됨
						</div>
					</div>
				</div>
				
				<div class="tab-pane fade mypage_content_a" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">
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
<%@ include file="../footer.jsp" %>