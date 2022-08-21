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
	max-width: 580px;
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

#notice>h4 {
	font-weight: bold;
	font-size: 20px;
	margin-bottom: 1.5rem !important;
}

#notice>h4 > small {
	margin-left: 10px;
    font-weight: 100;
    font-size: 12px;
}

#notice>p {
	font-size: 12px;
}

#notice_table>tbody>tr>th {
	border-right: 1px solid #c8c9ca;
	border-bottom: 1px solid #c8c9ca;
}

#notice_table>tbody>tr>td {
	border-bottom: 1px solid #c8c9ca;
}

#notice_table>tbody>tr>th, td {
	padding: 10px;
}

#notice_table {
	font-size: 14px;
	border-bottom: 1px solid #c8c9ca;
	border-top: 1px solid #c8c9ca;
	width: 100%;
	margin: 15px 0px;
}

#checkbox_div {
	position: relative;
}

#checkbox_div > strong {
	position: absolute;
    font-size: 12px;
    font-weight: bold;
    top: 1px;
    left: 20px;
}

#button_div {
	width: 100%;
	text-align: center;
}

/* 모달 */
#conf_pw{
	margin-bottom: 15px;
    padding-bottom: 10px;
    font-size: 20px;
    border-bottom: 6px double #ced4da;
}

#cancelBtn{
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

.form-control:disabled, .form-control[readonly] {
    background-color: #fff;
    opacity: 1;
    pointer-events: none;
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
						<h4 class="mb-3"><spring:message code="setting.quit.title"/><small><spring:message code="setting.quit.notice1"/></small></h4><hr />
						<p>· <strong><spring:message code="setting.quit.notice2"/></strong></p>
						<table id="notice_table">
							<tr>
								<th><spring:message code="setting.quit.notice.table.title1"/></th>
								<td><spring:message code="setting.quit.notice.table.notice1"/></td>
							</tr>
							<tr>
								<th><spring:message code="setting.quit.notice.table.title2"/></th>
								<td><spring:message code="setting.quit.notice.table.notice2"/></td>
							</tr>
							<tr>
								<th><spring:message code="setting.quit.notice.table.title3"/></th>
								<td><spring:message code="setting.quit.notice.table.notice3"/></td>
							</tr>
						</table>
						<hr />
						<br />
						<p style="color: red;"><spring:message code="setting.quit.notice3"/></p>
						<br />
					</div>

					<div id="form">
						<form class="validation-form" novalidate="">
							<div id="checkbox_div">
								<input type="checkbox" id="conf_quit">
								<strong><spring:message code="setting.quit.agreement"/></strong>
							</div>
							<br/>
							<div id="button_div">
								<button class="btn btn-primary btn-lg btn-block" id="quitBtn" type="button"><spring:message code="setting.quit.quitBtn"/></button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- Modal -->
<div class="modal modal-hide fade py-5" tabindex="-1" role="dialog" id="quitModal" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-4 shadow">
      <div class="modal-body p-5">
      	<form class="validation-form" novalidate="">
      		<h4 id="conf_pw"><spring:message code="setting.quit.modal.confirm.title"/></h4>
			<div class="row" id="pw_input_group">
				<div class="col-md-12 mb-3" id="input_div">
					<input class="form-control" type="text" id="email" name="email" value="${svo.email}" readonly="readonly"/>
				</div>
				<div class="col-md-12 mb-3" id="input_div">
					<input type="password" class="form-control" id="userpw" placeholder="<spring:message code="setting.quit.modal.confirm.placeholder"/>" required="">
					<i class="fa-solid fa-eye"></i>
				</div>
			</div>
			<div id="button_div">
				<button class="btn btn-helloblue btn-lg btn-block" id="confQuitBtn" type="button"><spring:message code="setting.quit.quitBtn"/></button>
				<button class="btn btn-helloblue btn-lg btn-block" id="cancelBtn" type="button"><spring:message code="setting.quit.cancelBtn"/></button>
			</div>
		</form>
      </div>
    </div>
  </div>
</div>


<script>
	$('#quitBtn').on("click",function(){
		if(!$('#conf_quit').is(":checked")){
			alert('<spring:message code="setting.quit.alert1"/>')
			return;
		}
		
		$('#quitModal').modal('show');
	})
	
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
	
	var quitService = (function() {
		function quitUser(email, password, callback, err) {
			var data = {
					email:email,
					password:password
			} 
			$.ajax({
				type:"post",
				url:"/mypage/setting/quit",
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
		
		return {quitUser:quitUser};
	})()
	
	//비밀번호 확인
	$('#confQuitBtn').on("click",function(e){
		var email = $('#email').val();
		var password = $('#userpw').val();
		
		if(password == ""){
			alert("")
			return;
		}
		
		if(confirm('<spring:message code="setting.quit.confirm1"/>\n<spring:message code="setting.quit.confirm2"/>')){
		//ajax로 비밀번호 넘겨서 결과 받아오기
			quitService.quitUser(email, password, function(result){
				console.log(result);
				if(result == 0){
					alert('<spring:message code="setting.quit.alert3"/>\n<spring:message code="setting.quit.alert4"/>')
					logoutFN();
					return;
				}else if(result == 1){
					//비밀번호가 틀렸을 시
					alert('<spring:message code="setting.quit.alert5"/>')
					return false;
				} 
			});
		}
	})
	
	// 모달 안의 취소 버튼에 이벤트를 건다.
	$('#cancelBtn').on('click', function(){
		$('#quitModal').modal('hide');
		$('#userpw').val('');
	});
</script>

<%@ include file="../../footer.jsp"%>