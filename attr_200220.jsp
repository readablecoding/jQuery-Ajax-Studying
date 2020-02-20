<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[attr]</title>
<script src="<c:url value='/resources/jquery-3.4.1.js'/>"></script>
<script>
	$(function(){
		//문서객체.attr(속성)
		//문서객체.attr(속성, 속성값)
		//$("button").attr('class'); // 속성 값을 반환
		//$("button").attr('class', 'selected')
		 
		var link = [
			"http://bit.ly/goback11",
			"http://bit.ly/goback22",
			"http://bit.ly/goback33"
		];
		var cnt = 0;
	
		$(":button").click(function(){
			var temp = $(this).val();
			if(temp === "->") cnt >= link.length - 1 ? cnt = 0 : cnt++; //0,1,2 반복
			else cnt <= 0 ? cnt = link.length - 1 : cnt--; //2,1,0 반복
			$("img").attr("src", link[cnt]); //src속성을 배열의 n번째 값으로 바꿔줌
		});	
	});
</script>
</head>
<body>

	<img src="http://bit.ly/goback11"><br/>
	<input type="button" value="<-">
	<input type="button" value="->">
	
</body>
</html>