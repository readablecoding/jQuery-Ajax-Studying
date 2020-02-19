<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[과제 1]</title>
<script src="<c:url value='/resources/jquery-3.4.1.js'/>"></script>
<script>
	//1번째 방법
	$(function(){
		$("#btn").click(function() {
			//jquery
			var useridVal = $("#userid").val();
			var usernameVal = $("#username").val();
			var usertypeVal = $(":radio:checked").val();

			//javascript
			var infotableDoc = document.getElementById("infoTable");
			
			infotableDoc.innerHTML += "<tr><td>"+useridVal+"</td><td>"+usernameVal+"</td><td>"+usertypeVal+"</td></tr>";
		});	
	})
	
	/* //2번쨰 방법
	$(function(){
		function addInfo(){
			//jquery
			var useridVal = $("#userid").val();
			var usernameVal = $("#username").val();
			var usertypeVal = $(":radio:checked").val();

			//javascript
			var infotableDoc = document.getElementById("infoTable");
			
			infotableDoc.innerHTML += "<tr><td>"+useridVal+"</td><td>"+usernameVal+"</td><td>"+usertypeVal+"</td></tr>"
		};
		$("#btn").click(addInfo);		//함수()가 아니라 함수 객체만 적는다.
	}) */

</script>
</head>
<body>
<div>
	<div>
		<table id="infoTable">
			<tr>
				<th>아이디</th><th>이름</th><th>종류</th>
			</tr>	
				
		</table>		
	</div>
	<div>
		아이디 : <input type="text" id="userid"><br/>
		이름 : <input type="text" id="username"><br/>
		종류 :
		<input type="radio" name="usertype" value="부먹">부먹
		<input type="radio" name="usertype" value="찍먹">찍먹
		<input type="radio" name="usertype" value="둘다" checked="checked">둘다
	</div>
	<button id="btn">등록</button>
</div>
</body>
</html>