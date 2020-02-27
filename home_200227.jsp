<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	[일일 가계부]  
</h1>
	
	<c:choose>
		<c:when test="${sessionScope.loginId == null}"> 
			<a href="<c:url value='joinForm'/>">회원가입</a><br/>
			<a href="<c:url value='loginForm'/>">로그인</a><br/>
		</c:when> 
		<c:otherwise> 
			<b>${sessionScope.loginId}님 환영합니다.</b><br/>
			<a href="<c:url value='myMoneyBook'/>">내 가계부</a><br/>
			<a href="<c:url value='logout'/>">로그아웃</a><br/>
		</c:otherwise>
	</c:choose> 
</body>
</html>
