<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<style>
body {
	
}

.input-form {
	max-width: 480px;
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
	
	#sexCheckDiv{
		display: flex;
	    justify-content: flex-start;
	    margin-left: 0px;
	    margin-top: 5px;
	}
	
	#hobbyCheckBox{
		display: flex;
	    justify-content: space-around;
	}
	
	.form-check-inline{
		margin-top: 5px;
    	margin-bottom: 5px;
	}
	
	#nickname-notice{
		margin-top: 7px;
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
					<h4 class="mb-3"><spring:message code="setting.editProfile.title"/></h4>
				</div>
				<form class="validation-form" id="regForm" action="/mypage/setting/editprofile" method="post" novalidate>
				<sec:csrfInput/>
				<div class="row">
					<div class="col-md-12 mb-3">
						<div class="input_div">

							<label for="nickname"><spring:message code="setting.editProfile.nickname"/></label> 
							<input type="text"
								class="form-control" id="nickname" name="nickname" value="${svo.nickname}" placeholder="">

							<div class="notice-bubble" id="nickname-notice"></div>
						</div>
					</div>
					
					<div class="col-md-12 mb-3">
						<div class="input_div">

							<label for="nickname"><spring:message code="setting.editProfile.introduce"/></label> 
							<input type="text"
								class="form-control" id="nickname" name="intro" value="${svo.intro}" placeholder="">

							<div class="notice-bubble" id="nickname-notice"></div>
						</div>
					</div>
					
					<div class="col-md-12 mb-3">
						<div class="input_div">
							<label for="language"><spring:message code="setting.editProfile.language"/></label><br>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" name="language" id="korean" value="K" onclick="checkOnlyOne(this)">
								<label class="form-check-label" for="korean"><spring:message code="setting.editProfile.Korean"/></label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" name="language" id="japanese" value="J" onclick="checkOnlyOne(this)">
									<label class="form-check-label" for="japanese"><spring:message code="setting.editProfile.Japanese"/></label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" name="language" id="etc" value="E" onclick="checkOnlyOne(this)">
								<label class="form-check-label" for="etc"><spring:message code="setting.editProfile.Etc"/></label>
							</div>
							<div class="notice-bubble" id="lan-notice"><spring:message code="setting.editProfile.checkLang"/></div>
						</div>
					</div>
					<div class="col-md-12 mb-3">
						<div class="input_div">
							<label for="birth"><spring:message code="setting.editProfile.birth"/></label>
							<input type="date" class="form-control" name="birth" id="birth" min="1900-01-01" value="${svo.birth}" placeholder="yyyy-mm-dd" style="width: 50%; min-width: 10px;" >
							<div class="notice-bubble" id="birth-notice"></div>
						</div>
					</div>
					<div class="col-md-12 mb-3">
						<div class="input_div">
							<label for="sex"><spring:message code="setting.editProfile.sex"/></label><br>
							<div class="row" id="sexCheckDiv">
								<div class="form-check col-md-3 mb-3">
									<input class="form-check-input" type="radio" name="sex" id="male" value="M" checked>
									<label class="form-check-label" for="male"><spring:message code="setting.editProfile.male"/></label>
								</div>
								<div class="form-check col-md-3 mb-3">
									<input class="form-check-input" type="radio" name="sex" id="female" value="F">
									<label class="form-check-label" for="female"><spring:message code="setting.editProfile.female"/></label>
								</div>
							</div>
						</div>
					</div>
					<div class="mb-3">
						<div class="row" id="hobbyCheckBox">
							<label for="nickname"><spring:message code="setting.editProfile.hobby"/></label><br>
							<div class="form-check form-check-inline col-md-3">
								<input class="form-check-input" type="checkbox" name="hobbys" id="trip" value="1" >
								<label class="form-check-label" for="trip"><spring:message code="setting.editProfile.trip"/></label>
							</div>
							<div class="form-check form-check-inline col-md-3">
								<input class="form-check-input" type="checkbox" name="hobbys" id="food" value="2" > 
								<label class="form-check-label" for="food"><spring:message code="setting.editProfile.food"/></label>
							</div>
							<div class="form-check form-check-inline col-md-3">
								<input class="form-check-input" type="checkbox" name="hobbys" id="lan" value="3" > 
								<label class="form-check-label" for="lan"><spring:message code="setting.editProfile.lan"/></label>
							</div>
							<div class="form-check form-check-inline col-md-3">
								<input class="form-check-input" type="checkbox" name="hobbys" id="instrument" value="4" > 
								<label class="form-check-label" for="instrument"><spring:message code="setting.editProfile.instrument"/></label>
							</div>
							<div class="form-check form-check-inline col-md-3">
								<input class="form-check-input" type="checkbox" name="hobbys" id="reading" value="5" >
								<label class="form-check-label" for="reading"><spring:message code="setting.editProfile.read"/></label>
							</div>
							<div class="form-check form-check-inline col-md-3">
								<input class="form-check-input" type="checkbox" name="hobbys" id="exercise" value="6" >
								<label class="form-check-label" for="exercise"><spring:message code="setting.editProfile.workout"/></label>
							</div>
							<div class="form-check form-check-inline col-md-3">
								<input class="form-check-input" type="checkbox" name="hobbys" id="photo" value="7" >
								<label class="form-check-label" for="photo"><spring:message code="setting.editProfile.photo"/></label>
							</div>
							<div class="form-check form-check-inline col-md-3">
								<input class="form-check-input" type="checkbox" name="hobbys" id="music" value="8" >
								<label class="form-check-label" for="music"><spring:message code="setting.editProfile.music"/></label>
							</div>
							<div class="form-check form-check-inline col-md-3">
								<input class="form-check-input" type="checkbox" name="hobbys" id="animal" value="9" >
								<label class="form-check-label" for="animal"><spring:message code="setting.editProfile.animal"/></label>
							</div>
						</div>
					</div>
				</div>

				
				<div class="mb-4"></div>
				<button class="btn btn-primary btn-lg btn-block" type="button" onclick="formCheck()"><spring:message code="setting.editProfile.submit"/>
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
	nicknameNotice.css('color','green')
	if(nickname.val() == ''){
		nicknameNotice.html('<spring:message code="setting.editProfile.checkNickname1"/>');
		nicknameNotice.css('display','flex')
		nicknameNotice.css('color','red')
		nickname.focus();
		return
	}
	
	if(nickname.val().search(/\s/) != -1){
		nicknameNotice.html('<spring:message code="setting.editProfile.checkNickname2"/>');
		nicknameNotice.css('display','flex')
		nicknameNotice.css('color','red')
		nickname.focus();
		return
	}
	
	if(nickname.val().search("#") != -1){
		nicknameNotice.html('<spring:message code="setting.editProfile.checkNickname5"/>');
		nicknameNotice.css('display','flex')
		nicknameNotice.css('color','red')
		nickname.focus();
		return
	}
	
	var Nname = nickname.val();
	var Sname = "${svo.nickname}";
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	$.ajax({
		url : "/member/checkNickname",
		type : "get",
		data : {nickname : Nname},
		dataType : 'json',

		success : function(result) {
			console.log(result);
			if(result != 0) {
				if(Nname == Sname) {
					nicknameNotice.html('<spring:message code="setting.editProfile.checkNickname3"/>');
					nicknameNotice.css('display','flex')
				} else {
					nicknameNotice.html('<spring:message code="setting.editProfile.checkNickname5"/>');
					nicknameNotice.css('display','flex');
					nickname.focus();
					return
				}
			} else {
				nicknameNotice.html('<spring:message code="setting.editProfile.checkNickname4"/>');
				nicknameNotice.css('display','flex')
			}
		},
		error : function() {
			alert('<spring:message code="setting.editProfile.error"/>');
		}
	});

});

birth.on("blur",function(){
	birthNotice.css('display','none')
	
	if(birth.val() == ''){
		birthNotice.html('<spring:message code="setting.editProfile.checkBirth1"/>')
		birthNotice.css('display','flex')
		birth.focus();
		return
	}
	
	if(birth.val().substr(0,4) < 1900){
		birthNotice.html('<spring:message code="setting.editProfile.checkBirth2"/>')
		birthNotice.css('display','flex')
		birth.val("");
		birth.focus();
		return
	}
})

//유효성 검사
function formCheck(){
	
	if(nickname.val() == ''){
		alert('<spring:message code="setting.editProfile.checkNickname1"/>');
		nickname.focus();
		return
	}
	
	if(nickname.val().search(/\s/) != -1){
		alert('<spring:message code="setting.editProfile.checkNickname2"/>');
		nickname.focus();
		return
	}
	
	if(nickname.val().search("#") != -1) {
		alert('<spring:message code="setting.editProfile.checkNickname5"/>');
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
		alert('<spring:message code="setting.editProfile.checkLang"/>')
		return
	}
	
	if(birth.val() == ''){
		alert('<spring:message code="setting.editProfile.checkBirth1"/>')
		birth.focus();
		return
	}
	
	if(birth.val().substr(0,4) < 1900){
		alert('<spring:message code="setting.editProfile.checkBirth2"/>')
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
	console.log("여기까지 오나?");
	$('#regForm').submit();
}

$(function() {
	var lang = "${svo.language}";
	var sex = "${svo.sex}";
	var hobby = "${svo.hobby}"
	
	if(sex == "M") {
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