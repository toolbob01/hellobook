<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<head>
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/style.css">
</head>
<%@ include file="header.jsp"%>

<style>
.post-title {
	height: 60px;
}

.my-100 {
	margin-top: 100px;
	margin-bottom: 100px;
}

.mb-150 {
	margin-bottom: 150px;
}

.feed-box {
	border: solid 1px rgb(202, 202, 202);
	background-color: white;
	margin-bottom: 25px;
}

.profile {
	display: flex;
	flex-direction: row;
	align-items: center;
	background: linear-gradient(to left, #9fd5ff, #f8f9f9);
	/* background-color: #9fd5ff; */
}

.profile-id {
	font-weight: bold;
}

.profile-name {
	font-size: 12px;
}

.profile-img-box {
	width: 40px;
	height: 40px;
	border-radius: 70%;
	overflow: hidden;
	margin: 10px;
	margin-right: 15px;
}

.profile-img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.profile-text {
	flex-direction: column;
	text-align: left;
}

#feed-img {
	/* width: 100%; */
	width: 600px;
	height: 600px;
}

.icon {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	margin: 10px;
}

.like {
	text-align: left;
	margin: 10px;
	font-size: 16px;
}

.feed-text {
	text-align: left;
	margin: 10px;
	font-size: 13px;
}

.comment {
	text-align: left;
	margin: 10px;
	font-size: 12px;
}

.comment div {
	margin-bottom: 5px;
}

#input-comment {
	box-shadow: none;
	border: none;
	border-top: solid 1px rgb(202, 202, 202);
}

.recommend-msg {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	margin-left: 10px;
	font-weight: bold;
	margin-top: 10px;
	margin-bottom: 7px;
}

#recommend-text {
	color: grey;
}

#recommend-plus {
	text-decoration: none;
	color: black;
}

#follow {
	text-decoration: none;
	font-weight: bold;
	color: rgb(70, 156, 255);
}

.recommend-lst {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	align-items: center;
}

.information {
	color: rgb(197, 197, 197);
	font-size: 11px;
	margin-left: 10px;
	margin-top: 25px;
}
</style>
<div class="container-fluid">
	<div class="container">
		<div class="row post-main-view-row">
			<div class="col-lg-9">
				<div class="row">

					<div class="col-md-12 mb-150" align="center">
						<div class="border border-2 rounded-2 shadow-lg my-5"
							style="width: 600px; height: 700px;">

							<div class="feed-box">
								<div class="profile border-bottom">
									<div class="profile-img-box">
										<img class="profile-img"
											src="https://pbs.twimg.com/profile_images/1324185005883486208/gOBh4kKR_400x400.jpg">
									</div>
									<div class="profile-id">작성자</div>
								</div>

								<div class="feed-img border-bottom">
									<div id="post1" class="carousel slide" data-bs-ride="true">
										<div class="carousel-indicators">
											<button type="button" data-bs-target="#post1"
												data-bs-slide-to="0" class="active" aria-current="true"
												aria-label="Slide 1"></button>
											<button type="button" data-bs-target="#post1"
												data-bs-slide-to="1" aria-label="Slide 2"></button>
											<button type="button" data-bs-target="#post1"
												data-bs-slide-to="2" aria-label="Slide 3"></button>
										</div>
										<div class="carousel-inner">
											<div class="carousel-item active">
												<img id="feed-img" src="img/add.PNG" alt="">
											</div>
											<div class="carousel-item">
												<img id="feed-img"
													src="https://static-storychat.pstatic.net/2020/9/1/47/208797_hm2fj34m3df60.jpg">
											</div>
											<div class="carousel-item">
												<img id="feed-img" src="img/add.PNG" alt="">
											</div>
										</div>
										<button class="carousel-control-prev" type="button"
											data-bs-target="#post1" data-bs-slide="prev">
											<span class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Previous</span>
										</button>
										<button class="carousel-control-next" type="button"
											data-bs-target="#post1" data-bs-slide="next">
											<span class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Next</span>
										</button>
									</div>
								</div>

								<div class="icon my-3">
									<div>
										<span class="material-icons-outlined">하트 13|</span> <span
											class="material-icons-outlined">전체댓글|</span> <span
											class="material-icons-outlined">공유하기|</span>
									</div>
									<div>
										<span class="material-icons-outlined">|ex기능</span>
									</div>
								</div>

								<div class="like my-2">
									<b>작성자</b> 글 내용 ~~~ n줄 이상 ... 처리 필요
								</div>

								<div class="feed-text my-3">
									<b>첫번째유저</b> 1줄 이상 ... 처리 필요
								</div>

								<div class="comment">
									<div>
										<b>기타유저1</b> 1줄 이상 ... 처리 필요
									</div>
									<div>
										<b>기타유저2</b> 1줄 이상 ... 처리 필요
									</div>
									<div>
										<b>기타유저3</b> 3명 정도까지만 뽑기
									</div>
								</div>

								<div class="input-comment">
									<input id="input-comment" type="text" class="form-control"
										placeholder="댓글 달기...">
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-12 mb-150" align="center">
						<div class="border border-2 rounded-2 shadow-lg my-5"
							style="width: 600px; height: 700px;">

							<div class="feed-box">
								<div class="profile border-bottom">
									<div class="profile-img-box">
										<img class="profile-img"
											src="https://pbs.twimg.com/profile_images/1324185005883486208/gOBh4kKR_400x400.jpg">
									</div>
									<div class="profile-id">작성자</div>
								</div>

								<div class="feed-img border-bottom">
									<div id="post2" class="carousel slide" data-bs-ride="true">
										<div class="carousel-indicators">
											<button type="button" data-bs-target="#post2"
												data-bs-slide-to="0" class="active" aria-current="true"
												aria-label="Slide 1"></button>
											<button type="button" data-bs-target="#post2"
												data-bs-slide-to="1" aria-label="Slide 2"></button>
											<button type="button" data-bs-target="#post2"
												data-bs-slide-to="2" aria-label="Slide 3"></button>
										</div>
										<div class="carousel-inner">
											<div class="carousel-item active">
												<img id="feed-img" src="img/add.PNG" alt="">
											</div>
											<div class="carousel-item">
												<img id="feed-img"
													src="https://static-storychat.pstatic.net/2020/9/1/47/208797_hm2fj34m3df60.jpg">
											</div>
											<div class="carousel-item">
												<img id="feed-img" src="img/add.PNG" alt="">
											</div>
										</div>
										<button class="carousel-control-prev" type="button"
											data-bs-target="#post2" data-bs-slide="prev">
											<span class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Previous</span>
										</button>
										<button class="carousel-control-next" type="button"
											data-bs-target="#post2" data-bs-slide="next">
											<span class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Next</span>
										</button>
									</div>
								</div>

								<div class="icon my-3">
									<div>
										<span class="material-icons-outlined">하트 13|</span> <span
											class="material-icons-outlined">전체댓글|</span> <span
											class="material-icons-outlined">공유하기|</span>
									</div>
									<div>
										<span class="material-icons-outlined">|ex기능</span>
									</div>
								</div>

								<div class="like my-2">
									<b>작성자</b> 글 내용 ~~~ n줄 이상 ... 처리 필요
								</div>

								<div class="feed-text my-3">
									<b>첫번째유저</b> 1줄 이상 ... 처리 필요
								</div>

								<div class="comment">
									<div>
										<b>기타유저1</b> 1줄 이상 ... 처리 필요
									</div>
									<div>
										<b>기타유저2</b> 1줄 이상 ... 처리 필요
									</div>
									<div>
										<b>기타유저3</b> 3명 정도까지만 뽑기
									</div>
								</div>

								<div class="input-comment">
									<input id="input-comment" type="text" class="form-control"
										placeholder="댓글 달기...">
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- /row (post) -->

				<div class="row">
					<div class="col-md-12">
						a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>
						a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>a<br>
					</div>
				</div>
			</div>

			<div class="col-md-3" align="center">
				<div class="sticky-side border border-2 my-5">
					<p>Side bar Wrap</p>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="footer.jsp"%>