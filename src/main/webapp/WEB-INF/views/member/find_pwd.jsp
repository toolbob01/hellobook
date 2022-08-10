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
	<script>
		$(function() {
			const email = $("#email");
			const code = $("#code");
			const pw = $("#pw");
			const pw2 = $("#pw2");
			const button_div = $("#button_div");
			var setCode = '';

			var findPwdService = (function() {
				function getEmail(email, callback, err) {
					var data = {
							email:email
					} 
					$.ajax({
						type:"post",
						url:"/findpwd/checkemail",
						data:JSON.stringify(data),
						contentType:'application/json; charset = utf-8',
						success: function(result,status,xhr) {
							if(callback){
								callback(result);
							}
						},error: function(xhr,status,er){
							if(err){
								err();
							}
						}
					})
				}
				
				function getCode(email,callback,err) {
					$.ajax({
						type : "get",
						url : "/findpwd/getcode?email=" + email,
						success : function(result){
							if(callback){
								callback(result);
							}
						},error: function(xhr,status,er){
							if(err){
								err();
							}
						}
					})
				}
				
				function changePwd(userData,callback,err) {
					$.ajax({
						type:'post',
						url:'/findpwd/changePwd',
						data:JSON.stringify(userData),
						contentType : "application/json",
						success:function(result){
							if(callback){
								callback(result);
							}
						},error: function(xhr,status,er){
							if(err){
								err();
							}
						}
					})
				}

				return {getEmail : getEmail, getCode:getCode, changePwd:changePwd};
			})();
			
			button_div.on("click","button#findPwdBtn",function(){
				if (email.val() == '') {
					$("#notice").show();
					return;
				}
				
				if (email.val() != '') {
					findPwdService.getEmail(email.val(), function(data) {
						findPwdService.getCode(email.val(),function(result){
							alert("메일로 인증번호를 보냈습니다.\n메일 확인 후 인증번호를 입력하세요.")
							setCode = result;
							email.hide();
							$("#notice").hide();
							$("#notice2").hide();
							code.show();
							button_div.html('<button type="button" class="btn btn-primary" id="checkCodeBtn">인증 확인</button>');
						 },function(){
							alert("서버오류로 접근할 수 없습니다.");
							$("#notice").hide();
							$("#notice2").hide();
						})
					},function(){
						$("#notice2").show();
						return;
					});
				}
			})
			
			button_div.on("click","button#checkCodeBtn",function(){
				if(code.val() == '' || code.val() != setCode || setCode == ''){
					$("#notice3").show();
					return;
				}
				
				if(code.val() == setCode){
					$("#notice3").hide();
					code.val("");
					code.hide();
					pw.show();
					pw2.show();
					button_div.html('<button type="button" class="btn btn-primary" id="changePwdBtn">비밀번호 변경</button>');
				}
			})

			button_div.on("click","button#changePwdBtn",function(){
				var pwCheck = /^(?=.*?[a-zA-Z0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
				
				$("#notice4").hide();
				$("#notice5").hide();
				$("#notice6").hide();
				$("#notice7").hide();
				
				if(pw.val() == ''){
					$("#notice4").show();
					return
				}
				
				if(pw.val().search(/\s/) != -1){
					$("#notice5").show();
					return
				}
				
				if(pw.val().length < 8 || !pwCheck.test(pw.val())){
					$("#notice6").show();
					return
				}
				
				if(pw2.val() != pw.val()){
					$("#notice7").show();
					return
				}
				
				if(pw2.val() == pw.val()){
					var userData = {
							email:email.val(),
							password:pw.val()
					}
					
					findPwdService.changePwd(userData,function(data){
						email.val("");
						pw.val("");
						pw2.val("");
						pw.hide();
						pw2.hide();
						email.show();
						button_div.html('<button type="button" class="btn btn-primary" id="findPwdBtn">비밀번호 찾기</button>');
						alert("비밀번호가 변경되었습니다.");
						location.href = '/member/login';
					},function(){
						alert("비밀번호가 변경되었습니다.");
					});
				}
			})
		})
	</script>
</body>
</html>



