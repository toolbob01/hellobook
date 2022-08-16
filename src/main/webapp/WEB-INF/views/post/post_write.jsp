<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<style>
	.mt-50px { margin-top: 50px; }
</style>

	<div class="m-5">
		<p class="ppp">ppppppppppp</p>
		<div class="ddd">dddddddddddddddddddddddd</div>
	</div>

	<div class="container post_write_page">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-5 text-center fs-1">게시글 등록</h4>
				<form class="validation-form" novalidate id="postingForm" name="postingForm" method="post" action="/post/post_write" enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="hidden" name="email" value="${username}" />

					<div class="mb-5">
						<label class="fs-3 mb-2" for="content">내용</label>
						<textarea class="form-control" rows="5" name="content" id="content" placeholder="포스트 내용을 입력해주세요."></textarea>
					</div>

					<div>
					    <label class="fs-3 mb-2" for="uploadfile">사진</label>
					</div>

<!-- 					<div class="mb-4 text-center">
						<img style="width: 500px; height: 500px;" id="preview-image" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
					</div> -->

					<table class="table __add mb-3"> 
					  <tr>
					    <td>
						  <div class="mb-4 text-center">
							<img style="width: 500px; height: 500px;" class="preview-image" id="preview-image" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
							<input type="file" class="form-control uploadfile " name="uploadfile" onchange="fileCheck(this)">
						  </div>
					    </td>
					    <td>
					      <button type="button" class="_add btn btn-primary mt-50px">추가</button>
					    </td>
					  </tr> 
					</table>

					<div class="mt-5 text-center">
						<button type="button" class="btn btn-sm btn-primary" id="btnSave" onclick="return postingCheck()">저장</button>
						<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='/'">목록</button>
					</div>
				</form>
			</div>
		</div>

	</div>

<script>

$(".ddd").on("click", function() {
	$(this).closest('.m-5').children('.ppp').html("changed ppp");
})

// Add File Input
var uploadfileCnt = 1;

$('.__add ._add').on('click',function(){ 
   if(uploadfileCnt >= 5){
      alert("파일 업로드 최대 개수는 5개 입니다.");
      return;
   }else{
       $('.__add').append('<tr>' + 
					    	'<td>' + 
						  	  '<div class="mb-4 text-center">' + 
							    '<img style="width: 500px; height: 500px;" class="preview-image" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">' + 
							    '<input type="file" class="form-control uploadfile " name="uploadfile" onchange="fileCheck(this)">' + 
						  	  '</div>' + 
							'</td>' +  
		    			    '<td>' + 
		    			      '<button type="button" class="btn btn-secondary mt-50px" onclick="addDel(this);">삭제</button>' + 
		    			    '</td>' +
		    			  '</tr>' ); 
       uploadfileCnt ++;
   }
});
//Delete File Input
function addDel(a){ 
	$(a).closest('tr').remove(); 
    uploadfileCnt --;
}

//File Image Preview
// $(".uploadfile").on("change", function(event) {
// 	var uploadfile = $(this)
//     var file = event.target.files[0]; console.log(file); console.log(uploadfile.files); 
//     var reader = new FileReader(); 
//     reader.onload = function(e) {
//     	uploadfile.closest('.text-center').children('.preview-image').attr("src", e.target.result);
//     }
//     reader.readAsDataURL(file);
// });
$('.uploadfile').change(function(){
	console.log('SSSiBal');
    setImageFromFile(this, $(this));
});
function setImageFromFile(input, uploadfile) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
// 			uploadfile.closest('.text-center').children('.preview-image').attr('src', e.target.result);
			$("#preview-image").attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
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
function postingCheck(){
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
	
	if( confirm('게시물을 작성하시겠습니까?') ) {
		$("#postingForm").submit();
	}else {
		return;
	}
}
</script>


<%@ include file="../footer.jsp"%>