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
	$(function() {
		$("#btn1").click(function(){
			var temp = $(":text").val();
			alert(temp);
		});

		$("#btn2").click(function(){
			var temp = $(":checkbox:checked").val();
			alert(temp);
		});

		$("#btn3").click(function(){
			var temp = $(":radio:checked").val();
			alert(temp);
		});

		$("#btn4").click(function(){
			var temp = $(":selected").val();
			alert(temp);
		});
		
	})
</script>
</head>
<body>
	<input type="button" id="btn1" value="text 값 확인"><br/>
	<input type="button" id="btn2" value="checkbox 값 확인"><br/>
	<input type="button" id="btn3" value="radio 값 확인"><br/>
	<input type="button" id="btn4" value="select 값 확인"><br/>
	
	테스트 하기
	<input type="text"><br/>
	
	취미 :
	<input type="checkbox" value="운동">운동
	<input type="checkbox" value="독서">독서
	<input type="checkbox" value="영화">영화<br/>
	
	좋아하는 동물 : 
	<input type="radio" name="animal" value="고양이">고양이
	<input type="radio" name="animal" value="강아지">강아지
	<input type="radio" name="animal" value="둘 다">둘 다<br/>
	
	탕수육 먹는 법 :
	<select>
		<option value="부먹">부먹</option>
		<option value="찍먹">찍먹</option>
		<option value="둘다">둘다</option>
	</select>
	
	
</body>
</html>