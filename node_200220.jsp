<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[node]</title>
<script src="<c:url value='/resources/jquery-3.4.1.js'/>"></script>
<script>
	$(function(){
		$("div").append("<h2>append추가</h2>"); 		//div 태그를 기준으로 append: 뒷부분에 추가
		$("div").prepend("<h2>prepend추가</h2>"); 	//div 태그를 기준으로 prepend: 앞부분에 추가
		$("div").before("<h2>before추가</h2>");		//div 태그 바깥쪽 위에 내용 추가
		$("div").after("<h2>after추가</h2>"); 		//div 태그 바깥쪽 아래에 내용 추가

		$("#btn1").click(function(){
			$("div").empty();		//div태그는 살아있는데 div 태그 안의 내용은 사라짐
		});
		
		$("#btn2").click(function(){
			$("div").remove();		//div태그 자체가 사라짐
		});

		var temp1 = $("#aa").parent(); 			//해당 문서 객체의 부모 문서객체인 div를 temp1에 담음
		temp1.css("background-color", "blue");  //배경색을 파란색으로 바꿈

		var temp2 = $("div").children();		//해당 문서 객체의 자식 문서객체인 h1를 temp2에 담음
		temp2.css("background-color", "pink"); 	//배경색을 핑크색으로 바꿈
	});
</script>
</head>
<body>
	<input id="btn1" type="button" value="empty"><br/>
	<input id="btn2" type="button" value="remove"><br/>
	
	<div>
		<h1 id="aa">a</h1>
		<h1 id="bb">b</h1>
	</div>
</body>
</html>