<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='/resources/jquery-3.4.1.js'/>"></script>
<script>
	$(function () {
		$("#sel1").click(function() {
			resetBGC();
			$("a[href]").css("background-color", "pink");
			$(this).css("background-color", "pink");		
		});

		$("#sel2").click(function() {
			resetBGC();
			$("a[href='https://www.naver.com']").css("background-color", "pink");	
			$(this).css("background-color", "pink");	
		});

		$("#sel3").click(function() {
			resetBGC();
			$("a[href$='com']").css("background-color", "pink");
			$(this).css("background-color", "pink");		
		});

		$("#sel4").click(function() {
			resetBGC();
			$("a[href*='goo']").css("background-color", "pink");
			$(this).css("background-color", "pink");	
		});

		$("#sel5").click(function() {
			resetBGC();
			$("a[href^='https']").css("background-color", "pink");	
			$(this).css("background-color", "pink");			
		});

		$("#sel6").click(function() {
			resetBGC();
			$("a[name~='test']").css("background-color", "pink");
			$(this).css("background-color", "pink");			
		});

		$("#sel7").click(function() {
			resetBGC();
			$("a[name|='test']").css("background-color", "pink");
			$(this).css("background-color", "pink");							
		});
	
		function resetBGC(){
			$("a, h2").css("background-color","");	
		}
	})
</script>
</head>
<body>
	
	<h2 id="sel1">a[href] : a 태그이면서 href 속성을 갖는 것</h2>
	<h2 id="sel2">a[href='https://www.naver.com'] : a 태그이면서 href 속성이 https://www.naver.com 인 것</h2>
	<h2 id="sel3">a[href$='com'] : a 태그이면서 href 속성이 .com으로  끝나는 것</h2>
	<h2 id="sel4">a[href*='goo'] : a 태그이면서 href 속성이 goo를 포함하는 것</h2>
	<h2 id="sel5">a[href^='https'] : a 태그이면서 href 속성이 https로 시작하는 것</h2>
	<h2 id="sel6">a[name~='test'] : a 태그이면서 name 속성이 test로 시작하는 것(공백 포함)</h2>
	<h2 id="sel7">a[name|='test'] : a 태그이면서 name 속성이 test로 시작하는 것(하이픈 포함)</h2>
	
	<a href="https://www.naver.com" name="test-name">https://www.naver.com</a><br/>
	<a href="http://www.google.com" name="test name">http://www.google.com</a><br/>
	<a href="http://www.wikipedia.org" name="test">http://www.wikipedia.org</a><br/>
	

</body>
</html>