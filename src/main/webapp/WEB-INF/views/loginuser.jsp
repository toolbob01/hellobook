<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
일단 테스트용으로 만들어 놓은 페이지 입니다.
${friend}<br>

<c:forEach items="${friend}" var="friend">
	친구 ${friend } 님은 현재 <br>
	<c:choose>
		<c:when test="${fn:contains(loginUsers,friend)}">
			로그인 중입니다. <br>
		</c:when>
		<c:otherwise>
			로그인 중이 아닙니다.<br>
		</c:otherwise>
	</c:choose>
</c:forEach>

</body>
</html>