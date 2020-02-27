<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[로그인]</title>
<script src="<c:url value='/resources/jquery-3.4.1.js'/>"></script>
<script type="text/javascript">
		$(function(){
			$("#cancel").click(function(){
			location.href="/moneybook";
			});
		});
		
		function formCheck(){
			var userid = document.getElementId("userid");
			var userpwd = document.getElementId("userpwd");
			
			if(userid.value == ''|| userid.value == null || 
					userid.value.length > 10 || userid.value.length < 3){
				alert("아이디는 3~10 글자를 입력하세요");
				return false;
			}
			if(userpwd.value == ''|| userpwd.value == null || 
			userpwd.value.length > 10 || userpwd.value.length < 3){
				alert("비밀번호는 3~10 글자를 입력하세요");
				return false;
			}	
			return true;
		}
</script>
</head>
<body>
		<h1>[로그인]</h1>
		<form action="login" method="post" onsubmit="return formCheck();">
			<table>
				<tr>
					<td>아이디 </td>
					<td><input type="text" id="userid" name="userid"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="userpw" name="userpwd"></td>
				</tr>
				<tr>
					<td><input id="login" type="submit" value="로그인"></td>
					<td><input id="cancel" type="button" value="취소"></td>
				</tr>
			</table>
		</form>	
	
</body>
</html>