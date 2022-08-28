<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<head>
<script src="https://kit.fontawesome.com/aa30b88fc4.js" crossorigin="anonymous"></script>
</head>
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
	box-shadow: 0 0 0 .25remrgba(13, 110, 253, .25);
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

#pwUpdate{
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
					<h4 class="mb-3"><spring:message code="setting.changePwd.title"/></h4>
					<p><spring:message code="setting.changePwd.logo1"/></p><br/>
					<p>· <text style="color:red;"><spring:message code="setting.changePwd.logo2"/></text></p><br/>
					<p>· <text style="color:red;"><spring:message code="setting.changePwd.logo3"/></text><spring:message code="setting.changePwd.logo4"/></p><br/>
				</div>
				
				<div id="form">
				
					  <form action="/mypage/pwUpdate" method="post" id="pwUpdateForm" name="pwUpdateForm">
							 <input type="hidden" id="email" name="email" value="${svo.email}">
							 <sec:csrfInput/>
						<div class="row" id="pw_input_group">
							<div class="col-md-12 mb-3" id="input_div">
								<input type="password" class="form-control" name="memberPw" id="memberPw" placeholder="<spring:message code="setting.changePwd.nowPwd"/>" required="">
								<i class="fa-solid fa-eye" value=""></i>
							</div>
							<div class="col-md-12 mb-3" id="input_div">
								<input type="password" class="form-control" name="memberPw1" id="memberPw1" placeholder="<spring:message code="setting.changePwd.newPwd1"/>" required="">
								<i class="fa-solid fa-eye"></i>
							</div>
							<div class="col-md-12 mb-3" id="input_div">
								<input type="password" class="form-control" name="memberPw2" id="memberPw2" placeholder="<spring:message code="setting.changePwd.newPwd2"/>" required="">
								<i class="fa-solid fa-eye"></i>
							</div>
						</div>
						<button class="btn btn-primary btn-lg btn-block" id="pwUpdate" name="pwUpdate" type="submit"><spring:message code="setting.changePwd.submit"/></button>
						<button class="btn btn-outline-primary btn-lg btn-block" id="cancleBtn" type="button"><spring:message code="setting.changePwd.cancel"/></button>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script>
	var eyeIcon = $(".fa-solid");
	
	eyeIcon.hover(function(){
		if($(this).attr('class').match('solid')){
			$(this).addClass('fa-regular');
			$(this).removeClass('fa-solid');
			$(this).prev().attr('type','text');
			$(this).prev().focus();
		}else{
			$(this).removeClass('fa-regular');
			$(this).addClass('fa-solid');
			$(this).prev().attr('type','password');
			$(this).prev().focus();
		}
	})
	
</script>

<script type="text/javascript">
 
//현재 비밀번호 입력 시 실행
var email = '<%=(String)session.getAttribute("username")%>';


$('#memberPw').on("change",function(){
	var memberPw = $('#memberPw').val();

	$.ajax({
		url : "/mypage/pwCheck",
		type : "post",
		dataType : "json",
		data : 
			JSON.stringify({
			email : email,
			memberPw : memberPw
		}),
		contentType : "application/json",
		success: function(data){

			if(data=="1"){
				alert("<spring:message code='setting.changePwd.nowPwdCheck'/>");
				return;
			}
			else {
				$('#memberPw').attr("disabled",'disabled');
				
			}
		}
	});
});

//현재 비밀번호와 새 비밀번호 일치 확인
var pwCheck = /^(?=.*?[a-zA-Z0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;


		
//수정버튼 클릭 시 실행		
$("#pwUpdate").on("click", function(){
	
	if($("#memberPw").val()==""){
		alert("<spring:message code='setting.changePwd.valid1'/>");
		$("#memberPw").focus();
		return false;
	}
	if($("#memberPw1").val()==""){
		alert("<spring:message code='setting.changePwd.valid2'/>");
		$("#memberPw1").focus();
		return false;
	}
	if($("#memberPw2").val()==""){
		alert("<spring:message code='setting.changePwd.valid3'/>");
		$("#memberPw2").focus();
		return false;
	}
	if($('#memberPw1').val()==$('#memberPw').val()) {
		alert("<spring:message code='setting.changePwd.valid4'/>");
		$("#memberPw1").focus();
		return false;
	}
	if ($("#memberPw1").val() != $("#memberPw2").val()) {
		alert("<spring:message code='setting.changePwd.valid5'/>");
		$("#memberPw2").focus();
		return false;
	}
	if ($("#memberPw1").val().length < 8 || !pwCheck.test($("#memberPw1").val())) {
		alert("<spring:message code='setting.changePwd.valid6'/>");
		$("#memberPw1").focus();
		return false;
	}
	if($("#memberPw1").val().search(/\s/) != -1){
		alert("<spring:message code='setting.changePwd.valid7'/>");
		$("#memberPw1").focus();
		return false;
	}
	
	return true;
});
	</script>
<%@ include file="../../footer.jsp"%>