<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${data.message != '' }">
		<script>
			var message = "${data.message}";
			top.alert(message);
		</script>
	</c:if>
	
	<c:if test="${data.href != '' }">
		<script>
			var href = "${data.href}";
			top.location.href = href;
		</script>
	</c:if>
</body>
</html>