<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[아이디, 이름, 종류 값 가져오기]</title>
<script src="<c:url value='/resources/jquery-3.4.1.js'/>"></script>
<script>
	$(function (){
		$("#register").click(function (){
			var getter = $("#getter");
			
			var id = $(":text").val();
			var name = $("#name").val();
			var food = $(":radio:checked").val();
		
			var str ="";
			str += "<tr><td>"
			str += id;
			str += "&nbsp;";
			str += name;
			str += "&nbsp;"; 
			str += food;
			str += "</td></tr>"

			getter.append(str);
		});		
	})	
</script>
</head>
<body>
	
	<b>아이디&nbsp;이름&nbsp;종류</b>
	<table id="getter">
		
	</table>
	<hr>
	아이디 : <input type="text" id="id"><br/>
	이름 : <input type="text" id="name"><br/>
	종류 : 
	<input type="radio" name="food" value="부먹" checked="checked">부먹
	<input type="radio" name="food" value="찍먹">찍먹
	<input type="radio" name="food" value="둘다">둘다<br/>
	
	<input type="button" id="register" value="등록">

</body>
</html>