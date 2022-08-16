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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${data.message != '' }">
		<script>
			var message = '${data.message}';
			if(message == '1'){
				top.alert('<spring:message code="message.alert1"/>'+'\n'+'<spring:message code="message.welcome"/>');
			}else if(message == '2'){
				top.alert('<spring:message code="message.alert2"/>'+'\n'+'<spring:message code="message.welcome"/>');
			}
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