<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--<script src="/test/resources/jquery-3.4.1.js"></script>-->
<script src="<c:url value='/resources/jquery-3.4.1.js'/>"></script>
<script>
// 	windows.onload = function{
// 		//jquery 코드 작성
// 	}

// 	$(document).ready(function (){
// 		//jquery 코드 작성
// 	}); 

// 	$(function () {
// 		//jquery 코드 작성
// 		//	#	   -> 	id 선택자
// 		//	.      -> 	class 선택자
// 		//	>      ->	자식 선택자
// 		//	공백        ->	자손 선택자
		
 		function selectFunc1(){
 			resetFunc();
 			$("*").css("border-color", "red");		//모든 선택자
 		}

 		function selectFunc2(){
 			resetFunc();
 			$("div#idtest").css("border-color", "red"); //div 태그 중 id가 idtest인 경우
 		}

 		function selectFunc3(){
 			resetFunc();
 			$("div > ul").css("border-color", "red");	//div태그 중 자식인 ul인 경우
 		}

 		function selectFunc4(){
 			resetFunc();
 			$("div > ul > li").css("border-color", "red");	//div 태그 중 자식인 ul의 자식인 li인 경우	
 		}

 		function selectFunc5(){
 			resetFunc();
 			$("div li").css("border-color", "red");	//div 태그 자손인 li인 경우
 		}

 		function selectFunc6(){
 			resetFunc();
 			$(".clstest").css("border-color", "red");	//클래스가 clstest인 경우	
 		}

 		function selectFunc7(){
 			resetFunc();
 			$("div *").css("border-color", "red"); //div 태그의 자손 모두
 		}

 		function resetFunc(){
 			$("*").css("border-color", "gray");	//모든 선택자	
 		}
	
// 	});
</script>
<style>
	*{
		border-style: solid;
		border-color: gray;		
		padding: 5px;
		margin: 15px;
	}
</style>
</head>
<body>

	<input type="button" value="*" onclick="selectFunc1()"><br/>
	<input type="button" value="div#idtest" onclick="selectFunc2()"><br/>
	<input type="button" value="div > ul" onclick="selectFunc3()"><br/>
	<input type="button" value="div > ul > li" onclick="selectFunc4()"><br/>
	<input type="button" value="div li" onclick="selectFunc5()"><br/>
	<input type="button" value=".clstest" onclick="selectFunc6()"><br/>
	<input type="button" value="div *" onclick="selectFunc7()"><br/>
	<input type="button" value="*" onclick="resetFunc()"><br/>
	
	
	body 
	<div id="idtest">
		div#idtest			
		<ul>
			div#idtest > ul
			<li>div#idtest > ul > li</li>
			<li class="clstest">div#idtest > ul > li.clstest</li>
			<li>div#idtest > ul > li</li>
			<li class="clstest">div#idtest > ul > li.clstest</li>
		</ul>
	</div>
	
</body>
</html>