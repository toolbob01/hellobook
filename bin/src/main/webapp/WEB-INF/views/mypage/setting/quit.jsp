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

#cancleBtn{
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
						<h4 class="mb-3">탈퇴 안내<small>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해 주세요.</small></h4><hr />
						<p>· <strong>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</strong></p>
						<table id="notice_table">
							<tr>
								<th>채팅</th>
								<td>채팅 계정 및 보관 중인 채팅 삭제</td>
							</tr>
							<tr>
								<th>포스트</th>
								<td>포스트 계정 및 게시물 삭제</td>
							</tr>
							<tr>
								<th>친구 목록</th>
								<td>저장된 친구 목록 삭제</td>
							</tr>
						</table>
						<hr />
						<br />
						<p style="color: red;">탈퇴 후에는 아이디와 데이터는 복구할 수 없습니다.</p>
						<br />
					</div>

					<div id="form">
						<form class="validation-form" novalidate="">
							<div id="checkbox_div">
								<input type="checkbox" id="conf_quit">
								<strong>안내 사항을 모두 확인하였으며, 이에 동의합니다.</strong>
							</div>
							<br/>
							<div id="button_div">
								<button class="btn btn-primary btn-lg btn-block" id="quitBtn" type="button">탈퇴</button>
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
      		<h4 id="conf_pw">비밀번호 재확인</h4>
			<div class="row" id="pw_input_group">
				<div class="col-md-12 mb-3" id="input_div">
					<input type="text" class="form-control" id="userid" value="userid" readonly="readonly" required="">
				</div>
				<div class="col-md-12 mb-3" id="input_div">
					<input type="password" class="form-control" id="userpw" placeholder="비밀번호를 입력해주세요" required="">
					<i class="fa-solid fa-eye"></i>
				</div>
			</div>
			<div id="button_div">
				<button class="btn btn-helloblue btn-lg btn-block" id="confQuitBtn" type="submit">탈퇴</button>
				<button class="btn btn-helloblue btn-lg btn-block" id="cancleBtn" type="button">취소</button>
			</div>
		</form>
      </div>
    </div>
  </div>
</div>


<script>
	$('#quitBtn').on("click",function(){
		if(!$('#conf_quit').is(":checked")){
			alert("탈퇴 안내를 확인하고 동의해 주세요.")
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
	
	//비밀번호 확인
	$('#confQuitBtn').on("click",function(e){
		//ajax로 비밀번호 넘겨서 받아오기
		var pw = '1234';
		if($('#userpw').val() != pw){
			//비밀번호가 틀렸을 시
			alert("비밀번호가 일치하지않습니다.")
			return false;
		}else{
			if(confirm("탈퇴한 아이디는 복구하실 수 없습니다.\n정말 탈퇴하시겠습니까?")){
				return true;
			}
			
			return false;
		}
	})
	
	// 모달 안의 취소 버튼에 이벤트를 건다.
	$('#cancleBtn').on('click', function(){
		$('#quitModal').modal('hide');
		$('#userpw').val('');
	});
</script>

<%@ include file="../../footer.jsp"%>