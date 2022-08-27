<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<link rel="stylesheet" href="/resources/css/post.css">



	<div class="container post_write_page">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-5 text-center fs-1"><spring:message code="postWrite.title"/></h4>
				<form class="validation-form" novalidate id="postingForm" name="postingForm" method="post" action="/post/post_write" enctype="multipart/form-data">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="hidden" name="email" value="${username}" />

					<div class="mb-5">
						<label class="fs-3 mb-2" for="content"><spring:message code="postWrite.content"/></label>
						<textarea class="form-control mt-3 hello-scroll" rows="5" name="content" id="content" placeholder="<spring:message code="postWrite.placeholder"/>"></textarea>
					</div>

					<div>
					    <label class="fs-3 mb-3" for="uploadfile"><spring:message code="postWrite.image"/></label>
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

					<table class="table __add mt-5 mb-2"> 
					  <tr>
					    <td>
						  <div class="mb-4 text-center">
							<input type="file" class="form-control uploadfile" id="uploadfile0" name="uploadfile" onchange="fileCheck(this)">
						  </div>
					    </td>
					    <td>
					      <button type="button" class="_add btn btn-primary mb-3px btnBtn" data-idx="uploadfile0"><spring:message code="postWrite.add"/></button>
					    </td>
					  </tr> 
					</table>

					<div class="mt-5 text-center">
						<button type="button" class="btn btn-sm btn-primary" id="btnSave" onclick="return postingCheck()"><spring:message code="postWrite.save"/></button>
						<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='/'"><spring:message code="postWrite.list"/></button>
					</div>
				</form>
			</div>
		</div>

	</div>

<script>

// Add File Input
var uploadfileCnt = 0;

$('.__add ._add').on('click',function(){ 
	if(uploadfileCnt >= 4){
		alert("<spring:message code='postWrite.maxFive'/>");
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
		    			      '<button type="button" class="btn btn-secondary mb-3px btnBtn" data-idx="uploadfile1234" onclick="addDel(this);"><spring:message code="postWrite.remove"/></button>' + 
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
        alert('<spring:message code="postWrite.maxThree"/>');
        file.value = "";
        return;
    }
    var name = file.files[0].name;
	if( name != "" ){
		var ext = name.split('.').pop().toLowerCase();
		if( $.inArray(ext,['gif','jpg','png','jpeg']) == -1 ) { 
			alert('<spring:message code="postWrite.fileExt"/>');
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
function postingCheck(){
	if( $("#content").val() == "" ) {
		alert('<spring:message code="postWrite.pleaseContent"/>');
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
			alert('<spring:message code="postWrite.pleaseImage"/>');
			return false;
		}
	}
	
	if( confirm('<spring:message code="postWrite.writeConfirm"/>') ) {
		$("#postingForm").submit();
	}else {
		return;
	}
}
</script>


<%@ include file="../footer.jsp"%>