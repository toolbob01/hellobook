<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!------ Include the above in your HEAD tag ---------->
<%@ include file="../header.jsp" %>

<html>
<head>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

>>>>>>> hellobook
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
.container {
	max-width: 65%;
	margin: auto;
}

img {
	max-width: 100%;
}

.inbox_people {
	background: #f8f8f8 none repeat scroll 0 0;
	float: left;
	overflow: hidden;
	width: 40%;
	border-right: 1px solid #c4c4c4;
}

.inbox_msg {
	border: 1px solid #c4c4c4;
	clear: both;
	overflow: hidden;
	border-radius: 8px;
}

.top_spac {
	margin: 20px 0 0;
}

.recent_heading {
	float: left;
	width: 40%;
}

.srch_bar {
	display: inline-block;
	text-align: right;
	width: 60%;
}

.headind_srch {
	padding: 10px 29px 10px 20px;
	overflow: hidden;
	border-bottom: 1px solid #c4c4c4;
}

.recent_heading h4 {
	color: #05728f;
	font-size: 1.3vmax;
	margin: auto;
}

.srch_bar input {
	border: 1px solid #cdcdcd;
	border-width: 0 0 1px 0;
	width: 80%;
	padding: 2px 0 4px 6px;
	background: none;
}

.srch_bar .input-group-addon button {
	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	border: medium none;
	padding: 0;
	color: #707070;
	font-size: 18px;
}

.srch_bar .input-group-addon {
	margin: 0 0 0 -27px;
}

.chat_ib h5 {
	font-size: 15px;
	color: #464646;
	margin: 0 0 8px 0;
}

.chat_ib h5 span {
	font-size: 13px;
	float: right;
}

.chat_ib p {
	font-size: 14px;
	color: #989898;
	margin: auto;
    max-height: 65px;
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
}

.chat_img {
	float: left;
	width: 11%;
}

.chat_ib {
	float: left;
	padding: 0 0 0 15px;
	width: 88%;
}

.chat_people {
	overflow: hidden;
	clear: both;
}

.chat_list {
	border-bottom: 1px solid #c4c4c4;
	margin: 0;
	padding: 18px 16px 10px;
}

.inbox_chat {
	height: 550px;
	overflow-y: scroll;
}

.active_chat {
	background: #ebebeb;
}

.incoming_msg_img {
	display: inline-block;
	width: 6%;
}

.received_msg {
	display: inline-block;
	padding: 0 0 0 10px;
	vertical-align: top;
	width: 92%;
}

.received_withd_msg p {
	background: #ebebeb none repeat scroll 0 0;
	border-radius: 3px;
	color: #646464;
	font-size: 14px;
	margin: 0;
	padding: 5px 10px 5px 12px;
	width: 100%;
}

.time_date {
	color: #747474;
	display: block;
	font-size: 12px;
	margin: 8px 0 0;
}

.received_withd_msg {
	width: 57%;
}

.mesgs {
	float: left;
	padding: 30px 15px 0 25px;
	width: 60%;
}

.sent_msg p {
	background: #05728f none repeat scroll 0 0;
	border-radius: 3px;
	font-size: 14px;
	margin: 0;
	color: #fff;
	padding: 5px 10px 5px 12px;
	width: 100%;
}

.outgoing_msg {
	overflow: hidden;
	margin: 26px 0 26px;
}

.sent_msg {
	float: right;
	width: 46%;
}

.input_msg_write input {
	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	border: medium none;
	color: #4c4c4c;
	font-size: 15px;
	min-height: 48px;
	width: 100%;
}

.input_msg_write textarea {
	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	border: medium none;
	color: #4c4c4c;
	font-size: 15px;
	min-height: 48px;
	width: 100%;
    overflow-y: hidden;
    resize: none;
}

.type_msg {
	border-top: 1px solid #c4c4c4;
	position: relative;
}

.msg_send_btn {
	background: #05728f none repeat scroll 0 0;
	border: medium none;
	border-radius: 50%;
	color: #fff;
	cursor: pointer;
	font-size: 17px;
	height: 33px;
	position: absolute;
	right: 0;
	top: 11px;
	width: 33px;
}

.messaging {
	padding: 0 0 50px 0;
}

.msg_history {
	height: 516px;
	overflow-y: auto;
}
</style>




	<div class="container">
		<h3 class=" text-center">채팅 리스트</h3>
		<div class="messaging">
			<div class="inbox_msg">
			
			
				<!-- 채팅방 목록 -->
				<div class="inbox_people">
					<div class="headind_srch">
						<div class="recent_heading">
							<h4>최근 대화 목록</h4>
						</div>
						<div class="srch_bar">
							<div class="stylish-input-group">
								<input type="text" class="search-bar" placeholder="Search">
								<span class="input-group-addon">
									<button type="button">
										<i class="fa fa-search" aria-hidden="true"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
					<div class="inbox_chat">
					<!-- 액티브된 채팅유저(가장 먼저 보이는 채팅) -->
						<div class="chat_list active_chat">
							<div class="chat_people">
								<div class="chat_img">
									<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
								</div>
								<div class="chat_ib">
									<h5>이름 <span class="chat_date">07-31</span></h5>
									<p>최근 메세지</p>
								</div>
							</div>
						</div>
					<!-- //액티브된 채팅유저(가장 먼저 보이는 채팅) -->
					
					<!-- 대기중인 채팅유저 -->
						<div class="chat_list">
							<div class="chat_people">
								<div class="chat_img">
								<!-- 유저 프로필 사진 -->
									<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
								</div>
								<div class="chat_ib">
									<h5>이름 <span class="chat_date">07-31</span></h5>
									<p>최근 메세지</p>
								</div>
							</div>
						</div>
						<div class="chat_list">
							<div class="chat_people">
								<div class="chat_img">
								<!-- 유저 프로필 사진 -->
									<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
								</div>
								<div class="chat_ib">
									<h5>이름 <span class="chat_date">07-31</span></h5>
									<p>세줄 이상의 긴글은 잘라서 ... 표시합니다. 세줄 이상의 긴글은 잘라서 ... 표시합니다. 세줄 이상의 긴글은 잘라서 ... 표시합니다.</p>
								</div>
							</div>
						</div>
					<!-- //대기중인 채팅유저 -->
					
					</div>
				</div>
				<!-- //채팅방 목록 -->
				
				<!-- 채팅방 -->
				<div class="mesgs">
					<div class="msg_history">
					
						<!-- 받은 메세지 -->
						<div class="incoming_msg">
							<div class="incoming_msg_img">
								<img src="https://ptetutorials.com/images/user-profile.png"
									alt="sunil">
							</div>
							<div class="received_msg">
								<div class="received_withd_msg">
									<p>받은 메세지 내용입니다.</p>
									<span class="time_date"> 11:01 AM | 07-31</span>
								</div>
							</div>
						</div>
						<!-- //받은 메세지 -->
						
						<!-- 보낸 메세지 -->
						<div class="outgoing_msg">
							<div class="sent_msg">
								<p>보낸 메세지 내용입니다.</p>
								<span class="time_date"> 11:01 AM | 07-31</span>
							</div>
						</div>
						<!-- //보낸 메세지 -->
						
						<!-- 보낸 메세지 -->
						<div class="outgoing_msg">
							<div class="sent_msg">
								<p>보낸 메세지 내용입니다.</p>
								<span class="time_date"> 11:01 AM | 07-31</span>
							</div>
						</div>
						<!-- //보낸 메세지 -->
						
						<!-- 받은 메세지 -->
						<div class="incoming_msg">
							<div class="incoming_msg_img">
								<img src="https://ptetutorials.com/images/user-profile.png"
									alt="sunil">
							</div>
							<div class="received_msg">
								<div class="received_withd_msg">
									<p>내용이 길어져도 전부 표시되게 합니다. 내용이 길어져도 전부 표시되게 합니다. 내용이 길어져도 전부 표시되게 합니다.
									 내용이 길어져도 전부 표시되게 합니다. 내용이 길어져도 전부 표시되게 합니다. 내용이 길어져도 전부 표시되게 합니다.</p>
									<span class="time_date"> 11:01 AM | 07-31</span>
								</div>
							</div>
						</div>
						<!-- //받은 메세지 -->
					</div>
					<!-- //채팅방 -->
					
					<!-- 채팅 보내기 -->
					<div class="type_msg">
						<div class="input_msg_write">
							<textarea class="write_msg" placeholder="메세지 입력" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
							<button class="msg_send_btn" type="button">
								<i class="fa fa-paper-plane-o" aria-hidden="true"></i>
							</button>
						</div>
					</div>
					<!-- //채팅 보내기 -->
					
				</div>
			</div>
		</div>
	</div>
	
	<script>
		function resize(obj) {
		    obj.style.height = '1px';
		    obj.style.height = (12 + obj.scrollHeight) + 'px';
		}
	</script>
<<<<<<< HEAD
</body>
</html>



=======
>>>>>>> hellobook
<%@ include file="../footer.jsp" %>

