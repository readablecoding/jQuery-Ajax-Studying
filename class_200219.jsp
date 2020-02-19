<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[class]</title>
<style>
	.bgColor, .bgColor0{
		background-color: orange;
	}
	.bgColor1 {
		background-color: blue;	
	}
	.bgColor2 {
		background-color: aqua;	
	}
	.bgColor3 {
		background-color: green;	
	}
	.bgColor4 {
		background-color: olive;	
	}
	.bgColor5 {
		background-color: lime;	
	}
</style>
<script src="<c:url value='/resources/jquery-3.4.1.js'/>"></script>
<script>
	$(function(){
		
		$("#btn1").click(function(){
			$("div > *").addClass("bgColor");		//bgColor라는 클래스 속성을 만듦
		});
	
		$("#btn2").click(function(){
			$("div > *").removeClass("bgColor");	//bgColor라는 클래스 속성을 삭제
		});

		//index를 사용해 클래스 추가
		$("#btn3").click(function(){
			// callback function
			// fucntion의 매개변수로 전달된 function
			$("div > *").addClass(function(index){	
				//div 태그 아래 모든 태그를 addClass를 호출하는데 그 안에 익명함수를 넣어 function이 실행됨, index는 0부터 시작해 마지막까지
				return "bgColor" + index;	//6개이므로 bgColor0 부터 bgColor5까지 돼 클래스가 태그 안에 붙게 된다.
			});
		});

		//매개변수로 전달해 삭제하는 방법
		$("#btn4").click(function(){
			$("div > *").removeClass(function(index, item){
				//return "bgColor" + index;
				console.log(item); 	//bgColor0부터 bgColor5까지 나옴
				return item;		//item은 클래스가 갖고 있는 값 그 자채
			});
				
		});

		//클래스 값을 다 삭제하는 방법
		$("#btn5").click(function(){
			$("div > *").removeClass();	
		});

		//켰다가 껐다가 반복하는 용도: 추가와 삭제를 한번에 하는 것
		$("#btn6").click(function(){
			$("div > *").toggleClass("bgColor"); //지정한 태그에 대해 클래스를 설정하고 한번더 호출하면 클래스를 삭제함
		});

		//매개변수로 아무것도 전달하지 않음
		//문서 객체에 설정되어 있는 class 속성값을 삭제, 삭제 후, 재호출시 삭제했던 class 속성값을 추가
		$("#btn7").click(function(){
			$("div > *").toggleClass(); 
		});
	})
</script>
</head>
<body>
	<div>
		<h1>가</h1>
		<h2>나</h2>
		<h3>다</h3>
		<h4>라</h4>
		<h5>마</h5>
		<h6>바</h6>
	</div>
	<input type="button" id="btn1" value="class 속성 추가 1"><br/>
	<input type="button" id="btn2" value="class 속성 삭제 1"><br/>
	<input type="button" id="btn3" value="class 속성 추가 2"><br/>
	<input type="button" id="btn4" value="class 속성 삭제 2"><br/>
	<input type="button" id="btn5" value="class 속성 삭제 3"><br/>
	<input type="button" id="btn6" value="class 속성 토글 1"><br/>
	<input type="button" id="btn7" value="class 속성 토글 2"><br/>	
</body>
</html>