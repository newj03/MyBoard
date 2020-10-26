<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='/resources/js/jquery-3.1.1.js'/>"></script>
<script>
	window.onload=function(){
		location.replace('loginForm.do');
	}
</script>
</head>
<body>

</body>
</html>