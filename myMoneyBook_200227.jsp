<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 가계부</title>
<script src="<c:url value='/resources/jquery-3.4.1.js'/>"></script>
<script type="text/javascript">
	$(function(){

		//데이터 가져오기
		$("#date").click(function(){
			$.ajax({
				url: "savedData",
				type: "get",
				dataType: "json",
				success: function(result){
					$(result).each(function(index, item){	
						var temp = "<tr>";
						temp += "<td>" + item.userid + "</td">;
						temp += "<td>" + item.userpwd + "</td>";
						temp += "</tr>";
						$("table").append(temp);
					});
				},
				error: function(){alert("실패");}	
					
			});	
		});

		
	
	//폼 체크
	function formCheck(){
		var type = document.getElementById("#type");
		//var type = $("#type")[0];
		var inputdate = document.getElementById("#inputdate");
		//var inputdate $("#inputdate")[0];
		var memo = document.getElementById("#memo");
		//var memo = $("#memo")[0];
		var amount = document.getElementById("#amount");
		//var amount = $("#amount")[0];
		
		if(inputdate.value == '' || inputdate.value.length == 0){
			alert("날짜를 입력하세요");
			return false;
		}

		if(memo.value == '' || memo.value.length == 0){
			alert("메모를 입력하세요");
			return false;
		}

		if(amount.value == '' || amount.value.length == 0){
			alert("금액을 입력하세요");
			return false;
		}
	}

			
		/* $.ajax({
				url: "register",
				type: "post"
				data: {"type" : $("#type").val(), "inputdate" : $("#intputdate").val()
					,"memo" : $("#memo").val(), "amount" : $("#amout").val()}
				success: function(){alert("성공");},
				error: function(){alert("실패");}					
			}); 	
		}); */
});
</script>
</head>
<body>


	<form id="moneyBook" action="write"  method="post" onsubmit="return formCheck();">
		<table>
			<tr>
				<td>
					<select>
						<option value="수입" id="type">수입</option>
						<option value="지출" id="type">지출</option>
					</select>
					<input type="date" id="inputdate" name="inputdate"><br/>
				</td>
			</tr>
			<tr>
				<th>메모</th>
				<th>금액</th>
				<th colspan="2"></th>
			</tr>
			<tr>
				<td><input type="text" placeholder="내용 입력" id="memo" name="memo"></td>
				<td><input type="text" placeholder="금액 입력" id="amount" name="amount"></td>
				<td><input id="register" type="submit" value="등록"></td>
				<td><input id="delete" type="button" value="삭제"></td>
			</tr>	
			<tr>
				<th>메모</th>
				<th>금액</th>
				
			</tr>
			
		</table>
	</form>
	
	
				<%-- <c:choose>
					<c:if test="">
						<th>삭제</th>
					</c:if>
				</c:choose> --%>
</body>
</html>