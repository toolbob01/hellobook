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

#regForm {
	display: flex;
    flex-direction: column;
    align-items: center;
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

#language_input_div {
	width: 100%;
}

#sex_input_div{
	margin-bottom: 0px;
	width: 100%;
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

.custom-checkbox {
    display: flex;
    flex-direction: row;
    justify-content: space-around;
}


#label_agr {
    margin-left: 13px;
    width: 95%;
}

.hobbysCheckBox {
	display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: space-between;
}

#cancelBtn {
	width: 100%;
    height: 30px;
    margin-bottom: 13px;
    border: 1px solid #bfbfbf;
    border-radius: 3px;
    font-size: 14px;
    font-weight: 600;
}

hr:not([size]) {
    width: 100%;
    height: 1px;
}
</style>
</head>
<div class="container register">
		<img class="logo_hellobook" src="/resources/imgs/logo.png" alt="hellobook_logo">
		<form class="validation-form" id="regForm" action="/member/socialJoin" method="post" novalidate>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" >
			<div class="input_div">
				<label for="nickname"><spring:message code="join.nickname"/></label>
				<input type="text" class="input_register" name="nickname" id="nickname" value="${mvo.nickname }" placeholder="<spring:message code="join.nicknamePlaceholder"/>">
				<div class="notice-bubble" id="nickname-notice"></div>
			</div>
			<div class="input_div">
				<label for="birth"><spring:message code="join.birth"/></label>
				<input type="date" class="input_register" name="birth" id="birth" min="1900-01-01" >
				<div class="notice-bubble" id="birth-notice"></div>
			</div>
			<div class="input_div" id="sex_input_div">
				<label for="sex"><spring:message code="join.sex"/></label><br>
				<div class="row" id="sexCheckDiv">
					<div class="form-check col-md-6">
						<input class="form-check-input" type="radio" name="sex" id="male" value="M" checked>
						<label class="form-check-label" for="male"><spring:message code="join.male"/></label>
					</div>
					<div class="form-check col-md-6">
						<input class="form-check-input" type="radio" name="sex" id="female" value="F">
						<label class="form-check-label" for="female"><spring:message code="join.female"/></label>
					</div>
				</div>
			</div>
			<div class="input_div">
				<label for="hobbys"><spring:message code="join.hobbys"/></label><br>
				<div class="hobbysCheckBox">
					<div class="form-check form-check-inline hobbycheck">
						<input class="form-check-input" type="checkbox" name="hobbys" id="trip" value="1">
						<label class="form-check-label" for="trip"><spring:message code="join.hobbys.trip"/></label>
					</div>
					<div class="form-check form-check-inline hobbycheck">
						<input class="form-check-input" type="checkbox" name="hobbys" id="food" value="2">
						<label class="form-check-label" for="food"><spring:message code="join.hobbys.food"/></label>
					</div>
					<div class="form-check form-check-inline hobbycheck">
						<input class="form-check-input" type="checkbox" name="hobbys" id="lan" value="3" > 
						<label class="form-check-label" for="lan"><spring:message code="join.hobbys.language"/></label>
					</div>
					<div class="form-check form-check-inline hobbycheck">
						<input class="form-check-input" type="checkbox" name="hobbys" id="instrument" value="4" > 
						<label class="form-check-label" for="instrument"><spring:message code="join.hobbys.instrument"/></label>
					</div>
					<div class="form-check form-check-inline hobbycheck">
						<input class="form-check-input" type="checkbox" name="hobbys" id="reading" value="5" >
						<label class="form-check-label" for="reading"><spring:message code="join.hobbys.reading"/></label>
					</div>
					<div class="form-check form-check-inline hobbycheck">
						<input class="form-check-input" type="checkbox" name="hobbys" id="exercise" value="6" >
						<label class="form-check-label" for="exercise"><spring:message code="join.hobbys.exercise"/></label>
					</div>
					<div class="form-check form-check-inline hobbycheck">
						<input class="form-check-input" type="checkbox" name="hobbys" id="photo" value="7" >
						<label class="form-check-label" for="photo"><spring:message code="join.hobbys.photo"/></label>
					</div>
					<div class="form-check form-check-inline hobbycheck">
						<input class="form-check-input" type="checkbox" name="hobbys" id="music" value="8">
						<label class="form-check-label" for="music"><spring:message code="join.hobbys.music"/></label>
					</div>
					<div class="form-check form-check-inline hobbycheck">
						<input class="form-check-input" type="checkbox" name="hobbys" id="animal" value="9">
						<label class="form-check-label" for="animal"><spring:message code="join.hobbys.animal"/></label>
					</div>
				</div>
			</div>
			<hr class="mb-4">
			<button type="button" class="btn btn-sm btn-primary" id="btnregister" onclick="formCheck()"><spring:message code="login.signUpBtn"/></button>
			<a class="btn btn-block btn-cancel" href="/member/login" id="cancelBtn"><spring:message code="join.cancelBtn"/></a>
			
			<input type="hidden" name="hobby" id="hobby" value="">
			<input type="hidden" name="password" id="socialPassword" value="${mvo.password }" readonly="readonly">
			<input type="hidden" name="email" id="socialEmail" value="${mvo.email }" readonly="readonly">
			<input type="hidden" name="language" id="socialLanguage" value="${mvo.language }" readonly="readonly">
			<input type="hidden" id="nickCheck" disabled="disabled">
		</form>
	</div>
	<script src="/resources/js/join.js"></script>
	<script>
	function init() {
		joinService.checkNickname(nickname.val(),function(result){
			if(result == '1'){
			    $("input[id=nickCheck]").attr("disabled", false);
			    $("input[id=nickCheck]").val('1');
				return
			}else{
				nicknameNotice.html('<spring:message code="join.nicknameNotice4"/>')
				nicknameNotice.css('display','flex')
				nicknameNotice.css('color','green')
				$("input[id=nickCheck]").attr("disabled", true);
				$("input[id=nickCheck]").val('');
				return
			}
		})
	}
	
	window.onload = init();
	
	//blur 이벤트
	nickname.on("blur",function(){
		nicknameNotice.css('display','none')
		
		if(nickname.val() == ''){
			nicknameNotice.html('<spring:message code="join.nicknameNotice1"/>');
			nicknameNotice.css('display','flex')
			return
		}
		
		if(nickname.val().search(/\s/) != -1){
			nicknameNotice.html('<spring:message code="join.nicknameNotice2"/>');
			nicknameNotice.css('display','flex')
			return
		}
		
		joinService.checkNickname(nickname.val(),function(result){
			if(result == '1'){
				nicknameNotice.html('<spring:message code="join.nicknameNotice3"/>')
				nicknameNotice.css('display','flex')
				$("input[id=nickCheck]").attr("disabled", false);
			    $("input[id=nickCheck]").val('1');
				return
			}else{
				nicknameNotice.html('<spring:message code="join.nicknameNotice4"/>')
				nicknameNotice.css('display','flex')
				nicknameNotice.css('color','green')
				$("input[id=nickCheck]").attr("disabled", true);
				$("input[id=nickCheck]").val('');
				return
			}
		})
	})
	
	birth.on("blur",function(){
		birthNotice.css('display','none')
		
		if(birth.val() == ''){
			birthNotice.html('<spring:message code="join.birthNotice1"/>')
			birthNotice.css('display','flex')
			return
		}
		
		if(birth.val().substr(0,4) < 1900){
			birthNotice.html('<spring:message code="join.birthNotice2"/>')
			birthNotice.css('display','flex')
			return
		}
	})
	
	//유효성 검사
	function formCheck(){
		if(nickname.val() == ''){
			alert('<spring:message code="join.alert.nickname1"/>');
			nickname.focus();
			return
		}
		
		if(nickname.val().search(/\s/) != -1){
			alert('<spring:message code="join.alert.nickname2"/>');
			nickname.focus();
			return
		}
		
		if($("input[id=nickCheck]").val() != ''){
			alert('<spring:message code="join.nicknameNotice3"/>');
			nickname.focus();
			return
		}
		
		if(birth.val() == ''){
			alert('<spring:message code="join.alert.birth1"/>')
			birth.focus();
			return
		}
		
		if(birth.val().substr(0,4) < 1900){
			alert('<spring:message code="join.alert.birth2"/>')
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
		$("#regForm").submit();
	}
	</script>
</body>
</html>