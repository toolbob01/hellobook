<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>



	      <div class="post-detail my-100px">
	      	<div class="container-fluid">
	      	  <div class="row">
	      	  
				<div class="col-md-7 p-0">
					<div class="modal-detail-left d-flex flex-column">
						<div class="trans_inner">
							<div id="post_detail" class="carousel slide" data-bs-ride="carousel" data-bs-interval="false">
							  <div class="carousel-inner" id="carousel-inner">
							    <div class="carousel-item active">
							      <img src="/hello_img/post/${postVO.file_list[0].uuid}" alt="...">
							    </div>
							    <c:forEach var="fileVO" items="${postVO.file_list}" begin="1">
							      <div class="carousel-item">
							        <img src="/hello_img/post/${fileVO.uuid}" alt="...">
							      </div>
							    </c:forEach>
							  </div>
							  <button class="carousel-control-prev" type="button" data-bs-target="#post_detail" data-bs-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Previous</span>
							  </button>
							  <button class="carousel-control-next" type="button" data-bs-target="#post_detail" data-bs-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Next</span>
							  </button>
							</div>
						</div>
						<div class="modal-detail-contents">
							<div class="posting-master">
								<div class="comment-profile d-flex justify-content-between">
									<div class="d-flex">
										<img class="comment-profile-img on_cursor" src="/hello_img/member/${postVO.profile}" alt="프로필사진" onclick="location.href='/mypage/profile/${postVO.nickname}'">
										<div class="comment-profile-flag">
										  <c:if test="${postVO.language == 'J'}">
										    <img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>
										  </c:if>
										  <c:if test="${postVO.language == 'K'}">
										    <img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/>
										  </c:if>
										</div>
										<div class="comment-name on_cursor align-self-center" onclick="location.href='/mypage/profile/${postVO.nickname}'"><c:out value="${postVO.nickname}"/></div>
										<c:set var="postLen" value="${fn:length(postVO.timer)}"/>
										<c:set var="postTimer1" value="${fn:substring(postVO.timer, 0, postLen -1)}" />
										<c:set var="postTimer2" value="${fn:substring(postVO.timer, postLen -1, postLen)}" />
										<c:choose>
										  <c:when test="${postTimer2 == 's'}">
										    <c:if test="${postTimer1 == '1'}">
										      <div class="comment-time align-self-center mx-5">${postTimer1} <spring:message code="timer.sec"/></div>
										    </c:if>
										    <c:if test="${postTimer1 != '1'}">
										      <div class="comment-time align-self-center mx-5">${postTimer1} <spring:message code="timer.sec2"/></div>
										    </c:if>
										  </c:when>
										  <c:when test="${postTimer2 == 'm'}">
										    <c:if test="${postTimer1 == '1'}">
										      <div class="comment-time align-self-center mx-5">${postTimer1} <spring:message code="timer.min"/></div>
										    </c:if>
										    <c:if test="${postTimer1 != '1'}">
										      <div class="comment-time align-self-center mx-5">${postTimer1} <spring:message code="timer.min2"/></div>
										    </c:if>
										  </c:when>
										  <c:when test="${postTimer2 == 'h'}">
										    <c:if test="${postTimer1 == '1'}">
										      <div class="comment-time align-self-center mx-5">${postTimer1} <spring:message code="timer.hour"/></div>
										    </c:if>
										    <c:if test="${postTimer1 != '1'}">
										      <div class="comment-time align-self-center mx-5">${postTimer1} <spring:message code="timer.hour2"/></div>
										    </c:if>
										  </c:when>
										  <c:when test="${postTimer2 == 'd'}">
										    <c:if test="${postTimer1 == '1'}">
										      <div class="comment-time align-self-center mx-5">${postTimer1} <spring:message code="timer.day"/></div>
										    </c:if>
										    <c:if test="${postTimer1 != '1'}">
										      <div class="comment-time align-self-center mx-5">${postTimer1} <spring:message code="timer.day2"/></div>
										    </c:if>
										  </c:when>
										  <c:when test="${postTimer2 == 'M'}">
										    <c:if test="${postTimer1 == '1'}">
										      <div class="comment-time align-self-center mx-5">${postTimer1} <spring:message code="timer.month"/></div>
										    </c:if>
										    <c:if test="${postTimer1 != '1'}">
										      <div class="comment-time align-self-center mx-5">${postTimer1} <spring:message code="timer.month2"/></div>
										    </c:if>
										  </c:when>
										  <c:when test="${postTimer2 == 'y'}">
										    <c:if test="${postTimer1 == '1'}">
										      <div class="comment-time align-self-center mx-5">${postTimer1} <spring:message code="timer.year"/></div>
										    </c:if>
										    <c:if test="${postTimer1 != '1'}">
										      <div class="comment-time align-self-center mx-5">${postTimer1} <spring:message code="timer.year2"/></div>
										    </c:if>
										  </c:when>
										</c:choose>
									</div>
									
									<div class="d-flex align-items-center">
										<span class="me-1"><a id="kakaotalk-sharing-btn" href="javascript:shareMessage()" data-nick="${postVO.nickname}" data-pno="${postVO.pno}" onclick="kakaoData(this)"><img src="/resources/imgs/kakao_share_icon_big.png" alt="Kakao Share" style="width:43px; height:43px;"/></a></span> 
										<span class="on_cursor line_share ms-1" data-nick="${postVO.nickname}" data-pno="${postVO.pno}" onclick="sendNaverLine(this)"><img src="/resources/imgs/line_share_icon_big.png" alt="Line Share" style="width:33px; height:33px;"></img></span>
									</div>
								</div>
								
								<div class="modal-posting-master-content">
									<c:out value="${postVO.content}"/>
								</div>
							</div>
						</div>
					</div>
				</div> <!-- / col-md-7 -->
				
				<div class="col-md-5 p-0">
					<div class="modal-detail-right">
						<div class="all-comment">		
							<p class="fs-5 mb-3">コメント リスト</p>
							<c:choose>
							  <c:when test="${postVO.reply_list[0] == null}">
							  	<p class="fs-6 text-center mt-5">まだ、コメントがありません。</p>
							  </c:when>
							  <c:otherwise>
								<c:forEach var="replyVO" items="${postVO.reply_list}">
									<div class="comment-profile d-flex">
										<img class="comment-profile-img on_cursor" src="/hello_img/member/${replyVO.profile}" alt="프로필사진" onclick="location.href='/mypage/profile/${replyVO.nickname}'">
										<c:if test="${replyVO.language = 'J'}">
											<div class="comment-profile-flag">
												<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>
											</div>
										</c:if>
										<c:if test="${replyVO.language = 'K'}">
											<div class="comment-profile-flag">
												<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>
											</div>
										</c:if>

										<div class="comment-name on_cursor align-self-center" onclick="location.href='/mypage/profile/${replyVO.nickname}'">${replyVO.nickname}</div>
										<c:set var="replyLen" value="${fn:length(replyVO.timer)}"/>
										<c:set var="replyTimer1" value="${fn:substring(replyVO.timer, 0, replyLen -1)}" />
										<c:set var="replyTimer2" value="${fn:substring(replyVO.timer, replyLen -1, replyLen)}" />
										<c:choose>
										  <c:when test="${replyTimer2 == 's'}">
										    <c:if test="${replyTimer1 == '1'}">
										      <div class="comment-time align-self-center mx-5">${replyTimer1} <spring:message code="timer.sec"/></div>
										    </c:if>
										    <c:if test="${replyTimer1 != '1'}">
										      <div class="comment-time align-self-center mx-5">${replyTimer1} <spring:message code="timer.sec2"/></div>
										    </c:if>
										  </c:when>
										  <c:when test="${replyTimer2 == 'm'}">
										    <c:if test="${replyTimer1 == '1'}">
										      <div class="comment-time align-self-center mx-5">${replyTimer1} <spring:message code="timer.min"/></div>
										    </c:if>
										    <c:if test="${replyTimer1 != '1'}">
										      <div class="comment-time align-self-center mx-5">${replyTimer1} <spring:message code="timer.min2"/></div>
										    </c:if>
										  </c:when>
										  <c:when test="${replyTimer2 == 'h'}">
										    <c:if test="${replyTimer1 == '1'}">
										      <div class="comment-time align-self-center mx-5">${replyTimer1} <spring:message code="timer.hour"/></div>
										    </c:if>
										    <c:if test="${replyTimer1 != '1'}">
										      <div class="comment-time align-self-center mx-5">${replyTimer1} <spring:message code="timer.hour2"/></div>
										    </c:if>
										  </c:when>
										  <c:when test="${replyTimer2 == 'd'}">
										    <c:if test="${replyTimer1 == '1'}">
										      <div class="comment-time align-self-center mx-5">${replyTimer1} <spring:message code="timer.day"/></div>
										    </c:if>
										    <c:if test="${replyTimer1 != '1'}">
										      <div class="comment-time align-self-center mx-5">${replyTimer1} <spring:message code="timer.day2"/></div>
										    </c:if>
										  </c:when>
										  <c:when test="${replyTimer2 == 'M'}">
										    <c:if test="${replyTimer1 == '1'}">
										      <div class="comment-time align-self-center mx-5">${replyTimer1} <spring:message code="timer.month"/></div>
										    </c:if>
										    <c:if test="${replyTimer1 != '1'}">
										      <div class="comment-time align-self-center mx-5">${replyTimer1} <spring:message code="timer.month2"/></div>
										    </c:if>
										  </c:when>
										  <c:when test="${replyTimer2 == 'y'}">
										    <c:if test="${replyTimer1 == '1'}">
										      <div class="comment-time align-self-center mx-5">${replyTimer1} <spring:message code="timer.year"/></div>
										    </c:if>
										    <c:if test="${replyTimer1 != '1'}">
										      <div class="comment-time align-self-center mx-5">${replyTimer1} <spring:message code="timer.year2"/></div>
										    </c:if>
										  </c:when>
										</c:choose>
										<div class="comment-cocoment align-self-center" data-refno="${replyVO.repno}">답글 달기</div>
									</div>
									<div class="comment-content" id="comment-content${replyVO.repno}">
										${replyVO.rcontent}
										<c:if test="${replyVO.cocomment_list[0] != null}">
											<div class="comment-accordion on_cursor mt-3 ms-3" data-bs-toggle="collapse" data-bs-target="#collapse${replyVO.repno}" aria-expanded="false">
												<i class="bi bi-arrow-return-right fs-5"></i>
												<span class="cocoment-open ms-3" data-oc="c">オープン</span>
											</div>
											
											<div class="collapse" id="collapse${replyVO.repno}">
											  <c:forEach var="cocommentVO" items="${replyVO.cocomment_list}">
												<div class="comment-depth">
													<div class="comment-profile d-flex">
														<img class="comment-profile-img on_cursor" src="/hello_img/member/${cocommentVO.profile}" alt="프로필사진" onclick="location.href='/mypage/profile/${cocommentVO.nickname}'">
														<div class="comment-profile-flag">
														  <c:if test="${cocommentVO.language == 'J'}">
														  	<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>
														  </c:if>
														  <c:if test="${cocommentVO.language == 'K'}">
														    <img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/>
														  </c:if>
														</div>
														<div class="comment-name on_cursor align-self-center" onclick="location.href='/mypage/profile/${cocommentVO.nickname}'">${cocommentVO.nickname}</div>
														<c:set var="cocoLen" value="${fn:length(cocommentVO.timer)}"/>
														<c:set var="cocoTimer1" value="${fn:substring(cocommentVO.timer, 0, cocoLen -1)}" />
														<c:set var="cocoTimer2" value="${fn:substring(cocommentVO.timer, cocoLen -1, cocoLen)}" />
														<c:choose>
														  <c:when test="${cocoTimer2 == 's'}">
														    <c:if test="${cocoTimer1 == '1'}">
														      <div class="comment-time align-self-center mx-5">${cocoTimer1} <spring:message code="timer.sec"/></div>
														    </c:if>
														    <c:if test="${cocoTimer1 != '1'}">
														      <div class="comment-time align-self-center mx-5">${cocoTimer1} <spring:message code="timer.sec2"/></div>
														    </c:if>
														  </c:when>
														  <c:when test="${cocoTimer2 == 'm'}">
														    <c:if test="${cocoTimer1 == '1'}">
														      <div class="comment-time align-self-center mx-5">${cocoTimer1} <spring:message code="timer.min"/></div>
														    </c:if>
														    <c:if test="${cocoTimer1 != '1'}">
														      <div class="comment-time align-self-center mx-5">${cocoTimer1} <spring:message code="timer.min2"/></div>
														    </c:if>
														  </c:when>
														  <c:when test="${cocoTimer2 == 'h'}">
														    <c:if test="${cocoTimer1 == '1'}">
														      <div class="comment-time align-self-center mx-5">${cocoTimer1} <spring:message code="timer.hour"/></div>
														    </c:if>
														    <c:if test="${cocoTimer1 != '1'}">
														      <div class="comment-time align-self-center mx-5">${cocoTimer1} <spring:message code="timer.hour2"/></div>
														    </c:if>
														  </c:when>
														  <c:when test="${cocoTimer2 == 'd'}">
														    <c:if test="${cocoTimer1 == '1'}">
														      <div class="comment-time align-self-center mx-5">${cocoTimer1} <spring:message code="timer.day"/></div>
														    </c:if>
														    <c:if test="${cocoTimer1 != '1'}">
														      <div class="comment-time align-self-center mx-5">${cocoTimer1} <spring:message code="timer.day2"/></div>
														    </c:if>
														  </c:when>
														  <c:when test="${cocoTimer2 == 'M'}">
														    <c:if test="${cocoTimer1 == '1'}">
														      <div class="comment-time align-self-center mx-5">${cocoTimer1} <spring:message code="timer.month"/></div>
														    </c:if>
														    <c:if test="${cocoTimer1 != '1'}">
														      <div class="comment-time align-self-center mx-5">${cocoTimer1} <spring:message code="timer.month2"/></div>
														    </c:if>
														  </c:when>
														  <c:when test="${cocoTimer2 == 'y'}">
														    <c:if test="${cocoTimer1 == '1'}">
														      <div class="comment-time align-self-center mx-5">${cocoTimer1} <spring:message code="timer.year"/></div>
														    </c:if>
														    <c:if test="${cocoTimer1 != '1'}">
														      <div class="comment-time align-self-center mx-5">${cocoTimer1} <spring:message code="timer.year2"/></div>
														    </c:if>
														  </c:when>
														</c:choose>
													</div>
													<div class="comment-content">
														<%-- <span class="hashTag" onclick="location.href='/mypage/profile/${}'">@JSHanulso</span> --%>
														${cocommentVO.rcontent}
													</div>
												</div>
			 								  </c:forEach>
											</div> <!-- / commment-depth-all -->
										</c:if>
									</div> <!-- / comment-content -->
								</c:forEach>
							  </c:otherwise>
							</c:choose>
						</div> <!-- / all-comment -->
						
						<div class="comment-write-div">
							<span class="fs-5 mb-3"><spring:message code="postmodal.writeComment"/></span>
							<span class="depth2div ms-2">
<!-- 								<span class="depth2nick">@イェーイ韓国人</span> -->
<!-- 								<span class="depth2x on_cursor"><i class="bi bi-x-lg"></i></span> -->
							</span>
		                    <button class="msg_send_btn float-end" id="msg_send_btn" type="button" data-pno="${postVO.pno}" data-refno="0" data-depth="1">
		                       <i class="fa fa-paper-plane-o" aria-hidden="true"></i>
		                    </button>
							<div class="form-floating">
							  <textarea class="form-control" placeholder="Leave a comment here" id="commentInsert"></textarea>
							</div>
						</div>
						
					</div>
				</div> <!-- / col-md-5 -->
				
			  </div> <!-- /row -->
			</div> <!-- container-fluid -->
	    </div> <!-- /post-detail -->



<script>

// Coment Depth 2 Add
$(document).on("click", ".comment-cocoment", function() {
	$(".depth2div").empty();
	var cocoRef = $(this).data("repno");
	var cocoNick = $(this).closest(".comment-profile").children(".comment-name").html();
	$("#msg_send_btn").data("refno", cocoRef);
	$("#msg_send_btn").data("depth", "2");
	var cocoAt = '<span class="depth2nick">@' + cocoNick + '</span>' + 
				 '<span class="depth2x on_cursor"> <i class="bi bi-x-lg"></i></span>';
	$(".depth2div").append(cocoAt);
})

// Coment Depth 2 Remove
$(document).on("click", ".depth2x", function(){
	$("#msg_send_btn").data("refno", "0");
	$("#msg_send_btn").data("depth", "1");
	$(".depth2div").empty();
})
	 
// Coment Insert
$(".msg_send_btn").on("click", function(e){		
	e.preventDefault();
	var pno = $(this).data("pno");
	var email = '${username}';
	var rcontent = $("#commentInsert").val();
	var refno = $(this).data("refno");
	var depth = $(this).data("depth");
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	if( rcontent == "" ) {
		alert('댓글 내용을 작성해주세요.');
	}else {
		// AJAX action
		if( !confirm('댓글을 작성하시겠습니까?') ) {
			$("#commentInsert").val(""); 
			return ; 
		}
		$.ajax({
			type:"post",
			url:"/post/comment_insert",
			dataType:"json",
			data : {
				pno : pno,
				email : email,
				rcontent : rcontent,
				refno : refno,
				depth : depth
			},
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success:function(data){
				if( data.depth == '2' ) {
					var accpt = data.timer.slice(0, -1);
					var accpt_1 = data.timer.slice(-1);
					if(accpt_1 == 's') {
						if(accpt_1 == '1') {
							accpt += '<spring:message code="timer.sec"/>';
						}else{
							accpt += '<spring:message code="timer.sec2"/>';
						}
					}else if(accpt_1 == 'm') {
						if(accpt_1 == '1') {
							accpt += '<spring:message code="timer.min"/>';
						}else{
							accpt += '<spring:message code="timer.min2"/>';
						}
					}else if(accpt_1 == 'h') {
						if(accpt_1 == '1') {
							accpt += '<spring:message code="timer.hour"/>';
						}else{
							accpt += '<spring:message code="timer.hour2"/>';
						}
					}else if(accpt_1 == 'd') {
						if(accpt_1 == '1') {
							accpt += '<spring:message code="timer.day"/>';
						}else{
							accpt += '<spring:message code="timer.day2"/>';
						}
					}else if(accpt_1 == 'M') {
						if(accpt_1 == '1') {
							accpt += '<spring:message code="timer.month"/>';
						}else{
							accpt += '<spring:message code="timer.month2"/>';
						}
					}else if(accpt_1 == 'y') {
						if(accpt_1 == '1') {
							accpt += '<spring:message code="timer.year"/>';
						}else{
							accpt += '<spring:message code="timer.year2"/>';
						}
					}
					// 처음 달리는 대댓글일 때
					if( $("#collapse" + data.refno).length == 0 ) {
						$(".all-comment #comment-content"+data.refno).append('<div class="comment-accordion on_cursor mt-3 ms-3" data-bs-toggle="collapse" data-bs-target="#collapse' + data.refno + '" aria-expanded="false">' + 
																      			 '<i class="bi bi-arrow-return-right fs-5"></i>' + 
																      		     '<span class="cocoment-open ms-3" data-oc="c">펼치기</span>' + 
															      			 '</div>');
						$(".all-comment #comment-content"+data.refno).append('<div class="collapse show" id="collapse' + data.refno + '">');
					}
					var dAllComCol = '<div class="comment-depth">' + 
							         '<div class="comment-profile d-flex">' + 
							           '<img class="comment-profile-img on_cursor" src="/hello_img/member/' + data.profile + '" alt="프로필사진">' + 
							           '<div class="comment-profile-flag">';
					if( data.language == 'J' ){  
						dAllComCol += '<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>';
					}else{
						dAllComCol += '<img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/>';
					}
					dAllComCol += '</div>' + 
									'<div class="comment-name on_cursor align-self-center">' + data.nickname + '</div>' + 
									'<div class="comment-time align-self-center mx-5">' + accpt + '</div>' + 
						          '</div>' + 
						          '<div class="comment-content">' + 
						             data.rcontent +
						          '</div>' + 
						          '</div>';
					$("#collapse" + data.refno).prepend(dAllComCol);
					}else {
						// if depth : 1
						$(".all-comment > p").remove();
 		 				$(".all-comment").prepend('<p class="fs-5 mb-3">댓글 리스트</p>' + 
 		 										 '<div class="comment-profile d-flex" id="comment-profile' + data.repno + '"></div>' + 
		 						 				 '<div class="comment-content" id="comment-content' + data.repno + '"></div>');
 		 				var insert_all_comment_profile = '<img class="comment-profile-img on_cursor" src="/hello_img/member/' + data.profile + '" alt="프로필사진">' + 
						  								 '<div class="comment-profile-flag">';
						if( data.language == 'J' ) {
							insert_all_comment_profile += '<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>';
						}else {
							insert_all_comment_profile += '<img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/>';
						}
						insert_all_comment_profile += '</div>' + 
				    	  							  '<div class="comment-name on_cursor align-self-center">' + data.nickname + '</div>';
						var accpt = data.timer.slice(0, -1);
						var accpt_1 = data.timer.slice(-1);
						if(accpt_1 == 's') {
							if(accpt == '1') {
								accpt += '<spring:message code="timer.sec"/>';
							}else {
								accpt += '<spring:message code="timer.sec2"/>';
							}
							
						}else if(accpt_1 == 'm') {
							if(accpt == '1') {
								accpt += '<spring:message code="timer.min"/>';
							}else {
								accpt += '<spring:message code="timer.min2"/>';
							}
							
						}else if(accpt_1 == 'h') {
							if(accpt == '1') {
								accpt += '<spring:message code="timer.hour"/>';
							}else {
								accpt += '<spring:message code="timer.hour2"/>';
							}
							
						}else if(accpt_1 == 'd') {
							if(accpt == '1') {
								accpt += '<spring:message code="timer.day"/>';
							}else {
								accpt += '<spring:message code="timer.day2"/>';
							}
							
						}else if(accpt_1 == 'M') {
							if(accpt == '1') {
								accpt += '<spring:message code="timer.month"/>';
							}else {
								accpt += '<spring:message code="timer.month2"/>';
							}
							
						}else if(accpt_1 == 'y') {
							if(accpt == '1') {
								accpt += '<spring:message code="timer.year"/>';
							}else {
								accpt += '<spring:message code="timer.year2"/>';
							}
							
						}			
						insert_all_comment_profile += '<div class="comment-time align-self-center mx-5">' + accpt + '</div>' + 
				    	  							  '<div class="comment-cocoment align-self-center" data-repno="' + data.repno + '">답글 달기</div>';
						$(".all-comment #comment-profile"+data.repno).append(insert_all_comment_profile);
						$(".all-comment #comment-content"+data.repno).html(data.rcontent);
					}
					$("#commentInsert").val("");
					$("#msg_send_btn").data("refno", "0");
					$("#msg_send_btn").data("depth", "1");
					$(".depth2div").empty();
			}, error:function(){
				alert("Error - Comment Insert ! ");
			}
		})
	}
})
		
// coComment Open Close
$(document).on("click",".cocoment-open",function() {
	if( $(this).data("oc") == 'c' ){
		$(this).data("oc", "o")
		$(this).html('<spring:message code="postModal.cocoOpen"/>');
	}else {
		$(this).data("oc", "c")
		$(this).html('<spring:message code="postModal.cocoClose"/>');
	}
})

// Line Share Test
function sendNaverLine(e) {
       var line_nick = $(e).data("nick");
       var line_pno = $(e).data("pno");
   	var line_title = "[Welcome to HelloBook]";
       var line_summary = "'" + line_nick + "'s post";
       var line_br = "\n";
       var line_link = "http://localhost:8088/post/post_detail/" + line_pno;
       var line_img = "https://media.discordapp.net/attachments/591977740350128139/1012435521412272188/hello_book_logo.jpg?";
       var line_url = "http://line.me/R/msg/text/?" + 
					encodeURIComponent(line_title + line_br + line_summary + line_br + line_link);
       var openNewWindow = window.open("about:blank");
       openNewWindow.location.href = line_url;
   }

   // Kakao Share Test 
     Kakao.init("a7ba4a0aa3292ea9684a93aa38bba597");
  var kakao_nick = "";
  var kakao_pno = "";
  var kakao_img = "https://media.discordapp.net/attachments/591977740350128139/1012435521412272188/hello_book_logo.jpg";
     function kakaoData(e) {
   	  kakao_nick = $(e).data("nick");
   	  kakao_pno = $(e).data("pno");
     }
  function shareMessage() {
    Kakao.Share.sendDefault({
      objectType: 'feed',
      content: {
        title: "[HelloBook] " + kakao_nick + "'s post",
        description: '#HelloBook #Korea #Japan #学習 #言語交換',
        imageUrl: kakao_img,
        link: {
          mobileWebUrl: 'http://localhost:8088/post/post_detail/' + kakao_pno, // 'https://developers.kakao.com'
          webUrl: 'http://localhost:8088/post/post_detail/' + kakao_pno,
        },
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: 'http://localhost:8088/post/post_detail/' + kakao_pno,
            webUrl: 'http://localhost:8088/post/post_detail/' + kakao_pno,
          },
        },
        {
          title: '앱으로 보기',
          link: {
            mobileWebUrl: 'http://localhost:8088/post/post_detail/' + kakao_pno,
            webUrl: 'http://localhost:8088/post/post_detail/' + kakao_pno,
          },
        },
      ],
    })
  }
</script>


<%@ include file="../footer.jsp"%>