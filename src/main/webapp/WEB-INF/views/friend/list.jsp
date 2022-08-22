<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
#friendlist {
	justify-content: center;
	align-items: center;
	width: 100%;
	background-color: white;
	
}

.friend {
	width: 700px;
	top: 0;
	left: 0;
	display: grid;
	grid-template-columns: 1.5rem 1.25rem auto 3rem;
	grid-template-rows: 1.875rem 3.125rem auto 6.25rem;
	gap: 0;
	align-items: stretch;
	grid-template-areas: "nav  .  setting  . " "nav  .   header  . "
		"nav  .    main   . ";
		background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

.friendlist_header {
	grid-area: header;
	position: static;
	top: 30px;
	background-color: white;
}

.friendlist_header>* {
	line-height: 50px;
	vertical-align: middle;
}

/* 메인 스타일 지정 */
/* 친구 리스트 부분*/
.friendlist_main {
	grid-area: main;
	display: flex;
	flex-wrap: wrap;
	flex-direction: column;
	justify-content: flex-start;
	margin-left: 2px;
}

.friendlist_ul {
	list-style: none;
	padding-left: 0;
}
/* 즐겨찾기, 친구 부분 */
.profile-title>* {
	font-size: 13px; /* 16px 브라우저 기준 12px 의미*/
	color: gray;
	display: inline-block;
	margin: 0;
}

.profile-title p {
     padding-bottom : -10px;
}

/* 메인 프로필들 li부분 */
.friendlist_ul>li {
	display: flex;
	flex-direction: row;
	align-items: center;
	flex-wrap: nowrap;
	margin-bottom: 20px; /* 16 브라우저 기준 20px */
	margin-top: 10px; /* 16 브라우저 기준 10px */
	align-items: center;
}
/* 프로필사진 사이즈 */
.friendlist_ul>li>img {
	width: 50px;
}
/* 이름과 프로필 사진의 margin */
.profile>* {
	margin: 5px;
	margin-left: 10px;
}

/* 이름 스타일*/
.profile>*:first-of-type {
	font-weight: bold;
	font-size: 14px;
}
/* 상태메시지 스타일*/
.profile>*:nth-of-type(2) {
	color: gray;
	font-size: 12px;
}

/* 구분선 스타일 */
.profile-title {
	border-top: 1px solid rgb(202, 200, 200);
	padding-top: 10px;
}
</style>


<body id="friendlist">
	<div class="container friend">

		<!-- 헤더 영역 -->
		<header class="friendlist_header" style="display: block;">
			<button class="btn btn-light" type="submit"
				style="font-size: 24px; font-weight: bold; display: inline; background-color:white;">친구
				목록</button>
			<button class="btn btn-light" type="submit" onclick="location.href='/friend/search'"
				style="float: right; margin-left: 15px; font-size: 24px; color: gray; background-color:white;">친구
				찾기</button>
		</header>

	
		<main class="friendlist_main">
				<!-- 친구신청 -->
			<div>
			<c:forEach var="friendrequest" items="${friendrequest}">
				<div class="profile-title">
					<h2>친구신청</h2>
				</div>
				<ul class="friendlist_ul">
					<li><img src="/resources/imgs/me.png" alt="친구1프로필사진">
						<div class="profile">
							<p>${friendrequest}</p>
							<p>수락 대기중</p>
						</div>
					</li>
				
				</ul>
				</c:forEach>
			</div>
			<!-- 즐겨찾기 부분-->
			<div>
				<div class="profile-title">
					<h2>즐겨찾기</h2>
				</div>
				<ul class="friendlist_ul">
					<li><img src="/resources/imgs/me.png" alt="친구1프로필사진">
						<div class="profile">
							<p>친구1</p>
							<p>친구1 상태 메세지</p>
						</div></li>
					<li><img src="/resources/imgs/me.png" alt="친구2프로필사진">
						<div class="profile">
							<p>친구2</p>
							<p>친구2 상태 메세지</p>
						</div></li>
				</ul>
			</div>
			<!-- 친구 프로필 부분 -->
			<div>
				<div class="profile-title">
					<h2>친구</h2>
					<p>${friendcount}</p>
				</div>
				<c:forEach var="friend" items="${friendlist}">
				<ul class="friendlist_ul">
					<li><img src="/resources/imgs/me.png" alt="친구3프로필사진">
						<div class="profile">
							<p>${friend.nickname}</p>
							<p>${friend.intro}</p>
						</div></li>	
				</ul>
				</c:forEach>
			</div>
		</main>

	</div>
</body>
</html>


<%@ include file="../footer.jsp"%>