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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- BootStrap Icon -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/hellobook.css">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/mypage.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Inconsolata&family=Kosugi+Maru&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="/resources/css/mypage.css">

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
<body>
<div id="changeLang">
	<select class="form-control" onchange="changLang(this.value)" name="lang" style="width: auto;">
	  <option value=""><spring:message code="header.setlanguage"/>
	  <option value="en">English</option>
	  <option value="ja">日本語</option>
	  <option value="ko">한국어</option>
	</select>
</div>
<script>
	function changLang(lang){
		var protocol = window.location.protocol;
		var host = window.location.host;
		var path = window.location.pathname;
		
		var link = path+"?lang="+lang
		console.log(link);
		
		location.replace(link);
	}
</script>
