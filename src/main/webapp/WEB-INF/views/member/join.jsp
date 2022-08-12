<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../member/memberHeader.jsp" %>

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

.register {
	width: 380px;
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

.input_div {
	position: relative;
	max-width: 302px;
	margin: 20px 0px;
}

#sex_input_div{
	margin-bottom: 0px;
}

.input_div>input {
	min-width: 300px;
}

.input_div > label {
	margin-bottom: 3px;
}

.languageCheckBox{
	display: flex;
    justify-content: space-between;
    align-items: center;
}

#sexCheckDiv{
    margin-left: 0px;
}

.input_register {
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

.input_register::placeholder {
	font-size: 12px;
	color: #8e8e8e;
}

.input_register:focus {
	border: 1px solid #8a8a8a;
	outline: none;
}


label.form-check-label {
    margin-top: 5px;
    vertical-align: middle;
}

.form-check-input:checked {
	background-color: #9fd5ff;
	border-color: #9fd5ff;
}

.notice-bubble {
    height: 35px;
    display: none;
    align-items: center;
    font-size: 12px;
    color: red;
}


#btnregister {
	width: 100%;
	height: 30px;
	margin: 13px auto;
	color: white;
	border: none;
	border-radius: 3px;
	font-size: 14px;
	font-weight: 600;
}

a {
	cursor: default;
	margin-bottom: 20px;
}

#registerErrorNotice {
    font-size: 13px;
    margin-top: 12px;
    text-align: center;
    color: red;
}

.btn-cansle{
    border: 1px solid #ccc;
    width: 100%;
    height: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.hobbycheck{
    margin-bottom: 5px;
}
</style>
</head>
<div class="container register">
		<img class="logo_hellobook" src="/resources/imgs/logo.png" alt="hellobook_logo">
		<form class="validation-form" id="regForm" action="/member/join" method="post" novalidate>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" >
			<div class="input_div">
				<label for="email">이메일</label>
				<input type="email" class="input_register" name="email" id="email" placeholder="이메일을 입력하세요.">
				<div class="notice-bubble" id="email-notice"></div>
			</div>
			<div class="input_div">
				<label for="nickname">닉네임</label>
				<input type="text" class="input_register" name="nickname" id="nickname" placeholder="닉네임을 입력하세요.">
				<div class="notice-bubble" id="nickname-notice"></div>
			</div>
			<div class="input_div">
				<label for="pw">비밀번호</label>
				<input type="password" class="input_register" id="pw" name="pw" placeholder="" required>
				<div class="notice-bubble" id="pw-notice"></div>
			</div>
			<div class="input_div">
				<label for="email">비밀번호 확인</label>
				<input type="password" class="input_register" id="pw2" name="pw2" placeholder="" required>
				<div class="notice-bubble" id="pw2-notice"></div>
			</div>
			<div class="input_div">
				<label for="language">모국어</label><br>
				<div class="languageCheckBox">
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
				</div>
				<div class="notice-bubble" id="lan-notice">모국어를 선택해주세요.</div>
			</div>
			<div class="input_div">
				<label for="birth">생년월일</label>
				<input type="date" class="input_register" name="birth" id="birth" min="1900-01-01" >
				<div class="notice-bubble" id="birth-notice"></div>
			</div>
			<div class="input_div" id="sex_input_div">
				<label for="sex">성별</label><br>
				<div class="row" id="sexCheckDiv">
					<div class="form-check col-md-6">
						<input class="form-check-input" type="radio" name="sex" id="male" value="M" checked>
						<label class="form-check-label" for="male">남성</label>
					</div>
					<div class="form-check col-md-6">
						<input class="form-check-input" type="radio" name="sex" id="female" value="F">
						<label class="form-check-label" for="female">여성</label>
					</div>
				</div>
			</div>
			<div class="input_div">
				<label for="hobbys">관심분야</label><br>
				<div class="hobbysCheckBox">
					<div class="form-check form-check-inline hobbycheck">
						<input class="form-check-input" type="checkbox" name="hobbys" id="trip" value="1">
						<label class="form-check-label" for="trip">여행</label>
					</div>
					<div class="form-check form-check-inline hobbycheck">
						<input class="form-check-input" type="checkbox" name="hobbys" id="food" value="2">
						<label class="form-check-label" for="food">음식</label>
					</div>
					<div class="form-check form-check-inline hobbycheck">
						<input class="form-check-input" type="checkbox" name="hobbys" id="lan" value="3" > 
						<label class="form-check-label" for="lan">언어</label>
					</div>
					<div class="form-check form-check-inline hobbycheck">
						<input class="form-check-input" type="checkbox" name="hobbys" id="instrument" value="4" > 
						<label class="form-check-label" for="instrument">악기</label>
					</div>
					<div class="form-check form-check-inline hobbycheck">
						<input class="form-check-input" type="checkbox" name="hobbys" id="reading" value="5" >
						<label class="form-check-label" for="reading">독서</label>
					</div>
					<div class="form-check form-check-inline hobbycheck">
						<input class="form-check-input" type="checkbox" name="hobbys" id="exercise" value="6" >
						<label class="form-check-label" for="exercise">운동</label>
					</div>
					<div class="form-check form-check-inline hobbycheck">
						<input class="form-check-input" type="checkbox" name="hobbys" id="photo" value="7" >
						<label class="form-check-label" for="photo">사진</label>
					</div>
					<div class="form-check form-check-inline hobbycheck">
						<input class="form-check-input" type="checkbox" name="hobbys" id="music" value="8">
						<label class="form-check-label" for="music">음악</label>
					</div>
					<div class="form-check form-check-inline hobbycheck">
						<input class="form-check-input" type="checkbox" name="hobbys" id="animal" value="9">
						<label class="form-check-label" for="animal">동물</label>
					</div>
				</div>
				<div class="notice-bubble" id="lan-notice">모국어를 선택해주세요.</div>
			</div>
			<hr class="mb-4">
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input" id="agreement" name="agreement" required>
				<label class="custom-control-label" for="agreement">개인정보 수집 및 이용에 동의합니다.</label>
			</div>
			<button type="button" class="btn btn-sm btn-primary" id="btnregister" onclick="formCheck()">회원가입</button>
			<a class="btn btn-block btn-cansle" href="/member/login">취소</a>
			
			<input type="hidden" name="hobby" id="hobby" value="">
			<input type="hidden" name="password" id="password" value="">
		</form>
	</div>
	<script>
	
	var joinService = (function() {
		function checkEmail(email,callback){
			$.ajax({
				type:"get",
				url:"/member/checkEmail?email="+email,
				success : function(result){
					if(callback){
						callback(result);
					}
				},error: function(xhr,status,er){
					alert("서버오류로 회원가입을 진행할 수 없습니다.")
					consol.log(er);
					return
				}
			})
		}
		
		function checkNickname(nickname,callback){
			$.ajax({
				type:"get",
				url:"/member/checkNickname?nickname="+nickname,
				success : function(result){
					if(callback){
						callback(result);
					}
				},error: function(xhr,status,er){
					alert("서버오류로 회원가입을 진행할 수 없습니다.")
					consol.log(er);
					return
				}
			})
		}
		
		return {checkEmail:checkEmail, checkNickname:checkNickname};
	})();
	
	function checkOnlyOne(element) {
		const checkboxes = document.getElementsByName("language");
		checkboxes.forEach((cb)=> {
			cb.checked = false;
		})
		
		element.checked = true;
	}
	
	const email = $("#email");
	const nickname = $("#nickname");
	const pw = $("#pw");
	const pw2 = $("#pw2");
	const password = $("#password");
	const language = document.getElementsByName("language");
	const birth = $("#birth");
	const sex = $("#sex");
	const hobbys = document.getElementsByName("hobbys");
	const hobby = $("#hobby");
	const agree = $("#agreement");
	
	const emailNotice = $("#email-notice");
	const nicknameNotice = $("#nickname-notice");
	const pwNotice = $("#pw-notice");
	const pw2Notice = $("#pw2-notice");
	const lanNotice = $("#lan-notice");
	const birthNotice = $("#birth-notice");
	
	var pwCheck = /^(?=.*?[a-zA-Z0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	

	//blur 이벤트
	email.on("blur",function(){
		emailNotice.css('display','none')
		emailNotice.css('color','red')
		
		if(email.val() == ''){
			emailNotice.html("이메일을 입력해주세요.")
			emailNotice.css('display','flex')
			return
		}
		
		joinService.checkEmail(email.val(),function(result){
			if(result == '1'){
				emailNotice.html("이미 가입된 이메일입니다.")
				emailNotice.css('display','flex')
				return
			}else{
				emailNotice.html("사용하실 수 있는 이메일입니다.")
				emailNotice.css('display','flex')
				emailNotice.css('color','green')
				return
			}
		})
	})
	
	nickname.on("blur",function(){
		nicknameNotice.css('display','none')
		nicknameNotice.css('color','red')
		
		if(nickname.val() == ''){
			nicknameNotice.html("닉네임을 입력해주세요.");
			nicknameNotice.css('display','flex')
			return
		}
		
		if(nickname.val().search(/\s/) != -1){
			nicknameNotice.html("닉네임은 공백을 포함할 수 없습니다.");
			nicknameNotice.css('display','flex')
			return
		}
		
		joinService.checkNickname(nickname.val(),function(result){
			if(result == '1'){
				nicknameNotice.html("이미 사용중인 닉네임입니다.")
				nicknameNotice.css('display','flex')
				return
			}else{
				nicknameNotice.html("사용하실 수 있는 닉네임입니다.")
				nicknameNotice.css('display','flex')
				nicknameNotice.css('color','green')
				return
			}
		})
	})
	
	pw.on("blur",function(){
		pwNotice.css('display','none')
		
		if(pw.val() == ''){
			pwNotice.html("비밀번호를 입력해주세요.")
			pwNotice.css('display','flex')
			return
		}
		
		if(pw.val().search(/\s/) != -1){
			pwNotice.html("비밀번호는 공백을 포함할 수 없습니다.")
			pwNotice.css('display','flex')
			return
		}
		
		if(pw.val().length < 8 || !pwCheck.test(pw.val())){
			pwNotice.html("8자리 이상, 두가지 이상의 영어 대·소문자, 숫자, 특수문자의 조합이어야 합니다.")
			pwNotice.css('display','flex')
			return
		}
	})
	
	pw2.on("blur",function(){
		pw2Notice.css('display','none')
		
		if(pw2.val() == ''){
			pw2Notice.html("비밀번호를 입력해주세요.")
			pw2Notice.css('display','flex')
			return
		}
		
		if(pw2.val() != pw.val()){
			pw2Notice.html("비밀번호가 일치하지 않습니다.")
			pw2Notice.css('display','flex')
			return
		}
	})
	
	birth.on("blur",function(){
		birthNotice.css('display','none')
		
		if(birth.val() == ''){
			birthNotice.html("생년월일을 입력해주세요.")
			birthNotice.css('display','flex')
			return
		}
		
		if(birth.val().substr(0,4) < 1900){
			birthNotice.html("1900년 미만은 입력하실 수 없습니다.")
			birthNotice.css('display','flex')
			birth.val("");
			return
		}
	})
	
	//유효성 검사
	function formCheck(){
		
		if(!agree.is(":checked")){
			alert("약관에 동의 후 가입이 가능합니다.");
			return
		}
		
		if(email.val() == ''){
			alert("이메일을 입력해주세요.");
			email.focus();
			return
		}
		
		if(nickname.val() == ''){
			alert("닉네임을 입력해주세요.");
			nickname.focus();
			return
		}
		
		if(nickname.val().search(/\s/) != -1){
			alert("닉네임은 공백을 포함할 수 없습니다.");
			nickname.focus();
			return
		}
		
		if(pw.val() == ''){
			alert("비밀번호를 입력해주세요.");
			pw.focus();
			return
		}
		
		if(pw.val().search(/\s/) != -1){
			alert("비밀번호는 공백을 포함할 수 없습니다.");
			pw.focus();
			return
		}
		
		if(pw.val().length < 8 || !pwCheck.test(pw.val())){
			alert("8자리 이상, 두가지 이상의 영어 대·소문자, 숫자, 특수문자의 조합이어야 합니다.");
			pw.focus();
			return
		}
		
		if(pw2.val() == ''){
			alert("비밀번호를 입력해주세요.")
			pw2.focus();
			return
		}
		
		if(pw2.val() != pw.val()){
			alert("비밀번호가 일치하지 않습니다.")
			pw2.focus();
			return
		}
		
		var i=0;
		
		language.forEach((lan)=> {
			if(lan.checked){
				i++;
			}
		})
		
		if(i != 1){
			alert("모국어를 선택해주세요.")
			return
		}
		
		if(birth.val() == ''){
			alert("생년월일을 입력해주세요.")
			birth.focus();
			return
		}
		
		if(birth.val().substr(0,4) < 1900){
			alert("1900년 미만은 입력하실 수 없습니다.")
			birth.val("");
			birth.focus();
			return
		}
		
		var hb="";
		
		hobbys.forEach((arr)=> {
			if(arr.checked){
				hb += arr.value+','
				arr.setAttribute('disabled','disabled');
			}
		})
		
		hb = hb.substr(0,hb.length-1);
		
		hobby.val(hb);
		password.val(pw.val());
		
		$("#regForm").submit();
	}
	</script>
</body>
</html>