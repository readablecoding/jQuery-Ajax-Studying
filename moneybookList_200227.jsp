<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todoList</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/moneybook.css"/>" />
<script src='<c:url value="/js/jquery-3.4.1.js" />'></script>
<script>
	$(function(){

		//날짜 선택 변경시, 타입 변경시 이벤트를 걸어 리스트 뽑아내기: 
		$("[type=date]").on("change", printList);
		$("select").on("change", printList);

		//가계부 리스트
		//타입과 날짜를 보내 그에 해당하는 데이터를 서버에 전달한다. select태그의 값, input태그 type이 date인 것의 값
		//성공하면 서버에서 select문으로 뽑아온 것을 result v 라는 변수가 가진다.
		function printList(){
			$.ajax({
				url: "list", //요청 주소
				type: "get", //요청 방식
				data: {"type": $("select").val(), "inputdate": $("[type=date]").val()}, //서버에 보내는 데이터 2가지(타입, 날짜)
				success: function(result){	//result라는 변수 안에 list가 들어있게 된다.
					var output = "";
					output += "<tr>";
					output += "<th>메모</th>";
					output += "<th>금액</th>";
					output += "<th>삭제</th>";
					output += "<th></th>";
					output += "</tr>";		//문자열 연결시키기

					//리스트 갖고 있는 변수인 result에서 값 중 memo, amount, infonum을 화면에 뿌림, vo개수 만큼 반복
					$(result).each(function(index, item){ 
						output += "<tr>";
						output += "<td class='center'>" + item.memo + "</td>";
						output += "<td class='center'>" + item.amount + "</td>";
						output += "<td class='center'><input type='radio' name='remove' value='"+ item.infonum + "'></td>";
						output += "</tr>";			
					});

					$("#printTable").html(output); //아이디가 printTalbe이라는 태그에 문자열을 갖다 붙임
				},
				error: function(){alert("실패");}
			});
		}

		//가계부 삭제
		$("#removeBtn").on("click", function(){
			var infonum = $(":radio:checked").val(); //라디오 버튼 중 체크된 것의 값

			//라디오 버튼이 체크가 안된 것은 undefined이다.
			if(infonum == undefined){
				alert("삭제할 항목을 선택해주세요");
				return;
			}

			//ajax를 통해 삭제 요청을 서버로 보내기, 삭제를 하고 나서 다시 리스트를 뿌리는 것
			$.ajax({
				url: "remove",
				type: "get",
				data: {"infonum" : infonum},
				success: printList,
				error: function(){alert("에러 발생");}
			});
		});
		
		//가계부 등록
		$("#writeBtn").on("click", function(){

			//유효성 검사
			var memo = $("#memo").val();
			var amount = $("#amount").val();
			var inputdate = $("[type=date]").val();

			if(inputdate == ""){
				alert("날짜를 입력하세요");
				return false;
			}

			if(memo == ""){
				alert("메모를 입력하세요");
				return false;
			}

			if(amount == ""){
				alert("금액을 입력하세요");
				return false;
			}

			if(isNaN(Number(amount))){	//isNan은 숫자가 아니면 true를 반환, Number(amount))은 amount를 숫자로 변환하는 것
				alert("숫자를 입력하세요");
				return false;
			}

			//유효성 검사를 통과하면 서버에 데이터를 보낸다.
			//서버에 데이터 전달하기. 폼 태그 자체를 serialize라는 함수를 통해 한꺼번에 서버에 데이터 전송
			$.ajax({
				url: "write",
				type: "get",
				data: $("#inputForm").serialize(),
				success: printList,  //호출하고 싶은 함수의 이름만 적는다. ()을 쓰지 않는다.
				error: function(){alert("데이터 전달 실패");}
			});
	
		});			
	});
</script>
</head>
<body>
<div id="wrap">
	<div>
		<div class="menu">
			<form id="inputForm">
				<table>
					<tr>
						<td class="center">
							<select name="type">
								<option value="수입" selected="selected">수입</option>
								<option value="지출">지출</option>
							</select>
							<input type="date" name="inputdate">
						</td>
					</tr>
					<tr>
						<th class="center">메모</th>
						<th class="center">금액</th>
					</tr>
					<tr>
						<td class="center">
							<input type="text" placeholder="내용 입력" id="memo" name="memo"><br>
						</td>
						<td class="center">
							<input type="text" placeholder="금액 입력" id="amount" name="amount"><br>
						</td>
						<td>
							<input type="button" value="등록" id="writeBtn">
						</td>
						<td>
							<input type="button" value="삭제" id="removeBtn">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div> <!-- input form end -->
	<hr>
	<div> <!-- print form -->
		<table id="printTable">
			<tr>
				<th>메모</th>
				<th>금액</th>
				<th></th>
			</tr>
		</table>
		
	</div>
</div>
</body>
</html>
