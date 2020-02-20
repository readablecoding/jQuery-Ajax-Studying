<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[val]</title>
<script src="<c:url value='/resources/jquery-3.4.1.js'/>"></script>
<script>
	$(function(){
		/* $(":text").keyup(function(){
			var temp = $(this).val();
			$(".copied").val(temp); //temp라는 변수가 가진 문자열이 copied라는 클래스를 가진 태그에 들어감
		});	 */

		$(":text").on("keyup", function(){  //on(이벤트명, 함수)
			var temp = $(this).val();
			$(".copied").val(temp);
		});

		//매개변수를 전달하지 않고 이벤트를 끊어버리는  방법
		//$(":text").off();

		//특정 이벤트만 연결을 끊고 싶을 때
		//$(":text").off("keyup")
	})
</script>
</head>
<body>

	<input type="text" placeholder="여기에 테스트 입력"><br/>
	
	<input class="copied" type="text"><br/>
	<input class="copied" type="text"><br/>
	<input class="copied" type="text"><br/>
	
</body>
</html>