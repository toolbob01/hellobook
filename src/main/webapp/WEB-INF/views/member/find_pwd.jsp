<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<style>
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
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
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

#btn_login {
	width: 268px;
	height: 30px;
	margin: 13px auto;
	color: #000;
	background-color: #9fd5ff;
	border: none;
	border-radius: 3px;
	font-size: 14px;
	font-weight: 600;
}

#btn_login:disabled {
	background-color: #9fd5ff;
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


</style>




<body>
	<div class="container login">
		<img class="logo_hellobook" src="/resources/imgs/logo.png"
			alt="hellobook_logo"> 
	
			<input type="text" class="input_login"
			name="userID" id="userID" placeholder="회원가입한 이메일을 입력하세요.">
	<a href="#none"><button
				id="btn_login" disabled>비밀번호 찾기</button></a> 
				
			
		
		
		 <span class="button_forgot" onclick="location.href='/member/login'">로그인으로</span>
		  <span class="button_forgot" onclick="location.href='/member/join'" style="margin-top:5px;" >새 계정 만들기</span>
	</div>
	<script src="js/login.js"></script>
</body>
</html>



<%@ include file="../footer.jsp" %>