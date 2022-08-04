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
					<h4 class="mb-3">비밀번호 변경</h4>
					<p>안전한 비밀번호로 내정보를 보호하세요</p><br/>
					<p>· <text style="color:red;">다른 아이디/사이트에서 사용한 적 없는 비밀번호</text></p><br/>
					<p>· <text style="color:red;">이전에 사용한 적 없는 비밀번호</text>가 안전합니다.</p><br/>
				</div>
				
				<div id="form">
					<form class="validation-form" novalidate="">

						<div class="row" id="pw_input_group">
							<div class="col-md-12 mb-3" id="input_div">
								<input type="password" class="form-control" id="now_pw" placeholder="현재 비밀번호" required="">
								<i class="fa-solid fa-eye"></i>
							</div>
							<div class="col-md-12 mb-3" id="input_div">
								<input type="password" class="form-control" id="new_pw" placeholder="새 비밀번호" required="">
								<i class="fa-solid fa-eye"></i>
							</div>
							<div class="col-md-12 mb-3" id="input_div">
								<input type="password" class="form-control" id="conf_pw2" placeholder="새 비밀번호 확인" required="">
								<i class="fa-solid fa-eye"></i>
							</div>
						</div>
						<button class="btn btn-helloblue btn-lg btn-block" id="changePwBtn" type="submit">확인</button>
						<button class="btn btn-helloblue btn-lg btn-block" id="cancleBtn" type="button">취소</button>
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
<%@ include file="../../footer.jsp"%>