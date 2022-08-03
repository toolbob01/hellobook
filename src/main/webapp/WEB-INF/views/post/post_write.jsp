<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<style>
body {
	  padding-top: 70px;
	  padding-bottom: 30px;
}
</style>
</head>
<body>
	<article>
		<div class="container" role="main">
		
			<form name="form" id="form" role="form" method="post"
				action="">
				<div class="mb-3">
					<label for="title">제목</label> <input type="text"
						class="form-control" name="title" id="title"
						placeholder="제목을 입력해 주세요">
				</div>
				
				<div class="mb-3">
					<label for="tag">사진</label> <input type="text"
						class="form-control" name="img" id="img" placeholder="사진을 넣어주세요">
				</div>
				
				
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="content"
						placeholder="내용을 입력해 주세요"></textarea>
				</div>
			</form>
			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
		</div>
	</article>
</body>
</html>



<%@ include file="../footer.jsp"%>