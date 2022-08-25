<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
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
					<h4 class="mb-3">비밀번호 변경</h4>
					<p>안전한 비밀번호로 내정보를 보호하세요</p><br/>
					<p>· <text style="color:red;">다른 아이디/사이트에서 사용한 적 없는 비밀번호</text></p><br/>
					<p>· <text style="color:red;">이전에 사용한 적 없는 비밀번호</text>가 안전합니다.</p><br/>
				</div>
				
				<div id="form">
				
					  <form action="/member/pwUpdate" method="post" id="pwUpdateForm" name="pwUpdateForm">
							 <input type="hidden" id="email" name="email" value="${svo.email}">
							 
						<div class="row" id="pw_input_group">
							<div class="col-md-12 mb-3" id="input_div">
								<input type="password" class="form-control" name="memberPw" id="memberPw" placeholder="현재 비밀번호" required="">
								<i class="fa-solid fa-eye" value=""></i>
							</div>
							<div class="col-md-12 mb-3" id="input_div">
								<input type="password" class="form-control" name="memberPw1" placeholder="새 비밀번호" required="">
								<i class="fa-solid fa-eye"></i>
							</div>
							<div class="col-md-12 mb-3" id="input_div">
								<input type="password" class="form-control" name="memberPw2" placeholder="새 비밀번호 확인" required="">
								<i class="fa-solid fa-eye"></i>
							</div>
						</div>
						<button class="btn btn-primary btn-lg btn-block" id="pwUpdate" name="pwUpdate" type="submit">확인</button>
						<button class="btn btn-outline-primary btn-lg btn-block" id="cancleBtn" type="button">취소</button>
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
		$(document).ready(function(){
		
			$("#pwUpdate").on("click", function(){
				if($("#memberPw").val==""){
					alert("현재 비밀번호를 입력해주세요");
					$("#memberPw").focus();
					return false
				}
				if($("#memberPw1").val==""){
					alert("변경비밀번호을를 입력해주세요");
					$("#memberPw1").focus();
					return false
				}
				if($("#memberPw2").val==""){
					alert("변경비밀번호를 입력해주세요");
					$("#memberPw2").focus();
					return false
				}
				if ($("#memberPw").val() != $("#memberPw2").val()) {
					alert("변경비밀번호가 일치하지 않습니다.");
					$("#memberPw2").focus();
					 
				
				$.ajax({
					url : "/member/pwCheck",
					type : "POST",
					dataType : "json",
					data : $("#pwUpdateForm").serializeArray(),
					success: function(data){
						
						if(data==0){
							alert("패스워드가 틀렸습니다.");
							return;
						}else{
							if(confirm("변경하시겠습니까?")){
								$("#pwUpdateForm").submit();
							}
							
						}
					}
				})
				
			});
			
				
			
		})
	</script>
<%@ include file="../../footer.jsp"%>