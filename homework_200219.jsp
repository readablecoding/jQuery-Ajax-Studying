<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[homework_200219]</title>
<script src="<c:url value='/resources/jquery-3.4.1.js'/>"></script>
<style>
	.bgColor, .bgColor0, .bgColor1
	, .bgColor2, .bgColor3, .bgColor4
	, .bgColor5{
		background-color : purple;
	}
</style>
<script>
	$(function(){
		
		$("img").mouseenter(function(){
			$(this).css("height", 300);		
		});
		
		$("img").mouseleave(function(){
			$(this).css("height", "auto");		
		});


 		$("span").mouseenter(function(){
 			$(this).addClass("bgColor");
  		});
		
 		$("span").mouseleave(function(){
 			$(this).removeClass();
 		});


		/* $("#btn1").click(function(){
			$("span").each(function(index,item){
				setTimeout(function(){
					$(item).addClass("bgColor");
				},1000*index);
			});
		}); */
		
	});
	
	 function btntest(){
		$.each($('span'),function(idx){
			var that2 = this;
			setTimeout(function(){
				$(that2).addClass("bgColor");
			}, 1000*idx);		
		});			
	} 
</script>
</head>
<body>
	<h2>[css 함수]</h2>
		<img id="test" src="http://bit.ly/goback11">
		<img id="test2" src="http://bit.ly/goback11">
		<img id="test3" src="http://bit.ly/goback11">
	<br/>
	<hr>
	<h2>[class 함수]</h2>
	<div>
		<span>첫 번째 문장</span><br/>
		<span>두 번째 문장</span><br/>
		<span>세 번째 문장</span><br/>
		<span>네 번째 문장</span><br/>
		<span>다섯 번째 문장</span><br/>
		<span>여섯 번째 문장</span><br/>
	</div>
	<hr>
	<h2>[each + SetTimeout]</h2>
	<input type="button" id="btn1" value="눌러라" onclick="btntest()">
	<!-- <input type="button" id="btn1" value="눌러라"> -->
	
</body>
</html>