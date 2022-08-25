<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


<!-- 	<div class="virtual-post-detail"></div> -->

	<div class="container">
	  <div class="row">
	      <div class="post-detail">
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
								<div class="comment-profile d-flex">
									<img class="comment-profile-img on_cursor" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
									<div class="comment-profile-flag">
									  <c:if test="">
									    <img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>
									  </c:if>
									  <c:if test="">
									    
									  </c:if>
									</div>
									<div class="comment-name on_cursor align-self-center"><c:out value="${postVO.nickname}"/></div>
									<c:set var="len" value="${fn:length(postVO.timer)}"/>
									 <c:set var="postTimer" value="${fn:substring(postVO.timer, len -1, len)}" />
									<c:choose>
									  <c:when test="${postVO.timer != null}">
									    <div class="comment-time align-self-center mx-5">${postTimer}</div>
									  </c:when>
									</c:choose>
									
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
							<p class="fs-5 mb-3">댓글 리스트</p>

							<div class="comment-profile d-flex">
								<img class="comment-profile-img on_cursor" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
								<div class="comment-profile-flag">
									<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>
								</div>
								<div class="comment-name on_cursor align-self-center">Hanulso</div>
								<div class="comment-time align-self-center mx-5">17분전</div>
								<div class="comment-cocoment align-self-center" data-refno="">답글 달기</div>
							</div>
							<div class="comment-content">
								하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 하늘소는 장수하늘소가 최고지 ~ 

								<div class="comment-accordion on_cursor mt-3 ms-3" data-bs-toggle="collapse" data-bs-target="#haveToInputRno" aria-expanded="false">
									<i class="bi bi-arrow-return-right fs-5"></i>
									<span class="cocoment-open ms-3" data-oc="c">펼치기</span>
								</div>
								<div class="collapse" id="haveToInputRno">
									<div class="comment-depth">
										<div class="comment-profile d-flex">
											<img class="comment-profile-img on_cursor" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
											<div class="comment-profile-flag">
												<img src="https://img.icons8.com/color/22/000000/south-korea-circular.png"/>
											</div>
											<div class="comment-name on_cursor align-self-center">Hanulso</div>
											<div class="comment-time align-self-center mx-5">17분전</div>
										</div>
										<div class="comment-content">
											<span class="hashTag" onclick="location.href='#'">@JSHanulso</span>
											장수하늘소는 딱정벌레 종류의 곤충 중에서 가장 크며 중국 만주 동북부, 시베리아 우수리 지방 및 우리나라 경기도 광릉지역 등에 분포하고 있다.
										</div>
									</div>
									<div class="comment-depth">
										<div class="comment-profile d-flex">
											<img class="comment-profile-img on_cursor" src="/resources/imgs/thumb02.jpg" alt="프로필사진">
											<div class="comment-profile-flag">
												<img src="https://img.icons8.com/color/22/000000/japan-circular.png"/>
											</div>
											<div class="comment-name on_cursor align-self-center">Hanulso</div>
											<div class="comment-time align-self-center mx-5">17분전</div>
										</div>
										<div class="comment-content">
											<span class="hashTag" onclick="location.href='#'">@JSHanulso</span>
											장수하늘소는 딱정벌레 종류의 곤충 중에서 가장 크며 중국 만주 동북부, 시베리아 우수리 지방 및 우리나라 경기도 광릉지역 등에 분포하고 있다.
										</div>
									</div>
								</div> <!-- / commment-depth-all -->
							</div> <!-- / comment-content -->
						</div> <!-- / all-comment -->
						
						<div class="comment-write-div">
							<span class="fs-5 mb-3"><spring:message code="postmodal.writeComment"/></span>
							<span class="depth2div ms-2">
								<span class="depth2nick">@イェーイ韓国人</span>
								<span class="depth2x on_cursor"><i class="bi bi-x-lg"></i></span>
							</span>
		                    <button class="msg_send_btn float-end" id="msg_send_btn" type="button" data-pno="" data-refno="0" data-depth="1">
		                       <i class="fa fa-paper-plane-o" aria-hidden="true"></i>
		                    </button>
							<div class="form-floating">
							  <textarea class="form-control" placeholder="Leave a comment here" id="commentInsert"></textarea>
							</div>
						</div>
						
					</div>
				</div> <!-- / col-md-5 -->
	    </div>
	  </div> <!-- /row -->
	</div> <!-- /container -->


<script>

/* $(document).ready(function() {
	var articleOrg = '${postVO.timer}';
	var articleTimer = articleOrg.slice(0, -1);
	var articleTimer_1 = articleOrg.slice(-1);
	if(articleTimer_1 == 's') {
		if(articleTimer == '1') {
			articleTimer += '<spring:message code="timer.sec"/>';
		}else {
			articleTimer += '<spring:message code="timer.sec2"/>';
		}
	}else if(articleTimer_1 == 'm') {
		if(articleTimer == '1') {
			articleTimer += '<spring:message code="timer.min"/>';
		}else {
			articleTimer += '<spring:message code="timer.min2"/>';
		}
	}else if(articleTimer_1 == 'h') {
		if(articleTimer == '1') {
			articleTimer += '<spring:message code="timer.hour"/>';
		}else {
			articleTimer += '<spring:message code="timer.hour2"/>';
		}
	}else if(articleTimer_1 == 'd') {
		if(articleTimer == '1') {
			articleTimer += '<spring:message code="timer.day"/>';
		}else {
			articleTimer += '<spring:message code="timer.day2"/>';
		}
	}else if(articleTimer_1 == 'M') {
		if(articleTimer == '1') {
			articleTimer += '<spring:message code="timer.month"/>';
		}else {
			articleTimer += '<spring:message code="timer.month2"/>';
		}
	}else if(articleTimer_1 == 'y') {
		if(articleTimer == '1') {
			articleTimer += '<spring:message code="timer.year"/>';
		}else {
			articleTimer += '<spring:message code="timer.year2"/>';
		}
	}		
}) */
		
</script>


<%@ include file="../footer.jsp"%>