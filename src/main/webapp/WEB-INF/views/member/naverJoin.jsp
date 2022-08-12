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
		<form class="validation-form" id="regForm" action="/member/socialJoin" method="post" novalidate>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" >
			<div class="input_div">
				<label for="nickname">닉네임</label>
				<input type="text" class="input_register" name="nickname" id="nickname" value="${mvo.nickname }" placeholder="닉네임을 입력하세요.">
				<div class="notice-bubble" id="nickname-notice"></div>
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
			</div>
			<hr class="mb-4">
			<div class="custom-control custom-checkbox" style="display: none">
				<input type="checkbox" class="custom-control-input" id="agreement" name="agreement" checked="checked" required>
				<label class="custom-control-label" for="agreement">개인정보 수집 및 이용에 동의합니다.</label>
			</div>
			<button type="button" class="btn btn-sm btn-primary" id="btnregister" onclick="formCheck()">저장</button>
			<a class="btn btn-block btn-cansle" href="/member/login">취소</a>
			
			<input type="hidden" name="hobby" id="hobby" value="">
			<input type="hidden" name="password" id="socialPassword" value="${mvo.password }" readonly="readonly">
			<input type="hidden" name="email" id="socialEmail" value="${mvo.email }" readonly="readonly">
			<input type="hidden" name="birth" id="socialBirth" value="${mvo.birth }" readonly="readonly">
			<input type="hidden" name="sex" id="socialSex" value="${mvo.sex }" readonly="readonly">
		</form>
	</div>
	<script>
	var joinService = (function() {
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
		
		return {checkNickname:checkNickname};
	})();
	
	function checkOnlyOne(element) {
		const checkboxes = document.getElementsByName("language");
		checkboxes.forEach((cb)=> {
			cb.checked = false;
		})
		
		element.checked = true;
	}
	
	const nickname = $("#nickname");
	const language = document.getElementsByName("language");
	const hobbys = document.getElementsByName("hobbys");
	const hobby = $("#hobby");
	
	const nicknameNotice = $("#nickname-notice");
	const lanNotice = $("#lan-notice");

	//blur 이벤트
	nickname.on("blur",function(){
		nicknameNotice.css('display','none')
		
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
		
		joinService.checkEmail(email.val(),function(result){
			if(result == '1'){
				email.val("");
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
	
	//유효성 검사
	function formCheck(){
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
		
		var hb="";
		
		hobbys.forEach((arr)=> {
			if(arr.checked){
				hb += arr.value+','
				arr.setAttribute('disabled','disabled');
			}
		})
		
		hb = hb.substr(0,hb.length-1);
		
		hobby.val(hb);
		$("#regForm").submit();
	}
	</script>
</body>
</html>