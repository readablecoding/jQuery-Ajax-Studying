<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[과제2]</title>
<style>
	.select{
		background-color: pink;
	}
</style>
<script src="<c:url value='/resources/jquery-3.4.1.js'/>"></script>
<script>
	$(function(){
		//css함수 부분
		$('img').mouseenter(function(){
			$(this).css('height', 100);	//이미지 태그 중 이벤트가 발생한 태그인 this
		});
		$('img').mouseleave(function(){
			$(this).css('height', 'auto');	//'auto'는 원래대로 돌리는 것
		});	

		//class함수 부분: 2가지 방법이 있다. css 함수를 쓰거나 addClass, removeClass를 쓰는 것
		$('p').mouseenter(function(){
			//$(this).css('background-color', 'pink');	//이미지 태그 중 이벤트가 발생한 태그인 this
			$(this).addClass('select');
		});
		$('p').mouseleave(function(){
 			//$(this).css('background-color', '';			//''는 원래대로 돌리는 것
			$(this).removeClass('select');
		});	

		//[each + setTimeout 함수] 부분
			$("button").click(function(){
				$("p").each(function(index, item){ //item은 각각의  p태그를  나타냄
					//setTimeout(함수, 시간); 시간이 지나면 함수가 실행된다.
					setTimeout(function(){
						$(item).addClass('select');
					}, index * 500); // 0.5초 간격으로 실행이 된다.		
				});	
			});
		
	})
</script>
</head>
<body>
	<h2>[css 함수]</h2>
		<img src="http://bit.ly/goback11">
		<img src="http://bit.ly/goback11">
		<img src="http://bit.ly/goback11">
	<hr>
	
	
	<h2>[class 함수]</h2>
		<p>첫번째 문장</p>
		<p>두번째 문장</p>
		<p>세번째 문장</p>
		<p>네번째 문장</p>
		<p>다섯번째 문장</p>
		<p>여섯번째 문장</p>
	<hr>
	
	<h2>[each + setTimeout 함수]</h2>
	<button>눌러라</button>
</body>
</html>