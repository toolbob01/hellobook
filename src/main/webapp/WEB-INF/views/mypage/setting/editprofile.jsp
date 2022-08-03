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


</style>
<div class="container-fluid">
	<div class="container">
		<div class="row">
			<div class="col-3">
				<nav>
					<ul>
						<li><a href="/mypage/setting/editprofile">프로필 수정</a></li>
						<li><a href="/mypage/setting/changepwd">비밀번호 변경</a></li>
						<li><a href="/mypage/setting/quit">회원탈퇴</a></li>
					</ul>
				</nav>
			</div>
			<div class="col-9">
				<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">프로필 수정</h4>
				<form class="validation-form" novalidate="">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="email">이메일</label> <input type="email" class="form-control" id="email" placeholder="" required="">
							<div class="invalid-feedback">이메일을 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="nickname">닉네임</label> <input type="text" class="form-control" id="nickname" placeholder="" value="" required="">
							<div class="invalid-feedback">닉네임을 입력해주세요.</div>
						</div>
					</div>

				

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="pw">비밀번호</label> <input type="password" class="form-control" id="pw" placeholder="" required="">
							<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="pw2">비밀번호확인</label> <input type="password" class="form-control" id="pw2" placeholder="" value="" required="">
						</div>
					</div>
					
				
					
					<div class="col-md-8 mb-3">
							<label for="code">전화번호</label> <input type="text" class="form-control" id="code" placeholder="" required="">

						</div>
										
						
			
					
					<div class="col-md-2 mb-3">
							<label for="code">연령(만)</label> <input type="text" class="form-control" id="code" placeholder="" required="">

						</div>
					


					<div class="mb-3">
						<label for="nickname">모국어</label><br>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1"> <label class="form-check-label" for="inlineCheckbox1">한국어</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2"> <label class="form-check-label" for="inlineCheckbox2">일본어</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2"> <label class="form-check-label" for="inlineCheckbox2">기타</label>
						</div>

					</div>


					


					<div class="mb-3">
						<label for="nickname">성별</label><br>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked=""> <label class="form-check-label" for="exampleRadios1">남성</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2"> <label class="form-check-label" for="exampleRadios2">여성</label>
						</div>
						
					</div>
					
						<div class="mb-3">
						<label for="nickname">관심분야</label><br>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1"> <label class="form-check-label" for="inlineCheckbox1">여행</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2"> <label class="form-check-label" for="inlineCheckbox2">음식</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2"> <label class="form-check-label" for="inlineCheckbox2">언어</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2"> <label class="form-check-label" for="inlineCheckbox2">악기</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2"> <label class="form-check-label" for="inlineCheckbox2">독서</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2"> <label class="form-check-label" for="inlineCheckbox2">운동</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2"> <label class="form-check-label" for="inlineCheckbox2">사진</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2"> <label class="form-check-label" for="inlineCheckbox2">음악</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2"> <label class="form-check-label" for="inlineCheckbox2">동물</label>
						</div>


					</div>





					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement" required=""> <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-helloblue btn-lg btn-block" type="submit">수정	</button>
				</form>
			</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../../footer.jsp" %>