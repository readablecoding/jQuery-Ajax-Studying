<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[each 배열]</title>
<script src="<c:url value='/resources/jquery-3.4.1.js'/>"></script>
<script>
	$(function(){
		var temp = ['가','나','다','라'];

		//jQuery에서 배열을 처리할 때 each를 사용함
		//index ->  0, 1, 2, 3
		//item  -> '가','나','다','라'
		$("#btn1").click(function(){
			$.each(temp, function(index, item){    //배열객체, function객체(index, item)
				alert(item);
			});
		});

		//1)준비된 배열(javascript의 배열 / jQuery의 배열)에 대해 반복 작업을 실시
		//jQuery로 가져온 문서객체는 javascript의 문서객체를 배열 형태로 가져온 것
		$("#btn2").click(function(){	
			$.each($(":checked"), function(index, item){  
				//매개변수: 체크가 된 자바스크립트의 문서객체, function(index, item)
				//alert(item.value);
				alert($(item).val());
			});
		});				
		
		//2)jQuery의 배열 생성과 동시에 반복 작업 실시: jQuery배열밖에 사용 못함
		$("#btn3").click(function(){
			$(":checked").each(function(index, item){ //(":checked")로 배열 생성
				//alert(item.value);
				alert($(item).val());
			});
		});		
	})
</script>
</head>
<body>
	<input type="button" id="btn1" value="test"><br/>
	<input type="button" id="btn2" value="취미 확인1"><br/>
	<input type="button" id="btn3" value="취미 확인2"><br/>
	
	<input type="checkbox" name="hobby" value="운동">운동
	<input type="checkbox" name="hobby" value="영화">영화
	<input type="checkbox" name="hobby" value="독서">독서<br/>
</body>
</html>