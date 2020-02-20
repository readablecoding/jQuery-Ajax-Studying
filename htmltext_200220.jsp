<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[htmltext]</title>
<script src="<c:url value='/resources/jquery-3.4.1.js'/>"></script>
<script>
	$(function(){
		//text() -> 자바스크립트의 innerTEXT
		//html() -> 자바스크립트의 innerHTML
		var result = "<h2>html과 text 함수 사용 예</h2>";
		
		$("#result1").text(result);
		
		//innerHTML = "result";
		$("#result2").html(result); //덮어쓰는 것

		$("#result2").click(function(){
			alert($(this).text());	//결과: html과 text 함수 사용 예 => text node(태그 사이에 있는 텍스트)를 반환
			alert($(this).html());	//결과: <h2>html과 text 함수 사용 예</h2> => element를 반환(텍스트,태그까지 포함)
		});	

	});
</script>
</head>
<body>
	<div id="result1"></div>
	<div id="result2"></div>
</body>
</html>