<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<style>
	.mt-50px { margin-top: 50px; }
	
	.mb-3px { margin-bottom: 3px; }
	
	.carousel-inner {
		position: relative;
	    width: 100%;
	    overflow: auto;
	    height: 55vh;
	}
	.carousel-item img {
		width: 100%;
	    height: 100%;
	    margin: 0;
	    padding: 0;
	}
	.fileVO_div {
		position: relative;
	    width: 80%;
	    overflow: auto;
	    height: 35vh;
	    border: 3px outset #9fd5ff;
	    margin-left: auto;
	    margin-right: auto;
	}
	.fileVO_img img {
		width: 100%;
	    height: 100%;
	    margin: 0;
	    padding: 0;
	}
</style>

	<div class="container post_write_page">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-5 text-center fs-1">게시글 수정</h4>
				<form class="validation-form" novalidate id="postUpdateForm" name="postingForm" method="post" action="/post/post_update" enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="hidden" name="pno" value="${postVO.pno}" />
					<input type="hidden" name="email" value="${username}" />

					<div class="mb-5">
						<label class="fs-3 mb-2" for="content">내용</label>
						<textarea class="form-control hello-scroll" rows="5" 
								  name="content" id="content" placeholder="포스트 내용을 입력해주세요."><c:out value="${postVO.content}"/></textarea>
					</div>

					<div>
					    <label class="fs-3 mt-5 mb-2" for="uploadfile">기존 사진 삭제</label>
					</div>

					<div class="my-3 text-center">
						<c:forEach var="fileVO" items="${postVO.file_list}">
						  <div class="d-flex align-items-center">
						    <div class="fileVO_div hello-scroll my-3">
							  <div class="fileVO_img">
							    <img src="/hello_img/post/${fileVO.uuid}" alt="...">
							  </div>
						    </div>
							<button type="button" class="btn btn-secondary">삭제</button>
						  </div>
						</c:forEach>
					</div>

					<div>
					    <label class="fs-3 mb-2" for="uploadfile">추가할 사진 미리보기</label>
					</div>

					<!-- Carousel -->
					<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">
					  <div class="carousel-inner">
					    <div class="carousel-item active uploadfile0">
					      <img src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image" class="d-block w-100" alt="...">
					    </div>
					  </div>
					  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Previous</span>
					  </button>
					  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden">Next</span>
					  </button>
					</div>

					<table class="table __add mb-3"> 
					  <tr>
					    <td>
					  	  <input type="file" class="form-control uploadfile " name="uploadfile" id="uploadfile" onchange="fileCheck(this)">
					    </td>
					    <td>
					      <button type="button" class="_add btn btn-primary ">추가</button>
					    </td>
					  </tr> 
					</table>

					<div class="mt-5 text-center">
						<button type="button" class="btn btn-sm btn-primary" id="btnSave" onclick="return postUpdateCheck()">수정</button>
						<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='/'">목록</button>
					</div>
				</form>
			</div>
		</div>
	</div>

<script>

// Add File Input
var file_list_size = 3;
var uploadfileCnt = 1;

$('.__add ._add').on('click',function(){ 
   if(uploadfileCnt >= 5){
      alert("파일 업로드 최대 개수는 5개 입니다.");
      return;
   }else{
       $('.__add').append('<tr>' + 
		    			    '<td>' + 
		    			      '<input type="file" class="form-control uploadfile" name="uploadfile" id="uploadfile" onchange="fileCheck(this)">' +
		    			    '</td>' + 
		    			    '<td>' + 
		    			      '<button type="button" class="btn btn-secondary" onclick="addDel(this);">삭제</button>' + 
		    			    '</td>' +
		    			  '</tr>' ); 
       uploadfileCnt ++;
   }
});

// Delete File Input
function addDel(a){ 
	$(a).closest('tr').remove(); 
    uploadfileCnt --;
}

// File Size Check
function fileCheck(file) {
    var maxSize  = 3 * 1024 * 1024; 
    var fileSize = 0;
    fileSize = file.files[0].size;
    if(fileSize > maxSize)
    {
        alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.    ");
        file.value = "";
        return;
    }
}

// Form Submit Script
function postUpdateCheck(){
	if( $("#content").val() == "" ) {
		alert("내용을 입력해주세요");
		$("#content").focus();
		return false;
	}

	var file_list = new Array();
	$(".uploadfile").each(function(index, item){
		file_list.push($(item).val());
	})
	
  	for( var i=0; i<file_list.length; i++ ){
		var nowUpload = file_list[i];
		console.log( nowUpload );
		if( nowUpload == "" ) {
			alert("이미지를 첨부해주세요.");
			return false;
		}
		if( nowUpload != "" ){
			var ext = nowUpload.split('.').pop().toLowerCase();
			if( $.inArray(ext,['gif','jpg','png','jpeg']) == -1 ) { 
				alert('첨부파일은 (gif,jpg,png,jpeg) 이미지만 업로드 가능합니다.');
				nowUpload.value = "";
				return false;
			}
		}
	}
	
	if( confirm('게시물을 수정하시겠습니까?') ) {
	 	$("#postUpdateForm").submit();
	}else {
		return;
	}
}
</script>


<%@ include file="../footer.jsp"%>