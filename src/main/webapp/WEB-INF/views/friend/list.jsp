<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
friendlist {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	font-family: fontello, 'Nanum Gothic', sans-serif, Arial;
	background-color: white;
}

.friend {
	width: 700px;
	top: 0;
	left: 0;
	display: grid;
	grid-template-columns: 5rem 1.25rem auto 1.25rem;
	grid-template-rows: 1.875rem 3.125rem auto 6.25rem;
	gap: 0;
	align-items: stretch;
	grid-template-areas: "nav  .  setting  . " "nav  .   header  . "
		"nav  .    main   . "
}

header {
	grid-area: header;
	position: static;
	top: 30px;
	background-color: white;
}

header span {
	float: right;
	margin-left: 15px;
	font-size: 24px;
	color: gray;
}

header>* {
	line-height: 50px;
	vertical-align: middle;
}

h1 {
	font-size: 24px;
	font-weight: bold;
	display: inline;
}

/* 네비게이션 스타일 지정 */
nav {
	grid-area: nav;
	background-color: gray;
	align-self: start;
	position: sticky;
	top: 0;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	height: 100vh;
}

.main-menu img {
	width: 50px;
	height: 50px;
	display: block;
	margin: 0px auto;
	margin-top: 25px;
}

.main-menu i, .sub-menu i {
	display: block;
	font-size: 1.75rem;
	color: gray;
	text-align: center;
	margin-bottom: 20px;
}

.main-menu {
	margin-top: 50px;
}

/* 메인 스타일 지정 */
/* 친구 리스트 부분*/
main {
	grid-area: main;
	display: flex;
	flex-wrap: wrap;
	flex-direction: column;
	justify-content: flex-start;
	margin-left: 2px;
}

ul {
	list-style: none;
	padding-left: 0;
}
/* 즐겨찾기, 친구 부분 */
.profile-title>* {
	font-size: 12px; /* 16px 브라우저 기준 12px 의미*/
	color: gray;
	display: inline-block;
	margin: 0;
}

/* 메인 프로필들 li부분 */
li {
	display: flex;
	flex-direction: row;
	align-items: center;
	flex-wrap: nowrap;
	margin-bottom: 20px; /* 16 브라우저 기준 20px */
	margin-top: 10px; /* 16 브라우저 기준 10px */
	align-items: center;
}
/* 프로필사진 사이즈 */
li>img {
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
		<header style="display: block;">
			<h1>친구 목록</h1>
			<span>친구 찾기</span>
		</header>
		<!-- 각종 기능 nav 영역 -->
		<nav>
			<div class="main-menu">
				<a href="friend.html"><img src="/resources/imgs/instagram.png"></a>
				<a href="friend.html"><img src="/resources/imgs/instagram.png"></a>
				<a href="friend.html"><img src="/resources/imgs/instagram.png"></a>
				<a href="friend.html"><img src="/resources/imgs/instagram.png"></a>
			</div>

		</nav>
		<!-- My 프로필 표시 부분 -->
		<main>
			<div>
				<ul>
					<li><img src="/resources/imgs/me.png" alt="프로필">
						<div class="profile">
							<p>Hellobook</p>
							<p>상태메시지 영역</p>
						</div></li>
				</ul>
			</div>
			<!-- 즐겨찾기 부분-->
			<div>
				<div class="profile-title">
					<h2>즐겨찾기</h2>
				</div>
				<ul>
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
					<p>친구 수 표시</p>
				</div>
				<ul>
					<li><img src="/resources/imgs/me.png" alt="친구3프로필사진">
						<div class="profile">
							<p>친구3</p>
							<p>싱태 메세지</p>
						</div></li>
					<li><img src="/resources/imgs/me.png" alt="친구1프로필사진">
						<div class="profile">
							<p>친구4</p>
							<p>싱태 메세지</p>
						</div></li>
					<li><img src="/resources/imgs/me.png" alt="친구2프로필사진">
						<div class="profile">
							<p>친구5</p>
							<p>싱태 메세지</p>
						</div></li>
					<li><img src="/resources/imgs/me.png" alt="뫄뫄프로필사진">
						<div class="profile">
							<p>친구6</p>
							<p>싱태 메세지</p>
						</div></li>
					<li><img src="/resources/imgs/me.png" alt="쀼프로필사진">
						<div class="profile">
							<p>친구7</p>
							<p>싱태 메세지</p>
						</div></li>
					<li><img src="/resources/imgs/me.png" alt="베프프로필사진">
						<div class="profile">
							<p>친구8</p>
							<p>싱태 메세지</p>
						</div></li>
				</ul>
			</div>
		</main>

	</div>
</body>
</html>


<%@ include file="../footer.jsp"%>