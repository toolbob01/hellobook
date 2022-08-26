<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<link rel="stylesheet" href="/resources/css/chat_list.css">


   <div class="container">
		<div>
			<button class="btn btn-primary float-end" id="createChatRoom" style="margin-bottom:20px;">채팅방 추가</button>
			
		</div>
<!--       <h3 class=" text-center">Chat</h3> -->
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
                     	
                        <input type="text" class="search-bar" placeholder="Search" onkeyup="searchUser()">
                        <span class="input-group-addon">
                           <button type="button">
                              <i class="fa fa-search" aria-hidden="true"></i>
                           </button>
                        </span>
                     </div>
                  </div>
               </div>
               <div class="inbox_chat">
               <!-- 채팅유저 -->
               	<c:forEach var="cvo" items="${cvoList}" varStatus="status">
               	
                  <div class="chat_list" data-email="${cvo.nickname}" data-rno="${cvo.rno}">
                     <div class="chat_people">
                        <div class="chat_img">
                           <img src="/hello_img/member/${cvo.profile}" alt="...">
                        </div>
                        <div class="chat_ib">

                           <h5>${cvo.nickname}
                           	<span class="chat_date"><fmt:formatDate value="${cvo.mdate}" pattern="MM-dd"/></span>
                           </h5>
                           <p>${cvo.content}</p>

                        </div>
                     </div>
                  </div>
                
                </c:forEach>   
                 
               <!--채팅유저 -->
               </div>
            </div>
            <!-- //채팅방 목록 -->
            
            <!-- 채팅방 -->
            <div class="mesgs">
               <div class="msg_history">
               <!-- 내용 출력 -->
               </div>
               <!-- //채팅방 -->
               
               <!-- 채팅 보내기 -->
               <div class="type_msg">
                  <div class="input_msg_write">
                  	

                  	 <input type="hidden" id="sendEmail" name="email" value="${username}">
                  	 <input type="hidden" id="sendRno" name="rno" value="">
                     <textarea class="write_msg" id="message" name="content" placeholder="메세지 입력" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
                     <button class="msg_send_btn" type="submit" id="sendBtn">
                        <i class="fa fa-paper-plane-o"  aria-hidden="true"></i>
                     </button>

                  </div>
               </div>
               <!-- //채팅 보내기 -->
            </div>
            <!-- 채팅방 -->

         </div> <!-- /inbox_msg -->
      </div>
   </div>
   
   <!-- Modal -->
<div class="modal modal-hide fade py-5" tabindex="-1" role="dialog" id="createChatRoomModal" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-4 shadow">
      <!-- <div class="modal-body p-5"> -->
      	<div class="d-flex flex-column align-items-stretch flex-shrink-0">
		
		    <div class="list-group list-group-flush border-bottom scrollarea mp-st-sidebar_b">
		      	<div style="margin:20px;display: flex;flex-direction: column;justify-content: space-evenly;align-items: stretch;">
		      	
		      		<c:forEach var="mvo" items="${mvoList}">
		      		<c:if test="${mvo.email == username}">
		      		</c:if>
		      		<c:if test="${mvo.email != username}">
		      		<div style="margin:10px 0;padding:10px 0;border-top:0.5px solid #eee;border-bottom:0.5px solid #eee;">
			      		<div class="row">
			      			<div class="col-md-3">
			      				<img src="/hello_img/member/${mvo.profile}" alt="..." style="width:100px;height:100px;">
			      			</div>
			      			<div class="col-md-6" style="margin: auto;text-align: center;">
			      				<span>
			      					${mvo.email}
			      				</span>
			      				<br><br>
			      				<span>
			      					${mvo.nickname}
			      				</span>
			      			</div>
			      			<div class="col-md-3" style="margin: auto;text-align: center;">
			      			<form action="/chat/createChatRoom" method="post">
			      				<sec:csrfInput/>
			      				<input type="hidden" name="email" value="${username}">
			      				<input type="hidden" name="femail" value="${mvo.email}">
			      				
			      					<button class="btn btn-primary" type="submit">+</button>
			      				
			      			</form>
			      			</div>
	
			      		</div>
		      		</div>
		      		</c:if>
		      		</c:forEach>
		      		
		      	</div>
		    </div>
		 </div>
     </div>
    <!-- </div> -->
  </div>
</div>
   
   <script>
   $('#createChatRoom').on('click', function(){
		 $('#createChatRoomModal').modal('show');
	 });
	 // 모달 안의 취소 버튼에 이벤트를 건다.
	 $('#closeModalBtn').on('click', function(){
		 $('#createChatRoomModal').modal('hide');  
	 });
	 
      function resize(obj) {
         obj.style.height = '1px';
         obj.style.height = (12 + obj.scrollHeight) + 'px';
         // $(".inbox_chat").css("height", 550 + 12 + obj.scrollHeight);
         $(".inbox_chat").css("height", 550 + obj.scrollHeight);
      }
      
      let firstChat = $(".inbox_chat").children("div").first();
      let chatRoom = $(".msg_history");
      let userId = '<%=(String)session.getAttribute("username")%>';;
     
      //enter 시 submit
      //shift+enter시 줄바꿈
      $("#message").keypress(function (e) {
    	    if(e.which === 13 && !e.shiftKey) {
    	        e.preventDefault();
    	    
    	        $('#sendBtn').click();
    	    }
    	});
      
    //ajax
    
      function messageList(chatRno) {
    	  let result= new Array();
    	  $.ajax({
    		  url : "/chat/messageList",
	    	  type : "get",
	          data : {rno : chatRno},
	          dataType:"json",
	          contentType:"application/json",
	          async:false,
	          success : function(data) {
	        	  result = data;
	        	  console.log(result);
	        	  
	          } 
    	  });
    	  return result;
      }

    
      function chatChange(data){
		chatRoom.empty();
    	  var chatMsg = "";
    	  console.log(data);
    	  console.log(data.length);
		  for (var i = 0; i<data.length; i++) {
			  if(data[i].email == userId){
	    		  chatMsg += '<div class="outgoing_msg"><div class="sent_msg"><p>'+data[i].content+'</p><span class="time_date">'+data[i].mdate+'</span></div></div>';
			  }else{
				  chatMsg += '<div class="incoming_msg"></div>';
				  chatMsg += '<div class="received_msg"><div class="received_withd_msg"><p>'+data[i].content+'</p><span class="time_date">'+data[i].mdate+'</span></div></div></div>';
			  } 
		  }

    	  chatRoom.append(chatMsg);
    	  chatRoom.scrollTop(chatRoom[0].scrollHeight);
      }
      
      
      //페이지 처음 시작시 맨 위 채팅방 자동 활성화
      window.onload = function(){
    	  
    	  console.log(firstChat);
    	  chatUserId = firstChat.attr('data-email'); //맨 위 채팅방 닉네임
    	  chatRno = firstChat.attr('data-rno'); //맨 위 채팅방번호
    	  $('#sendRno').val(chatRno); //메시지 입력란에 rno값 넣기
    	  //ajax
    	  
    	  chatChange(messageList(chatRno));
    	  $(".active_chat").removeClass('active_chat');
       	  $(this).addClass('active_chat');
      }
      
      
      
      
    //채팅방 이동
      $(".chat_list").on("click",function() {2
    	  console.log("채팅방 이동");
    	  chatUserId = $(this).attr('data-email');
    	  chatRno = $(this).attr('data-rno');
    	  $('#sendRno').val(chatRno);

    		//ajax
    	  
    	  chatChange(messageList(chatRno));
    	  $(".active_chat").removeClass('active_chat');
       	  $(this).addClass('active_chat');

      })
      
      
      //유저 검색(Email을 이용한 검색)
      function searchUser() {
    	  var search = $(".search-bar").val().toLowerCase();
    	  
    	  let listChat = document.getElementsByClassName("chat_list");
    	  
    	  for (let i=0; i<listChat.length; i++) {
    		  chatUserEmail = listChat[i].getAttribute('data-email').toLowerCase();
    		  if(chatUserEmail.indexOf(search) != -1) {
    			  listChat[i].style.display = "";
    		  }else{
    			  listChat[i].style.display = "none";
    		  };
    	  };
      };
      
      //test중
      const username = '<%=(String)session.getAttribute("username")%>';
      let today = new Date(+new Date() + 3240 * 10000).toISOString().replace("T", " ").replace(/\..*/, '');
      var token = $("meta[name='_csrf']").attr("content");
  	  var header = $("meta[name='_csrf_header']").attr("content");
      
      $('#sendBtn').click(function() {
    	  sendMessage();
    	  $('#message').val('');
      });
      
      let sock = new SockJS("http://localhost:8088/chat/chat/");
      sock.onmessage = onMessage;
      sock.onclose = onClose;
      //메시지 전송
	  function sendMessage() {
		  
	      
	      var rno = $('#sendRno').val();
	      var content = document.getElementById("message").value;	 
		console.log(rno);
		console.log(content);
	      sock.send(
	    	  username+":"+content
          );
	          $.ajax({
	    	  url : "/chat/sendMessage",
	    	  type : "post",
	          data : JSON.stringify({
	        	  email : username,
	          	  rno : rno,
	          	  content : content
	          }),
	          dataType : "json",
	          contentType : "application/json",
	          beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
	          success : function(result) {
	        	  
	        	  $("#message").val();
	        	  chatRoom.scrollTop(chatRoom[0].scrollHeight);
	          },
	          error : function(err) {
	        	  alert("실패!")
	          }
	      }); 
      }
      //서버로부터 메시지를 받았을 때
      function onMessage(msg) {
    	  var data = msg.data;
    	  var sessionId = null;
    	  var message = null;
    	  var arr = data.split(":");
    	  
    	  for(var i=0; i<arr.length; i++) {
    		  console.log('arr['+i+']:'+arr[i]);
    	  }
    	  
    	  var cur_session = username;
    	  
    	  //현재 세션에 로그인 한 사람
    	  console.log("cur_session : " + cur_session);
    	  sessionId = arr[0];
    	  message = arr[1];
    	  
    	  console.log("sessionID : " + sessionId);
    	  console.log("cur_session : " + cur_session);
    	  
    	  //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
    	  if(sessionId == cur_session) {
    		  var str = '<div class="outgoing_msg">';
    		  str += '<div class="sent_msg">';
    		  str += '<p>'+message+'</p>';
    		  str += '<span class="time_date">'+today+'</span></div></div>';
    		  $('.msg_history').append(str);
    	  }
    	  else {
    		  var str = '<div class="incoming_msg">';
   			  str += '<div class="incoming_msg_img">';
   		  	  str += '<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"></div>';
   	 		  str += '<div class="received_msg">';
  	  		  str += '<div class="received_withd_msg">';
  	  		  str += '<p>'+message+'</p>';
  	  		  str += '<span class="time_date">'+today+'</span></div></div></div>';
  	  		  $('.msg_history').append(str);
    	  }
    	  
      }
      //서버와 연결을 끊었을 때
      function onClose(evt) {
    	  $('.msg_history').append("연결 끊김");
      }
   </script>

<%@ include file="../footer.jsp" %>
