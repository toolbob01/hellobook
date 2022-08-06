<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%@ include file="../header.jsp" %>


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

.recent_heading h4 {
	color: #707070;
	font-size: 1.3vmax;
	margin: auto;
	font-weight: bold; 
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
   /*/////////////*/
   background-color: #fff;
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

.input-group-addon {
   pointer-events:none;
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
   cursor: pointer;
}

.inbox_chat {
   height: 610px;
   overflow-y: scroll;
}

.active_chat {
   background: #ebebeb;
   cursor: default;
   pointer-events:none;
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
   box-shadow: 10px 5px 5px #ccc;
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
   background: #9fd5ff none repeat scroll 0 0;
   border-radius: 3px;
   font-size: 14px;
   margin: 0;
   color: #333;
   padding: 5px 10px 5px 12px;
   width: 100%;
   box-shadow: 10px 5px 5px #ccc;
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
   background: #9fd5ff none repeat scroll 0 0;
   border: medium none;
   border-radius: 50%;
   color: #fff;
   cursor: pointer;
   font-size: 17px;
   height: 33px;
   position: absolute;
   right: 10px;
   top: 11px;
   width: 33px;
}
:focus-visible {
    outline: #9fd5ff auto 1px;
}
button:focus {
   outline: none;
}
.msg_send_btn:hover {
   border: solid 2px #76bef5;
}

.messaging {
   padding: 0 0 50px 0;
   margin-top: 100px;
}

.msg_history {
   height: 516px;
   overflow-y: auto;
}
</style>
</head>


<body>
   <div class="container">
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
                  <div class="chat_list" data-email="friendA" data-rno="1">
                     <div class="chat_people">
                        <div class="chat_img">
                           <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
                        </div>
                        <div class="chat_ib">
                           <h5>friendA <span class="chat_date">07-31</span></h5>
                           <p>최근 메세지</p>
                        </div>
                     </div>
                  </div>
                  <div class="chat_list" data-email="friendB" data-rno="2">
                     <div class="chat_people">
                        <div class="chat_img">
                        <!-- 유저 프로필 사진 -->
                           <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
                        </div>
                        <div class="chat_ib">
                           <h5>friendB <span class="chat_date">07-31</span></h5>
                           <p>최근 메세지</p>
                        </div>
                     </div>
                  </div>
                  <div class="chat_list" data-email="friendC" data-rno="3">
                     <div class="chat_people">
                        <div class="chat_img">
                        <!-- 유저 프로필 사진 -->
                           <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">
                        </div>
                        <div class="chat_ib">
                           <h5>friendC <span class="chat_date">07-31</span></h5>
                           <p>세줄 이상의 긴글은 잘라서 ... 표시합니다. 세줄 이상의 긴글은 잘라서 ... 표시합니다. 세줄 이상의 긴글은 잘라서 ... 표시합니다.</p>
                        </div>
                     </div>
                  </div>
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
                     <textarea class="write_msg" placeholder="메세지 입력" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
                     <button class="msg_send_btn" type="button">
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
   
   <script>
      function resize(obj) {
         obj.style.height = '1px';
         obj.style.height = (12 + obj.scrollHeight) + 'px';
         // $(".inbox_chat").css("height", 550 + 12 + obj.scrollHeight);
         $(".inbox_chat").css("height", 550 + obj.scrollHeight);
      }
      
      let firstChat = $(".inbox_chat").children("div").first();
      let chatRoom = $(".msg_history");
      let userId = 'friendD';
      
      
      //페이지 처음 시작시 맨 위 채팅방 자동 활성화
      window.onload = function(){
    	  
    	  console.log(firstChat);
    	  chatUserId = firstChat.attr('data-email');
    	  console.log(chatUserId);
    	  //ajax 실행해서 메세지 list 받아오기
    	  //아래 내용 삭제
    	  let list = [
    			{
    				"mno":"1",
    				"rno":1,
    				"content":"친구 A에게 보낸 메세지.",
    				"email":"friendD",
    				"mdate":"11:41 AM | 07-31",
    				"status":2
    			},
    			{
    				"mno":"5",
    				"rno":1,
    				"content":"친구 A에게 보낸 메세지.2",
    				"email":"friendD",
    				"mdate":"11:48 AM | 07-31",
    				"status":2
    			},
    			{
    				"mno":"9",
    				"rno":1,
    				"content":"친구 A가 보낸 메세지.",
    				"email":"friendA",
    				"mdate":"11:51 AM | 07-31",
    				"status":2
    			},
    			{
    				"mno":"13",
    				"rno":1,
    				"content":"친구 A가 보낸 메세지.2",
    				"email":"friendA",
    				"mdate":"12:01 AM | 07-31",
    				"status":2
    			}
    		]
    	  //위 내용 삭제
    	  
    	  chatChange(list);
    	  $(this).addClass('active_chat');
      }
      
      //채팅방 이동
      function chatChange(msgList){

    	  var chatMsg = "";
    	  
    	  $.each(msgList,function(index,item){
    	  
    	  if(item.email == userId){
    		  chatMsg += '<div class="outgoing_msg"><div class="sent_msg"><p>'+item.content+'</p><span class="time_date">'+item.mdate+'</span></div></div>';
		  }else{
			  chatMsg += '<div class="incoming_msg"><div class="incoming_msg_img"><img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"></div>';
			  chatMsg += '<div class="received_msg"><div class="received_withd_msg"><p>'+item.content+'</p><span class="time_date">'+item.mdate+'</span></div></div></div>';
		  }  
    	  })
    	  
    	  chatRoom.html(chatMsg);
      }
      
      
      $(".chat_list").on("click",function() {
    	  console.log("채팅방 이동");
    	  chatUserId = $(this).attr('data-email');
    	  
    	  //여기서 ajax이용해서 데이터베이스로부터 id검색해서 채팅내용을 전부 list로 가져오기
    	  //시간 순서대로 리스트를 받아올거고 메시지 번호,그룹 아이디,메시지 내용,이메일,시간,상태를 받아옴
    	  //사용할 땐 아래의 내용을 전부 지울 것
    	  let listA = [
    			{
    				"mno":"1",
    				"rno":1,
    				"content":"친구 A에게 보낸 메세지.",
    				"email":"friendD",
    				"mdate":"11:41 AM | 07-31",
    				"status":2
    			},
    			{
    				"mno":"5",
    				"rno":1,
    				"content":"친구 A에게 보낸 메세지.2",
    				"email":"friendD",
    				"mdate":"11:48 AM | 07-31",
    				"status":2
    			},
    			{
    				"mno":"9",
    				"rno":1,
    				"content":"친구 A가 보낸 메세지.",
    				"email":"friendA",
    				"mdate":"11:51 AM | 07-31",
    				"status":2
    			},
    			{
    				"mno":"13",
    				"rno":1,
    				"content":"친구 A가 보낸 메세지.2",
    				"email":"friendA",
    				"mdate":"12:01 AM | 07-31",
    				"status":2
    			}
    		]
    	  let listB = [
  			{
  				"mno":"1",
  				"rno":2,
  				"content":"친구 B에게 보낸 메세지",
  				"email":"friendD",
  				"mdate":"11:01 AM | 07-31",
  				"status":2
  			},
  			{
  				"mno":"4",
  				"rno":2,
  				"content":"친구 B가 보낸 장문의 메세지 <br/>친구 B가 보낸 장문의 메세지 <br/>친구 B가 보낸 장문의 메세지 <br/>친구 B가 보낸 장문의 메세지 <br/>",
  				"email":"friendB",
  				"mdate":"11:07 AM | 07-31",
  				"status":2
  			},
  			{
  				"mno":"5",
  				"rno":2,
  				"content":"친구 B에게 보낸 메세지. 2",
  				"email":"friendD",
  				"mdate":"11:10 AM | 07-31",
  				"status":2
  			},
  			{
  				"mno":"9",
  				"rno":2,
  				"content":"친구 B가 보낸 메세지.2",
  				"email":"friendB",
  				"mdate":"11:12 AM | 07-31",
  				"status":2
  			}
  		  ]
    	let listC = [
  			{
  				"mno":"9",
  				"rno":3,
  				"content":"친구 C가 보낸 메세지.",
  				"email":"friendC",
  				"mdate":"11:01 AM | 07-31",
  				"status":2
  			},
  			{
  				"mno":"19",
  				"rno":3,
  				"content":"친구 C가 보낸 메세지.2",
  				"email":"friendC",
  				"mdate":"11:07 AM | 07-31",
  				"status":2
  			},
  			{
  				"mno":"21",
  				"rno":3,
  				"content":"친구 C에게 보낸 메세지.",
  				"email":"friendD",
  				"mdate":"11:08 AM | 07-31",
  				"status":2
  			},
  			{
  				"mno":"25",
  				"rno":3,
  				"content":"친구 C에게 보낸 장문의 메세지.<br/>친구 C에게 보낸 장문의 메세지.<br/>친구 C에게 보낸 장문의 메세지.<br/>친구 C에게 보낸 장문의 메세지.<br/>",
  				"email":"friendD",
  				"mdate":"11:11 AM | 07-31",
  				"status":2
  			}
  		  ]
    	  
    	  let msgList;
    	  
    	  if(chatUserId == 'friendA'){
        	  msgList = listA
    	  }else if(chatUserId == 'friendB'){
    		  msgList = listB
    	  }else{
    		  msgList = listC
    	  }
    	//사용할 땐 위의 내용을 전부 지울 것
    	
    	  chatChange(msgList);
    	  
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
      
   </script>
<%@ include file="../footer.jsp" %>