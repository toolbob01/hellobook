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
	height: 450px;
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

#btnlogin {
	width: 268px;
	height: 30px;
	margin: 13px auto;
	color: white;
	border: none;
	border-radius: 3px;
	font-size: 14px;
	font-weight: 600;
}

#btn_login:disabled {
	background-color: #0d6efd;
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

#loginErrorNotice {
	font-size: 13px;
    margin-top: 12px;
    text-align: center;
    color: red;
}

.btn-social{
	border: 1px solid #ccc;
    width: 268px;
    height: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
}
.btn-google{
    margin-top: 13px;
}

.g-signin2{
}
</style>
<body>
	<div class="container login">
		<img class="logo_hellobook" src="/resources/imgs/logo.png" alt="hellobook_logo">
		<form action="/login" method="post">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" >
			<input type="text" class="input_login" name="email" id="email" placeholder="이메일을 입력하세요.">
			<input type="password" class="input_login" name="password" id="password" placeholder="비밀번호를 입력하세요.">
			<c:if test="${error == '1'}">
				<p id="loginErrorNotice">아이디 또는 비밀번호가 일치하지 않습니다.</p>
			</c:if>
			<button type="submit" class="btn btn-sm btn-primary" id="btnlogin" >로그인</button>
		</form>
		<a class="btn btn-block btn-social btn-facebook" onclick="document.facebook.submit();">
		<span class="fa fa-facebook"></span>Facebook으로 로그인</a>
		<a class="btn btn-block btn-social btn-facebook" href="${naverUrl}">Naver으로 로그인</a>
		<div class="g-signin2" data-onsuccess="onSignIn">Google으로 로그인</div>
		<span class="button_forgot" onclick="location.href='/member/findpwd'">비밀번호 찾기</span>
		<span class="button_forgot" onclick="location.href='/member/join'" style="margin-top: 5px;">회원가입 하기</span>
	</div>
</body>
</html>
