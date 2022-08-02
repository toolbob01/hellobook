<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<head>
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/style.css">
</head>
<div class="container-fluid">
	<div class="container">
		<div class="row post-main-view-row">


			<!-- post -->
			<div class="col-lg-7">
				<div class="row post-box">
					<article class="contents">
						<!-- post 헤더 -->
						<header class="top post-header">
							<div class="user_container">
								<div class="profile_img">
									<img src="/resources/imgs/thumb.jpeg" alt="프로필이미지">
								</div>
								<div class="user_name">
									<div class="nick_name m_text">Hellobook</div>
									<div class="country s_text">Seoul, South Korea</div>
								</div>
							</div>
							<div class="sprite_more_icon" data-name="more"></div>
						</header>

						<!-- post 바디(이미지나 동영상 등 내용 입력 -->
						<div class="img_section">
							<div class="trans_inner">
								<div>
									<img src="/resources/imgs/img_section/img01.jpg" alt="visual01">
								</div>
							</div>
						</div>

						<!-- post 아이콘(좋아요, 댓글, 공유 // 책갈피 기능) -->
						<div class="bottom_icons">
							<div class="right_icon">
								<div class="heart_btn">
									<div class="sprite_heart_icon_outline" name="39"
										data-name="heartbeat"><span>39</span></div>

								</div>
								
							</div>
						
							<div class="left_icons">
								<div class="sprite_bubble_icon"></div>
								<div class="sprite_share_icon" data-name="share"></div>
<!-- 								<div class="sprite_bookmark_outline" data-name="bookmark"></div> -->
							</div>
						</div>

						<div class="likes m_text">
							좋아요 <span id="count">50</span>개
						</div>

						<!-- post 댓글 div -->
						<div class="comment_container">
							<div class="comment">
								<div class="nick_name m_text">jgc</div>
								<div class="real_comment">강아지가 너무 귀여워요!강아지가 너무 귀여워요!강아지가 너무 귀여워요!강아지가 너무 귀여워요!강아지가 너무 귀여워요!</div>
							</div>
							<div class="comment">
								<div class="nick_name m_text">long name userrrrrrrrrrr</div>
								<div>강아지가 너무 귀여워요!</div>
							</div>
							<div class="comment">
								<div class="nick_name m_text">Hong Gil Dong</div>
								<div>강아지가 너무 귀여워요!</div>
							</div>
							<p class="more_comment_dot">...</p>
<!-- 							<div class="small_heart_btn"> -->
<!-- 								<div class="sprite_small_heart_icon_outline" -->
<!-- 									data-name="commentheart"></div> -->
<!-- 							</div> -->
						</div>

						<div class="timer">36분 전</div>

					</article>

					<article class="contents">
						<!-- post 헤더 -->
						<header class="top post-header">
							<div class="user_container">
								<div class="profile_img">
									<img src="/resources/imgs/thumb.jpeg" alt="프로필이미지">
								</div>
								<div class="user_name">
									<div class="nick_name m_text">Hellobook</div>
									<div class="country s_text">Seoul, South Korea</div>
								</div>
							</div>
							<div class="sprite_more_icon" date-name="more"></div>
						</header>

						<!-- post 바디(이미지나 동영상 등 내용 입력 -->
						<div class="img_section">
							<div class="trans_inner">
								<div>
									<img src="resources/imgs/img_section/img01.jpg" alt="visual01">
								</div>
							</div>
						</div>

						<!-- post 아이콘(좋아요, 댓글, 공유 // 책갈피 기능) -->
						<div class="bottom_icons">
							<div class="left_icons">
								<div class="heart_btn">
									<div class="sprite_heart_icon_outline" name="39"
										data-name="heartbeat"></div>

								</div>
								<div class="sprite_bubble_icon"></div>
								<div class="sprite_share_icon" data-name="share"></div>
							</div>

							<div class="right_icon">
								<div class="sprite_bookmark_outline" data-name="bookmark"></div>
							</div>

						</div>

						<div class="likes m_text">
							좋아요 <span id="count">50</span>개
						</div>

						<!-- post 댓글 div -->
						<div class="comment_container">
							<div class="comment">
								<div class="nick_name m_text">beak1</div>
								<div>강아지가 너무 귀여워요!</div>
							</div>
<!-- 							<div class="small_heart_btn"> -->
<!-- 								<div class="sprite_small_heart_icon_outline" -->
<!-- 									data-name="commentheart"></div> -->
<!-- 							</div> -->
						</div>

						<div class="timer">36분 전</div>

					</article>

				</div>
			</div>
			<!-- //post -->


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
							<div>스토리</div>
							<div class="more">모두 보기</div>
						</header>

						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb">
									<img src="/resources/imgs/thumb02.jpg" alt="프로필사진">
								</div>

								<div class="detail">
									<div class="id">hellobook</div>
									<div class="time">1시간 전</div>
								</div>
							</div>
						</div>
						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb">
									<img src="/resources/imgs/thumb02.jpg" alt="프로필사진">
								</div>

								<div class="detail">
									<div class="id">hellobook</div>
									<div class="time">1시간 전</div>
								</div>
							</div>
						</div>
						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb">
									<img src="resources/imgs/thumb02.jpg" alt="프로필사진">
								</div>

								<div class="detail">
									<div class="id">hellobook</div>
									<div class="time">1시간 전</div>
								</div>
							</div>
						</div>
					</article>

					<article class="recommend">
						<header class="reco_header">
							<div>회원님을 위한 추천</div>
							<div class="more">모두 보기</div>
						</header>

						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb">
									<img src="/resources/imgs/thumb02.jpg" alt="프로필사진">
								</div>

								<div class="detail">
									<div class="id">hellobook</div>
									<div class="time">1시간 전</div>
								</div>
							</div>
						</div>
						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb">
									<img src="/resources/imgs/thumb02.jpg" alt="프로필사진">
								</div>

								<div class="detail">
									<div class="id">hellobook</div>
									<div class="time">1시간 전</div>
								</div>
							</div>
						</div>
						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb">
									<img src="/resources/imgs/thumb02.jpg" alt="프로필사진">
								</div>

								<div class="detail">
									<div class="id">hellobook</div>
									<div class="time">1시간 전</div>
								</div>
							</div>
						</div>
					</article>
				</div>
			</div>

		</div>
	</div>
</div>

<script type="text/javascript">
	onclick = function deligationFunc(e) {
		let elem = e.target;
		if(elem.getAttribute('data-name') == null){
			elem = null;
			return;
		}
// 		while (!elem.getAttribute('data-name')) {
// 			elem = elem.parentNode;
// 			if (elem.nodeName === 'BODY') {
// 				elem = null;
// 				return;
// 			}
// 		} 

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
</script>
<%@ include file="footer.jsp"%>