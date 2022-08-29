<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />

    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"
    />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="stylesheet" href="/resources/css/friendfind.css" />
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  </head>
  <body class="body1">
  	<script>

  	  function nameClick() {
  		$('#hobbys').css('display','none');
  		  var change1 = document.getElementById("button1"); 
  		var change2 = document.getElementById("button2");
  		var change3 = document.getElementById("button3");
  	      change1.style.color="black";
  	  	  change1.style.fontWeight="bold";
  	  	change2.style.color="";
    	  change2.style.fontWeight="";
    	  change3.style.color="";
  	    change3.style.fontWeight="";
  	  	
  	    $("#searchInput").attr('name','keyword');
  	    }	
  	 	
  	    function emailClick() {
  	    	$('#hobbys').css('display','none');
  	    	 var change1 = document.getElementById("button1"); 
  	  		var change2 = document.getElementById("button2");
  	  		var change3 = document.getElementById("button3");
  	  	change1.style.color="";
	  	  change1.style.fontWeight="";
  	    change2.style.color="black";
  	  change2.style.fontWeight="bold";	
  	 change3.style.color="";
	    change3.style.fontWeight="";
  	    $("#searchInput").attr('name','email');
  	    }
  	    
  	  function hobbyClick() {
  		  /* alert('一文字の数字で入力してください。') */
  		  $('#hobbys').css('display','block');
  		 var change1 = document.getElementById("button1"); 
   		var change2 = document.getElementById("button2");
   		var change3 = document.getElementById("button3");
   		change1.style.color="";
	  	  change1.style.fontWeight="";
	  	change2.style.color="";
  	  change2.style.fontWeight="";
  	  change3.style.color="black";
	    change3.style.fontWeight="bold";	
    	    $("#searchInput").attr('name','hobby');
    	    }
  	        /* if($("#searchInput").val().length>2) {
  	        	alert('한자리 숫자로 입력부탁드립니다.');
  	        	$("#searchInput").focus();
  	        } */
  	        
  	  $(document).on("click",".badge",function(){
  		  var hobby = $(this).data("hobby");
  		  console.log(hobby);
  		$("#searchInput").val(hobby);
  		hobbyClick();
  		$(".search_btn").click();
  	  });
  	 </script>

  
  
    <header class="header">
      <div class="header_header-column">
        <h1>フレンド探し</h1>
      </div>
      <form action = "/friend/search" method="get">
      <div class="search_box" id="search_box">
        <input type="text" name="keyword" id ="searchInput" placeholder="検索" onfocus="this.placeholder=''" onblur="this.placeholder='検索'" >
      </div>
    
     
    
      <div class="btn">
        <button type="submit" class="search_btn">Find</button>
 		</div>
      </form>
    </header>
    <main class="find">
      <header class="find_header">
        <ul class="find_header-list">
         
          <li class="find_header-btn">
           <div id="button1" onclick="nameClick()" >
            <span class="header-btn_title1" id="button1" >名前</span>
            </div>
          </li>
          
          <li class="find_header-btn">
            <div id="button2" onclick="emailClick()">
            <span class="header-btn_title2" id="button2">メール</span>
            </div>
          </li>
          <li class="find_header-btn" onclick="hobbyClick()">
          
            <span class="header-btn_title3" id="button3" ">趣味</span>
          </li>

		</ul>
      </header>
      <div id="hobbys" style="text-align:center;display:none;">
      	<span class="badge bg-primary text-white" data-hobby="1"><spring:message code="profile.hobby.tour"/></span>							
		<span class="badge bg-secondary text-white" data-hobby="2"><spring:message code="profile.hobby.food"/></span>
		<span class="badge bg-success text-white" data-hobby="3"><spring:message code="profile.hobby.lang"/></span>
		<span class="badge bg-danger text-white" data-hobby="4"><spring:message code="profile.hobby.inst"/></span>
		<span class="badge bg-warning text-dark" data-hobby="5"><spring:message code="profile.hobby.read"/></span>
		<span class="badge bg-info text-dark" data-hobby="6"><spring:message code="profile.hobby.workout"/></span>
		<span class="badge bg-dark text-white" data-hobby="7"><spring:message code="profile.hobby.photo"/></span>
		<span class="badge bg-primary text-white" data-hobby="8"><spring:message code="profile.hobby.music"/></span>
		<span class="badge bg-secondary text-white" data-hobby="9"><spring:message code="profile.hobby.animal"/></span>
      </div>
      <div class="container">
      
      <h5 class="find_title">フレンドお勧め</h5>
      <ul class="find_recommended">
       
         <c:forEach var="find" items="${friendfind}">
        <li class="find_friend friend ">
          <img src="/hello_img/member/${find.profile}" alt="프로필이미지">
           <div class="profile">
                <p>${find.nickname}</p>
                <p>${find.intro}</p>
          </div>
          <form action="/friend/request" method="get">
          <div class="friend_column">
            <span class="friend_add-btn">
            <button type="submit" class="button" ><i class="fas fa-user-plus"></i></button>
            <input type="hidden" name="request" value="${find.email}">
            
            </span>
          </div>
          </form>
        </li>
         </c:forEach>
      </ul>
     
      </div>
    </main>
  </body>
</html>


<%@ include file="../footer.jsp" %>