<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	align-items: center;
}

#login_form {
	display: flex;
    flex-direction: column;
    align-items: center;
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

#loginBtn {
	width: 268px;
	height: 30px;
	margin: 13px auto;
	color: white;
	border: none;
	border-radius: 3px;
	font-size: 14px;
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
    margin-bottom: 10px;
    font-size: 14px;
}

.btn-social:hover{
	border: 1px solid #000;
}

#naverLoginBtn{
	background:url(/resources/imgs/login/naver.jpg) no-repeat center center;
	background-size:cover;
	text-align: center;
	color: #fff;
}

#googleLoginBtn{
	background:url(/resources/imgs/login/google.jpg) no-repeat center center;
	background-size:cover;
	text-align: center;
	color: #000;
}
</style>
	<div class="container login">
		<img class="logo_hellobook" src="/resources/imgs/logo.png" alt="hellobook_logo">
		<form action="/login" method="post" id="login_form">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" >
			<input type="text" class="input_login" name="email" id="email" placeholder="<spring:message code="login.emailPlaceholder"/>">
			<input type="password" class="input_login" name="password" id="password" placeholder="<spring:message code="login.passwordPlaceholder"/>">
			<c:if test="${error.equals('error')}">
				<p id="loginErrorNotice"><spring:message code="login.errorNotice"/></p>
			</c:if>
			<button type="submit" class="btn btn-sm btn-primary" id="loginBtn"><spring:message code="login.loginBtn"/></button>
		</form>
		<a class="btn btn-block btn-social btn-facebook" id="naverLoginBtn"><spring:message code="login.naverLoginBtn"/></a>
		<a class="btn btn-block btn-social btn-facebook" id="googleLoginBtn" href="${googleUrl}"><spring:message code="login.googleLoginBtn"/></a>
		<span class="button_forgot" onclick="location.href='/member/findpwd'" id="findPwdBtn"><spring:message code="login.findPwdBtn"/></span>
		<span class="button_forgot" onclick="location.href='/member/join'" style="margin-top: 5px;" id="signUpBtn"><spring:message code="login.signUpBtn"/></span>
	</div>

<script>
	$('#naverLoginBtn').on('click', function(){
		$.ajax({
			type: "get",
			url: "/member/naverLogin",
			success: function(result){
				console.log(result);
				window.location.href = result;
			},
			error: function(){
				
			}
		})
	})
</script>
</body>
</html>