<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<style>
body {
	
}

.input-form {
	max-width: 680px;
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
	margin-bottom: 5px;
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
        box-shadow: 0 0 0 .25remrgba(13,110,253,.25);
    }

    .btn-helloblue {
        color: #000;
        background-color: #9fd5ff;
        border-color: #9fd5ff;
        font-weight: 600
    }
    
	#notice {
		margin-bottom: 25px
	}
	
	#notice > h4 {
		font-weight: bold;
	    font-size: 20px;
	    margin-bottom: 1.5rem!important;
	}
	
	#notice >p {
		font-size: 14px;
	}
	
	#changePwBtn{
	    width: 100%;
	    margin-bottom: 10px;
	}
	
	#cancleBtn{
	    width: 100%;
	    background: white;
	}
	
	#input_div{
		position: relative;
	}
	
	.fa-eye{
		position: absolute;
	    top: 11px;
	    right: 21px;
	    cursor: pointer;
	}
	
	#pw_input_group{
		margin-bottom: 25px;
	}

</style>
<div class="container-fluid">
	<div class="container">
		<div class="row">
			<div class="col-3">
				<%@ include file="sidebar.jsp" %>
			</div>
			<div class="col-9">
				<div class="input-form col-md-12 mx-auto">
				<div id="notice">
					<h4 class="mb-3">프로필 수정</h4>
				</div>
				<form class="validation-form" id="regForm" action="/mypage/setting/editprofile" method="post" novalidate>
				<sec:csrfInput/>
				<div class="row">
					<div class="col-md-12 mb-3">
						<div class="input_div">

							<label for="nickname">닉네임</label> 
							<input type="text"
								class="form-control" id="nickname" name="nickname" value="${svo.nickname}" placeholder="">

							<div class="notice-bubble" id="nickname-notice"></div>
						</div>
					</div>
					
					<div class="col-md-12 mb-3">
						<div class="input_div">

							<label for="nickname">자기소개</label> 
							<input type="text"
								class="form-control" id="nickname" name="intro" value="${svo.intro}" placeholder="">

							<div class="notice-bubble" id="nickname-notice"></div>
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
							<input type="date" class="form-control" name="birth" id="birth" min="1900-01-01" value="${svo.birth}" style="width: 50%; min-width: 10px;" >
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

				
				<div class="mb-4"></div>
				<button class="btn btn-primary btn-lg btn-block" type="button" onclick="formCheck()">수정
				</button>
				
				<input type="hidden" name="hobby" id="hobby" value="">
			</form>
			</div>
			</div>
		</div>
	</div>
</div>

<script>
function checkOnlyOne(element) {
	const checkboxes = document.getElementsByName("language");
	checkboxes.forEach((cb)=> {
		cb.checked = false;
	})
	
	element.checked = true;
}

function checkForm(){
	console.log("유효성 검사");
}

const nickname = $("#nickname");
const language = document.getElementsByName("language");
const birth = $("#birth");
const sex = $("#sex");
const hobbys = document.getElementsByName("hobbys");
const hobby = $("#hobby");

const nicknameNotice = $("#nickname-notice");
const lanNotice = $("#lan-notice");
const birthNotice = $("#birth-notice");

var pwCheck = /^(?=.*?[a-zA-Z0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

//blur 이벤트
nickname.on("blur",function(){
	nicknameNotice.css('display','none')
	
	if(nickname.val() == ''){
		nicknameNotice.html("닉네임을 입력해주세요.");
		nicknameNotice.css('display','flex')
		nickname.focus();
		return
	}
	
	if(nickname.val().search(/\s/) != -1){
		nicknameNotice.html("닉네임은 공백을 포함할 수 없습니다.");
		nicknameNotice.css('display','flex')
		nickname.focus();
		return
	}
})

birth.on("blur",function(){
	birthNotice.css('display','none')
	
	if(birth.val() == ''){
		birthNotice.html("생년월일을 입력해주세요.")
		birthNotice.css('display','flex')
		birth.focus();
		return
	}
	
	if(birth.val().substr(0,4) < 1900){
		birthNotice.html("1900년 미만은 입력하실 수 없습니다.")
		birthNotice.css('display','flex')
		birth.val("");
		birth.focus();
		return
	}
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
	
	$("#regForm").submit();
}

$(function() {
	var lang = "${svo.language}";
	var sex = "${svo.sex}";
	var hobby = "${svo.hobby}"
	
	if(sex=="M") {
		$("#male").prop("checked",true);
		$("#female").prop("checked",false);
	}else {
		$("#male").prop("checked",false);
		$("#female").prop("checked",true);
	}
	
	if(lang == "K") {
		$("#korean").prop("checked",true);
	} else if(lang == "J") {
		$("#japanese").prop("checked",true);
	} else {
		$("#etc").prop("checked",true);
	}
	
	if(hobby.includes("1")) {
		$("#trip").prop("checked",true);
	} 
	if(hobby.includes("2")) {
		$("#food").prop("checked",true);
	} 
	if(hobby.includes("3")) {
		$("#lan").prop("checked",true);
	} 
	if(hobby.includes("4")) {
		$("#instrument").prop("checked",true);
	} 
	if(hobby.includes("5")) {
		$("#reading").prop("checked",true);
	} 
	if(hobby.includes("6")) {
		$("#exercise").prop("checked",true);
	}
	if(hobby.includes("7")) {
		$("#photo").prop("checked",true);
	} 
	if(hobby.includes("8")) {
		$("#music").prop("checked",true);
	} 
	if(hobby.includes("9")) {
		$("#animal").prop("checked",true);
	}
});

</script>

<%@ include file="../../footer.jsp" %>