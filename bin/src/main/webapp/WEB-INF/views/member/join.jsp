<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../member/memberHeader.jsp" %>

<style>
body {
	
}

.input-form {
	max-width: 550px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

.input-form label {
	margin-bottom: 10px;
}

label.form-check-label {
    margin-top: 5px;
    vertical-align: middle;
}

.form-check-input:checked {
	background-color: #9fd5ff;
	border-color: #9fd5ff;
}

.form-control:focus {
	color: #212529;
	background-color: #fff;
	border-color: #9fd5ff;
	outline: 0;
	box-shadow: 0 0 0 .25remrgba(13, 110, 253, .25);
}

.btn-helloblue {
	color: #000;
	background-color: #9fd5ff;
	border-color: #9fd5ff;
	font-weight: 600
}

h4.mb-3 {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 25px!important;
}

.notice-bubble {
    height: 35px;
    display: none;
    align-items: center;
    font-size: 12px;
    color: red;
}

.input_div {
	position: relative;
}

.input_div>input {
	width: 95%;
	min-width: 300px;
}

#sexCheckDiv {
    margin-left: 0px;
}

#hobbyCheckBox > div.form-check-inline{
    margin-left: 12px;
}
</style>
</head>

<div class="container">
	<div class="input-form-backgroud row">
		<div class="input-form col-md-12 mx-auto">
			<h4 class="mb-3">회원가입</h4>
			<form class="validation-form" id="regForm" action="/member/join" method="post" novalidate>
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<div class="row">
					<div class="col-md-12 mb-3">
						<div class="input_div">
							<label for="email">Email</label>
							<input type="email" class="form-control" id="email" name="email">
							<div class="notice-bubble" id="email-notice"></div>
						</div>
					</div>
					<div class="col-md-12 mb-3">
						<div class="input_div">
							<label for="nickname">닉네임</label> <input type="text"
								class="form-control" id="nickname" name="nickname" placeholder="">
							<div class="notice-bubble" id="nickname-notice"></div>
						</div>
					</div>
					<div class="col-md-12 mb-3">
						<div class="input_div">
							<label for="pw">비밀번호</label>
							<input type="password" class="form-control" id="pw" name="pw" placeholder="" required>
							<div class="notice-bubble" id="pw-notice"></div>
						</div>
					</div>
					<div class="col-md-12 mb-3">
						<div class="input_div">
							<label for="email">비밀번호 확인</label>
							<input type="password" class="form-control" id="pw2" name="pw2" placeholder="" required>
							<div class="notice-bubble" id="pw2-notice"></div>
						</div>
					</div>
					<div class="col-md-12 mb-3">
						<div class="input_div">
							<label for="language">모국어</label><br>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" name="language" id="korean" value="K" onclick="checkOnlyOne(this)">
								<label class="form-check-label" for="korean">한국어</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" name="language" id="japanese" value="J" onclick="checkOnlyOne(this)">
									<label class="form-check-label" for="japanese">일본어</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" name="language" id="etc" value="E" onclick="checkOnlyOne(this)">
								<label class="form-check-label" for="etc">기타</label>
							</div>
							<div class="notice-bubble" id="lan-notice">모국어를 선택해주세요.</div>
						</div>
					</div>
					<div class="col-md-12 mb-3">
						<div class="input_div">
							<label for="birth">생년월일</label>
							<input type="date" class="form-control" name="birth" id="birth" min="1900-01-01" style="width: 50%; min-width: 10px;" >
							<div class="notice-bubble" id="birth-notice"></div>
						</div>
					</div>
					<div class="col-md-12 mb-3">
						<div class="input_div">
							<label for="sex">성별</label><br>
							<div class="row" id="sexCheckDiv">
								<div class="form-check col-md-3 mb-3">
									<input class="form-check-input" type="radio" name="sex" id="male" value="M" checked>
									<label class="form-check-label" for="male">남성</label>
								</div>
								<div class="form-check col-md-3 mb-3">
									<input class="form-check-input" type="radio" name="sex" id="female" value="F">
									<label class="form-check-label" for="female">여성</label>
								</div>
							</div>
						</div>
					</div>
					<div class="mb-3">
						<div class="row" id="hobbyCheckBox">
							<label for="nickname">관심분야</label><br>
							<div class="form-check form-check-inline col-md-3">
								<input class="form-check-input" type="checkbox" name="hobbys" id="trip" value="1" >
								<label class="form-check-label" for="trip">여행</label>
							</div>
							<div class="form-check form-check-inline col-md-3">
								<input class="form-check-input" type="checkbox" name="hobbys" id="food" value="2" > 
								<label class="form-check-label" for="food">음식</label>
							</div>
							<div class="form-check form-check-inline col-md-3">
								<input class="form-check-input" type="checkbox" name="hobbys" id="lan" value="3" > 
								<label class="form-check-label" for="lan">언어</label>
							</div>
							<div class="form-check form-check-inline col-md-3">
								<input class="form-check-input" type="checkbox" name="hobbys" id="instrument" value="4" > 
								<label class="form-check-label" for="instrument">악기</label>
							</div>
							<div class="form-check form-check-inline col-md-3">
								<input class="form-check-input" type="checkbox" name="hobbys" id="reading" value="5" >
								<label class="form-check-label" for="reading">독서</label>
							</div>
							<div class="form-check form-check-inline col-md-3">
								<input class="form-check-input" type="checkbox" name="hobbys" id="exercise" value="6" >
								<label class="form-check-label" for="exercise">운동</label>
							</div>
							<div class="form-check form-check-inline col-md-3">
								<input class="form-check-input" type="checkbox" name="hobbys" id="photo" value="7" >
								<label class="form-check-label" for="photo">사진</label>
							</div>
							<div class="form-check form-check-inline col-md-3">
								<input class="form-check-input" type="checkbox" name="hobbys" id="music" value="8" >
								<label class="form-check-label" for="music">음악</label>
							</div>
							<div class="form-check form-check-inline col-md-3">
								<input class="form-check-input" type="checkbox" name="hobbys" id="animal" value="9" >
								<label class="form-check-label" for="animal">동물</label>
							</div>
						</div>
					</div>
				</div>

				<hr class="mb-4">
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" id="agreement" name="agreement" required>
					<label class="custom-control-label" for="agreement">개인정보 수집 및 이용에 동의합니다.</label>
				</div>
				<div class="mb-4"></div>
				<button class="btn btn-primary btn-lg btn-block" type="button" onclick="formCheck()">가입
				</button>
				<input type="hidden" name="hobby" id="hobby" value="">
				<input type="hidden" name="password" id="password" value="">
			</form>
		</div>
	</div>
</div>

<script type="text/javascript" src="/resources/js/join.js"></script>
</body>
</html>