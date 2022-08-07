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
        <input type="text" placeholder="검색" onfocus="this.placeholder=''" onblur="this.placeholder='검색'" >
        <span class="header_icon">
          <i class="fas fa-search"></i>
        </span>
       
      </div>
    </header>
    <main class="find">
      <header class="find_header">
        <ul class="find_header-list">
          <li class="find_header-btn">
            <span class="header-btn_title1">이름</span>
          </li>
          <li class="find_header-btn">
           
            <span class="header-btn_title2">이메일</span>
          </li>
          <li class="find_header-btn">
          
            <span class="header-btn_title3">주소</span>
          </li>
          <li class="find_header-btn">
           
            <span class="header-btn_title4">아이디</span>
          </li>
        </ul>
      </header>
      <ul class="find_recommended">
        <h5 class="find_title">추천 친구</h5>
        <li class="find_friend friend ">
          <img src="/resources/imgs/me.png">
           <div class="profile">
                <p>Hello</p>
                <p>싱태 메세지</p>
          </div>
          <div class="friend_column">
            <span class="friend_add-btn">
              <i class="fas fa-user-plus"></i>
            </span>
          </div>
        </li>
        <li class="find_friend friend ">
          <img src="/resources/imgs/me.png">
           <div class="profile">
                <p>Hello</p>
                <p>싱태 메세지</p>
          </div>
          <div class="friend_column">
            <span class="friend_add-btn">
              <i class="fas fa-user-plus"></i>
            </span>
          </div>
        </li>
        <li class="find_friend friend ">
          <img src="/resources/imgs/me.png">
           <div class="profile">
                <p>Hello</p>
                <p>싱태 메세지</p>
          </div>
          <div class="friend_column">
            <span class="friend_add-btn">
              <i class="fas fa-user-plus"></i>
            </span>
          </div>
        </li>
        <li class="find_friend friend ">
          <img src="/resources/imgs/me.png">
           <div class="profile">
                <p>Hello</p>
                <p>싱태 메세지</p>
          </div>
          <div class="friend_column">
            <span class="friend_add-btn">
              <i class="fas fa-user-plus"></i>
            </span>
          </div>
        </li>
        <li class="find_friend friend ">
          <img src="/resources/imgs/me.png">
           <div class="profile">
                <p>Hello</p>
                <p>싱태 메세지</p>
          </div>
          <div class="friend_column">
            <span class="friend_add-btn">
              <i class="fas fa-user-plus"></i>
            </span>
          </div>
        </li>
        <li class="find_friend friend ">
          <img src="/resources/imgs/me.png">
           <div class="profile">
                <p>Hello</p>
                <p>싱태 메세지</p>
          </div>
          <div class="friend_column">
            <span class="friend_add-btn">
              <i class="fas fa-user-plus"></i>
            </span>
          </div>
        </li>
        <li class="find_friend friend ">
          <img src="/resources/imgs/me.png">
           <div class="profile">
                <p>Hello</p>
                <p>싱태 메세지</p>
          </div>
          <div class="friend_column">
            <span class="friend_add-btn">
              <i class="fas fa-user-plus"></i>
            </span>
          </div>
        </li>
        <li class="find_friend friend ">
          <img src="/resources/imgs/me.png">
           <div class="profile">
                <p>Hello</p>
                <p>싱태 메세지</p>
          </div>
          <div class="friend_column">
            <span class="friend_add-btn">
              <i class="fas fa-user-plus"></i>
            </span>
          </div>
        </li>
      </ul>
    </main>
  </body>
</html>


<%@ include file="../footer.jsp" %>