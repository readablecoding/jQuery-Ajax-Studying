<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[css]</title>
<script src="<c:url value='/resources/jquery-3.4.1.js'/>"></script>
<script>
	$(function(){
		
		//id가 test인 태그에 마우스커서가 올라갔을 때
		$("#test").mouseenter(function(){
			var temp = $("#test").css("height"); //아이디가 test인 것의 높이를 반환
			alert(temp);
		});

		
// 		$("#test").click(function(){
// 			$("#test").css("height", 500); 		
// 		});
	
		//img태그를 사용해 크기를 500을 만드는 것
		$("img").click(function(){
 			$(this).css("height", 500); 		
 		});

		//원래 크기로 돌아가기
		$(":button").click(function(){
			$("img").css("height", "auto"); // auto라고 하면 원래 크기로 돌아가게 하는 것 		
		});
	})
</script>
</head>
<body>
	
	<img id="test" src="http://bit.ly/goback11">
	<img id="test2" src="http://bit.ly/goback11">
	<img id="test3" src="http://bit.ly/goback11">
	<br/>
	<input type="button" value="리셋">	
	
</body>
</html>