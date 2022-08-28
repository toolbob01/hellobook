<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- BootStrap Icon -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<!-- <link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@600&family=Kosugi+Maru&family=Noto+Sans+KR&display=swap" rel="stylesheet"> -->
<!-- <link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@600&family=Kosugi+Maru&family=Noto+Sans+KR&family=Nunito:ital,wght@1,600&display=swap" rel="stylesheet"> -->
<link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@600&family=Kosugi+Maru&family=Montserrat:wght@600&family=Murecho&family=Nanum+Gothic&family=Noto+Sans+KR&family=Noto+Sans:wght@600&family=Nunito:wght@600&family=Roboto+Mono:wght@600&family=Sawarabi+Gothic&display=swap" rel="stylesheet">

<link rel="stylesheet" href="/resources/css/hellobook.css">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/mypage.css">


<style>
body {
	font-family: 'Inconsolata', 'Kosugi Maru', 'Noto Sans KR', 'Sawarabi Gothic';
}
</style>

<script>
	var csrfHeanderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";

	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(csrfHeanderName, csrfTokenValue);
	});
</script>

<title>Hello Book</title>
</head>
<body>

<header class="p-3 mb-3 border-bottom nav-gradation sticky">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-lg-start nav-right">

        <ul class="nav col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 nav-logo">
            <li><a href="/" class="nav-link link-dark fs-3"><img class="logo_hellobook" src="/resources/imgs/logo.png"></a></li>
        </ul>

        <ul class="nav col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 nav-search">
            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" method="get" action="/" id="headerSearchForm">
            	<input type="hidden" name="type" value="NC" />
                <input type="search" class="form-control" name="keyword" placeholder="<spring:message code="header.search"/>" aria-label="Search">
            </form>
        </ul>

        <div class="dropdown d-flex justify-content-center text-end nav-memu">
            <div class="mx-2 header-icon">
            	<a href="/">
            		<img src="https://img.icons8.com/ios-glyphs/30/000000/home-page--v1.png"/>
            	</a>
            </div>
            <div class="mx-2 header-icon">
            	<a href="/friend/list">
            		<img src="https://img.icons8.com/ios-glyphs/30/000000/contacts.png"/>
            	</a>
            </div>
            <div class="mx-2 header-icon">
            	<a href="/chat/chat_list?email=${username}">
                	<img src="https://img.icons8.com/ios-glyphs/30/000000/speech-bubble-with-dots.png"/>
                </a>
            </div>
            <div class="mx-2 header-icon">
            	<a href="/post/post_write">
                	<img src="https://img.icons8.com/ios-glyphs/30/000000/add--v1.png"/>
                </a>
            </div>
            <sec:authorize access="isAuthenticated()">
	            <div class="mx-2">
	                <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
	                    <img src="https://img.icons8.com/ios-glyphs/30/000000/small-icons.png"/>
	                </a>
	                <ul class="dropdown-menu text-small text-center" aria-labelledby="dropdownUser1">
	                    <li><a class="dropdown-item" href="/mypage/profile/${Nname}"><spring:message code="header.profile"/></a></li>
	                    <li><a class="dropdown-item" href="/mypage/setting/"><spring:message code="header.setting"/></a></li>
	                    <li><hr class="dropdown-divider"></li>
	                    <li>
	                    	<form class="dropdown-item on_cursor" id="logoutFN" method="post" action="/member/logout" onclick="logoutFN()">
	                    		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                    		<div class="d-flex">
		                    		<img class="" src="https://img.icons8.com/external-sbts2018-mixed-sbts2018/20/000000/external-logout-social-media-basic-1-sbts2018-mixed-sbts2018.png"/>
		                    		<span class="mt-1 ms-3"><spring:message code="header.logout"/></span>	
	                    		</div>
	                    	</form>
	                    </li>
	                </ul>
	            </div>
            </sec:authorize>
            <sec:authorize access="isAnonymous()">
            	<div class="mx-2">
	            	<a href="/member/login">
	                	<img src="https://img.icons8.com/external-kmg-design-glyph-kmg-design/35/000000/external-login-real-estate-kmg-design-glyph-kmg-design.png"/>
	                </a>
            	</div>
            </sec:authorize>
        </div>
		<div id="changeLang">
			<select class="form-control" name="lang" id="langController" style="width: auto;" onchange="changLang(this.value)">
			  <option value=""><spring:message code="header.setlanguage"/>
			  <option value="en">English</option>
			  <option value="ja">日本語</option>
			  <option value="ko">한국어</option>
			</select>
		</div>
        </div>
        	
    </div>
    
</header>

<script>
	var csrfHeanderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";

	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(csrfHeanderName, csrfTokenValue);
	});
</script>

<style>
#changeLang {
    display: flex;
    flex-direction: row-reverse;
    width: auto;
}
</style>


<script>
	var em = '<%=(String)session.getAttribute("username")%>';
	
	function changLang(lang){
		var protocol = window.location.protocol;
		var host = window.location.host;
		var path = window.location.pathname;
		var link = path+"?lang="+lang;
		if(path=="/chat/chat_list") {
			link = path+"?email="+em+"&lang="+lang;
		}
		
		console.log(link);

		location.replace(link);
	}
	
</script>

<script>
	function logoutFN(){
		$("#logoutFN").submit();
		console.log('Logout Success !!!');
	}
</script>