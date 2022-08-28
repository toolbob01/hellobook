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
    <link rel="stylesheet" href="/resources/css/friendfind.css" />
    <title></title>
 

  </head>
  <body class="body1">
  
  
  
  
    <header class="header">
      <div class="header_header-column">
        <h1>친구찾기</h1>
    </div>
      
      <div class="search_box">
      	<form action = "/friend/search" method="get">
        <input type="text" name="keyword" id ="keyword" placeholder="검색" onfocus="this.placeholder=''" onblur="this.placeholder='검색'" >
        <button type="submit" class="search_btn"><img src="/resources/imgs/search_btn.png"></button>
 
       </form>
      </div>
    </header>
    <main class="find">
      <header class="find_header">
        <ul class="find_header-list">
          <li class="find_header-btn">
            <span class="header-btn_title1" id="button1">이름</span>
          </li>
          <li class="find_header-btn">
           
            <span class="header-btn_title2" id="button2">이메일</span>
          </li>
          <li class="find_header-btn">
          
            <span class="header-btn_title3" id="button3">관심분야</span>
          </li>
        </ul>
      </header>
      <div class="container">
      <h5 class="find_title">추천 친구</h5>
      <ul class="find_recommended">
       
         <c:forEach var="find" items="${friendfind}">
        <li class="find_friend friend ">
          <img src="/resources/imgs/me.png">
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