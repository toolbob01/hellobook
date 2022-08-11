<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

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

.postwrite {
	font-family: 'Inconsolata', 'Kosugi Maru', 'Noto Sans KR';
	font-size: 30px;
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
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}

.input-form label {
	margin-bottom: 10px;
}

.input-form h4 {
	font-size: 40px;
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
</style>

	<div class="container postwrite">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3"">게시글 등록</h4>
				<form class="validation-form" novalidate method="post" action="/post/post_write" enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="hidden" name="email" value="${username}" />
					
<!-- 					<div class="mb-3"> -->
<!-- 						<label for="title">제목</label> <input type="text" -->
<!-- 							class="form-control" name="title" id="title" -->
<!-- 							style="font-size: 25px;" placeholder="제목을 입력해 주세요"> -->
<!-- 					</div> -->

					<div class="mb-3">
						<label for="content">내용</label>
						<textarea class="form-control" rows="5" name="content"
							id="content" placeholder="내용을 입력해 주세요" style="font-size: 25px;"></textarea>
					</div>

					<div class="mb-3">
						<label for="uploadfile">사진</label> <input type="file"
							class="form-control" name="uploadfile" id="uploadfile" placeholder="사진을 넣어주세요">
					</div>

					<div>
						<button type="submit" class="btn btn-sm btn-primary" id="btnSave">저장</button>
						<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="">목록</button>
					</div>
				</form>
			</div>
		</div>

	</div>


<%@ include file="../footer.jsp"%>