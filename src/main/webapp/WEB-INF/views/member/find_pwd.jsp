<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../member/memberHeader.jsp"%>

<style>
@font-face {
	font-family: 'Inconsolata';
	unicode-range: U+0041-005A, U+0061-007A;
}

@font-face {
	font-family: 'Kosugi Maru';
	unicode-range: U+3041 -U +3096, U+309D, U+309E, U+30A1- U+30FA, U+30FC,
		U+FF10- U+FF19;
}

@font-face {
	font-family: 'Noto Sans KR';
	unicode-range: U+AC00-D7A3;
}

.login {
	width: 380px;
	height: 350px;
	margin: 100px auto;
	display: flex;
	flex-direction: column;
	align-content: center;
	flex-wrap: wrap;
	background-color: #fff;
	border: 1px solid #DBDBDB;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	font-family: 'Inconsolata', 'Kosugi Maru', 'Noto Sans KR';
}

img.logo_hellobook {
	align-self: center;
	width: 175px;
	margin: 35px 0;
}

.input_login {
	width: 270px;
	height: 40px;
	margin: 3px auto;
	padding: 0 10px;
	display: block;
	background-color: #fafafa;
	border: 1px solid #DBDBDB;
	border-radius: 3px;
	font-size: 14px;
}

.input_login::placeholder {
	font-size: 12px;
	color: #8e8e8e;
}

.input_login:focus {
	border: 1px solid #8a8a8a;
	outline: none;
}

#btnSearchPwd {
	width: 268px;
	height: 30px;
	margin: 13px auto;
	color: white;
	border: none;
	border-radius: 3px;
	font-size: 14px;
	font-weight: 600;
}

#btn_login:disabled:hover {
	cursor: default;
}

#btn_login:enabled:hover {
	cursor: pointer;
}

#btn_login:focus {
	outline: none;
}

a {
	cursor: default;
}

.button_forgot {
	color: #00366B;
	align-self: center;
	font-size: 12px;
	margin-top: 30px;
}

.button_forgot:hover {
	cursor: pointer;
}

p {
	font-size: 13px;
	text-align: left;
	color: red;
	margin: 10px 0;
	display: none;
}

#button_div > button {
	width: 100%;
}
</style>
<body>
	<div class="container login">
		<img class="logo_hellobook" src="/resources/imgs/logo.png"
			alt="hellobook_logo">
		<div class="find_pwd_div">
			<input type="text" class="input_login" name="email" id="email" placeholder="회원가입한 이메일을 입력하세요.">
			<input type="text" class="input_login" name="code" id="code" placeholder="인증번호를 입력하세요." style="display: none"> 
			<input type="password" class="input_login" name="pw" id="pw" placeholder="새 비밀번호" style="display: none"> 
			<input type="password" class="input_login" name="pw2" id="pw2" placeholder="비밀번호 확인" style="display: none">
		</div>
		<p id="notice">이메일을 입력해주세요.</p>
		<p id="notice2">존재하지 않는 이메일입니다.</p>
		<p id="notice3">인증번호가 일치하지 않습니다.</p>
		<p id="notice4">비밀번호를 입력해주세요.</p>
		<p id="notice5">비밀번호는 공백을 포함할 수 없습니다.</p>
		<p id="notice6">8자리 이상의 영어, 숫자, 특수문자의 조합이어야 합니다.</p>
		<p id="notice7">비밀번호가 일치하지 않습니다.</p>
		<div id="button_div">
			<button type="button" class="btn btn-primary" id="findPwdBtn">비밀번호 찾기</button>
		</div>
		<span class="button_forgot" onclick="location.href='/member/login'">로그인으로</span>
		<span class="button_forgot" onclick="location.href='/member/join'" style="margin-top: 5px;">새 계정 만들기</span>
	</div>
	<script src="/resources/js/findpwdService.js"></script>
	<script src="/resources/js/find_pwd.js"></script>
</body>
</html>



