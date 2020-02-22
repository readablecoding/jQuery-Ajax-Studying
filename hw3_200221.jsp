<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	var str = "<tr>";
	str += "<td><input type='text'></td>";
	str += "<td><input type='text'></td>";
	str += "<td><input type='date'></td>";
	str += "<td>";
	str += "<input class='add' type='button' onclick='addFunc(this)' value='+'>";
	str += "<input class='delete' type='button' onclick='delFunc(this)' value='-'>";	
	str += "</td>"
	str += "</tr>";

	///2번째 방법: HTML 태그 자체에 onclick 이벤트 달기
	function addFunc(item){
		$(item).parent().parent().after(str);
	}
	
	function delFunc(item){
		$(item).parent().parent().remove();
	}
	
	 $(function(){
		/*  var str = "<tr>";
			str += "<td><input type='text'></td>";
			str += "<td><input type='text'></td>";
			str += "<td><input type='date'></td>";
			str += "<td>";
			str += "<input class='add' type='button' onclick='addFunc(this)' value='+'>";
			str += "<input class='delete' type='button' onclick='delFunc(this)' value='-'>";	
			str += "</td>"
			str += "</tr>"; */
		 
		
		//클래스가 add인 것만 하니까 작동하지 않는다.
		/* $(".add").on("click", function(){  
				$(this).parent().parent().after(str);   
		}); */

		//1번째 방법: on()에 매개변수 3개를 넣는 것
     	$("table").on("click", ".add", function(){  //테이블 태그 내부에서 클릭 이벤트가 발생하면, 클릭 이벤트가 클래스가 add인 것에서 찾는다. 
			$(this).parent().parent().after(str);   // 클릭 이벤트가 발생한 태그에서 td -> tr -> after를 하면 새로운 tr이 붙게 됨
		});

     	$("table").on("click", ".delete", function(){   //테이블 태그 내부에서 클릭 이벤트가 발생하면, 클릭 이벤트가 클래스가 delete인 것에서 찾는다. 
			$(this).parent().parent().remove(); 		//클릭 이벤트가 발생한 태그에서 2단계 뒤를 가서 tr 태그 자체를 삭제한다.
		}); 
		
	}); 
			
</script>
</head>
<body>
<h2>[ 자격증 정보 관리 ]</h2>

<table border="1">
	<tr>
		<th>자격증 명</th>
		<th>시행처</th>
		<th>취득 날짜</th>
		<th></th>
	</tr>
	<tr>
		<td><input type="text" /></td>
		<td><input type="text" /></td>
		<td><input type="date" /></td>
		<td>
			<input class="add" type="button" onclick="addFunc(this)" value="+" />
		</td>
	</tr>
</table>
</body>
</html>