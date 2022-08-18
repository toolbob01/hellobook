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
				<form id="postUpdateForm" method="post" action="/post/post_update" enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="hidden" name="pno" value="${postVO.pno}" />
					<input type="hidden" name="email" value="${username}" />
					<!-- List of existingFile ( fileVO.fno ) -->
					<input type="hidden" name="existingFile" value="-1"> <!-- Preventing null pointer -->

					<div class="mb-5">
						<label class="fs-3 mb-2" for="content">내용</label>
						<textarea class="form-control hello-scroll" rows="5" 
								  name="content" id="content" placeholder="포스트 내용을 입력해주세요."><c:out value="${postVO.content}"/></textarea>
					</div>

					<hr class="hello-hr mt-5">

					<div>
					    <label class="fs-3 mt-5 mb-2" for="uploadfile">기존 사진 삭제</label>
					</div>

					<div class="my-3 text-center" id="existing-file-div">
						<c:forEach var="fileVO" items="${postVO.file_list}">
						  <div class="d-flex align-items-center">
						    <div class="fileVO_div hello-scroll my-3">
							  <div class="fileVO_img">
							    <img src="/hello_img/post/${fileVO.uuid}" alt="...">
							    <input type="hidden" name="existingFile" value="${fileVO.fno}">
							  </div>
						    </div>
							<button type="button" class="btn btn-secondary btn-delete">삭제</button>
						  </div>
						</c:forEach>
					</div>

					<hr class="hello-hr my-5">

					<div>
					    <label class="fs-3 mt-5 mb-2" for="uploadfile">추가할 사진 미리보기</label>
					</div>

				  <div id="preview-div">
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

					<table class="table __add mt-5 mb-2"> 
					  <tr>
					    <td>
						  <div class="mb-4 text-center">
							<input type="file" class="form-control uploadfile" id="uploadfile1" name="uploadfile" onchange="fileCheck(this)">
						  </div>
					    </td>
					    <td>
					      <button type="button" class="_add btn btn-primary mb-3px btnBtn" data-idx="uploadfile0">추가</button>
					    </td>
					  </tr> 
					</table>
				  </div> <!-- /preview-div -->
				  
					<div class="mt-5 text-center">
						<button type="button" class="btn btn-sm btn-primary" id="btnUpdate" onclick="return postUpdateCheck()">수정</button>
						<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='/'">목록</button>
					</div>
				</form>
			</div>
		</div>
	</div>

<script>

var existingCnt = 0;
var uploadfileCnt = 1;

// Calculating count of ExistingFile & Uploadfile
$(document).ready(function(){
	existingCnt = $("#existing-file-div").find('.d-flex').length;
	if( existingCnt == 5 ) {
		$("#preview-div").empty();
		$("#preview-div").append('<p class="text-center fs-5 my-5">사진은 최대 5개까지 첨부 가능합니다.</p>');
		uploadfileCnt = 0;
	}
	console.log("existing : " + existingCnt); //
	console.log("uploadfile : " + uploadfileCnt); //
});

// Delete Existing Image
$(".btn-delete").on("click", function() {
	if( existingCnt == 5 ) {
		$(this).closest('.d-flex').remove();
		existingCnt = 4;
		uploadfileCnt = 1;
		$("#preview-div").empty();
		$("#preview-div").append('<!-- Carousel --><div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false"><div class="carousel-inner"><div class="carousel-item active uploadfile0"><img src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image" class="d-block w-100" alt="..."></div></div><button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev"><span class="carousel-control-prev-icon" aria-hidden="true"></span><span class="visually-hidden">Previous</span></button><button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next"><span class="carousel-control-next-icon" aria-hidden="true"></span><span class="visually-hidden">Next</span></button></div><table class="table __add mt-5 mb-2"><tr><td><div class="mb-4 text-center"><input type="file" class="form-control uploadfile" id="uploadfile1" name="uploadfile" onchange="fileCheck(this)"></div></td><td><button type="button" class="_add btn btn-primary mb-3px btnBtn" data-idx="uploadfile0">추가</button></td></tr></table>');
	}else {
		$(this).closest('.d-flex').remove();
		existingCnt = $("#existing-file-div").find('.d-flex').length;
		if( existingCnt == 0 ) {
			$("#existing-file-div").append('<p class="text-center fs-5 my-5">기존의 이미지 파일을 전부 삭제하였습니다.</p>');
		}
	}
	console.log("existing : " + existingCnt); //
	console.log("uploadfile : " + uploadfileCnt); //
})

// Add File Input
$(document).on("click",".__add ._add",function() {
	if( existingCnt + uploadfileCnt >= 5){
		alert("최대 업로드 수는 5개 입니다 (기존 이미지 포함)");
		return;
	}else{
		uploadfileCnt ++;
		$('.__add').append('<tr>' + 
					    	'<td>' + 
						  	  '<div class="mb-3 text-center">' + 
							    '<input type="file" class="form-control uploadfile" id="uploadfile" name="uploadfile" onchange="fileCheck(this)">' + 
						  	  '</div>' + 
							'</td>' +  
		    			    '<td>' + 
		    			      '<button type="button" class="btn btn-secondary mb-3px btnBtn" data-idx="uploadfile1234" onclick="addDel(this);">삭제</button>' + 
		    			    '</td>' +
		    			  '</tr>' ); 
		$('.carousel-inner').append('<div class="carousel-item">' + 
	      						     '<img src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image" class="d-block w-100" alt="...">' + 
		    					   '</div>');
       
		$(".uploadfile").each(function(index, upload_item){ // input -> id : uploadfile 0 ~ 4
			$(upload_item).attr('id', 'uploadfile' + index);
		})
		$(".btnBtn").each(function(index, btn_item){ // btn -> data-idx : uploadfile 0 ~ 4
			$(btn_item).attr('data-idx', 'uploadfile' + index);
		})
		$(".carousel-item").each(function(index, img_item){ // img -> class : uploadfile 0 ~ 4
			$(img_item).attr('class', 'carousel-item  uploadfile' + index);
			if( index == 0 ) { 
				 $(img_item).addClass('active');
			}
		})
   }
});
//Delete File Input
function addDel(a){ 
	uploadfileCnt --;
	$(a).closest('tr').remove(); // input + btn delete
	var data_idx = $(a).data('idx'); 
	$('.' + data_idx).remove(); // img delete
	
	$(".uploadfile").each(function(index, upload_item){ // input -> id : uploadfile 0 ~ 4
		$(upload_item).attr('id', 'uploadfile' + index);
	})
	$(".btnBtn").each(function(index, btn_item){ // btn -> data-idx : uploadfile 0 ~ 4
		$(btn_item).attr('data-idx', 'uploadfile' + index);
	})
	$(".carousel-item").each(function(index, img_item){ // img -> class : uploadfile 0 ~ 4
		$(img_item).attr('class', 'carousel-item  uploadfile' + index);
		if( index == 0 ) { 
			 $(img_item).addClass('active');
		}
	})
}


// File Size Check + Ext Check + Preview
function fileCheck(file) {
    var maxSize  = 3 * 1024 * 1024; 
    var fileSize = 0;
    fileSize = file.files[0].size;
    if(fileSize > maxSize)
    {
        alert("첨부파일 사이즈는 3 MB 이내로 등록 가능합니다. ");
        file.value = "";
        return;
    }
    var name = file.files[0].name;
	if( name != "" ){
		var ext = name.split('.').pop().toLowerCase();
		if( $.inArray(ext,['gif','jpg','png','jpeg']) == -1 ) { 
			alert('첨부파일은 (gif,jpg,png,jpeg) 이미지만 업로드 가능합니다.');
			file.value = "";
			return false;
		}
	}
	//File Image Preview
	if (file.files && file.files[0]) {
		var changeId = file.id;
		var reader = new FileReader();
		reader.onload = function (e) {
			$("." + changeId).children('img').attr('src', e.target.result);
		}
		reader.readAsDataURL(file.files[0]);
	}
}



// Submit Script
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
	}
	
	if( confirm('게시물을 수정하시겠습니까?') ) {
	 	$("#postUpdateForm").submit();
	}else {
		return;
	}
}
</script>


<%@ include file="../footer.jsp"%>