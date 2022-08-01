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
		</div>
	</div>
</div>
<%@ include file="../footer.jsp" %>