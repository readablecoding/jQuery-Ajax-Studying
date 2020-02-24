<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function() {

		//서버로 데이터를 변수를 전송
		$("#btn1").click(function(){	//아이디가 btn1인 버튼을 클릭했을 때 실행되는 것
			$.ajax({					//key : value로 구성됨
				url: "test1",			//url은 서버에 보내는 요청 주소
				type: "get",			//type은 데이터 전송 방식, get과 post가 있다.
				data: {"id" : $("#userid").val(), "name" : $("#username").val()}, //서버에 전송할 데이터, 자바스크립트의 object타입
				success: function() {alert("성공");}, //success는 서버에 전송하고 통신이 성공했을 때 여기에 있는 function이 실행됨
				error: function() {alert("실패");}	//error는 문제 발생시 여기에 있는 function이 실행됨
			});
		});

		//서버로 데이터를 VO 객체로  전송 
		$("#btn2").click(function(){	//아이디가 btn2인 버튼을 클릭했을 때 실행되는 것
			$.ajax({					//key : value로 구성됨
				url: "test2",			//url은 서버에 보내는 요청 주소
				type: "post",			//type은 데이터 전송 방식, get과 post가 있다.
				data: {"id" : $("#userid").val(), "name" : $("#username").val()}, //서버에 전송할 데이터, 자바스크립트의 object타입 데이터
				success: function() {alert("성공");}, //success는 서버에 전송하고 통신이 성공했을 때 여기에 있는 function이 실행됨
				error: function() {alert("실패");}	//error는 서버나 화면에 문제 발생시 여기에 있는 function이 실행됨
			});
		});

		//서버로 데이터를 JSON타입으로 전송
		$("#btn3").click(function(){	//아이디가 btn3인 버튼을 클릭했을 때 실행되는 것
			$.ajax({					//key : value로 구성됨
				url: "test3",			//url은 서버에 보내는 요청 주소
				type: "post",			//type은 데이터 전송 방식, get과 post가 있다. JSON타입은 post로 보내기
				contentType: "application/json; charset=utf-8", //JSON은 보낼 때 json을 적어야 하고 utf-8로 보내야 글자가 깨지지 않는다.
				data: JSON.stringify({"id" : $("#userid").val(), "name" : $("#username").val()}), 
				//data는 서버에 전송할 데이터, 자바스크립트의 object타입 데이터, JSON.stringify은 매개변수로 전달받은 오브젝트 타입데이터를 JSON타입으로 변환해주는 것
				success: function() {alert("성공");}, //success는 서버에 전송하고 통신이 성공했을 때 여기에 있는 function이 실행됨
				error: function() {alert("실패");}	//error는 서버나 화면에 문제 발생시 여기에 있는 function이 실행됨
			});
		});

		//btn1부터 btn3까지는 JSON타입으로 데이터를 하나하나 보낸 것이다.

		//서버로 데이터를 폼 태그로 전송
		$("#btn4").click(function(){	//아이디가 btn4인 버튼을 클릭했을 때 실행되는 것
			$.ajax({					//key : value로 구성됨
				url: "test4",			//url은 서버에 보내는 요청 주소
				type: "post",			//type은 데이터 전송 방식, get과 post가 있다. JSON타입은 post로 보내기
				data: $("#test4").serialize(), //폼 태그 자체를 문서객체로 가져와 serialize()를 통해 
				success: function() {alert("성공");}, //success는 서버에 전송하고 통신이 성공했을 때 여기에 있는 function이 실행됨
				error: function() {alert("실패");}	//error는 서버나 화면에 문제 발생시 여기에 있는 function이 실행됨
			});
		});

		//서버에서 데이터를 받는 것
		$("#btn5").click(function(){	//아이디가 btn5인 버튼을 클릭했을 때 실행되는 것
			$.ajax({					//key : value로 구성됨
				url: "test5",			//url은 서버에 보내는 요청 주소
				type: "post",			//type은 데이터 전송 방식, get과 post가 있다. JSON타입은 post로 보내기
				dataType: "json", //서버에서 전달받는 데이터 타입, json타입으로 전달받을 것이다.
				data: $("#test5").serialize(), //폼 태그 자체를 문서객체로 가져와 serialize()를 통해 
				success: function(result) { //ArrayList가 배열 형태로 jsp로 전달
					console.log(result); 
					$(result).each(function(index, item){
						$("table").append("<tr><td>"+item.id+"</td><td>"+item.name+"</td></tr>");  
					}); //jQuery 문서객체로 변환
				}, // result라는 변수에 ArrayList 값이 들어오게 된다.
				error: function() {alert("실패");}	//error는 서버나 화면에 문제 발생시 여기에 있는 function이 실행됨
			}); //$.ajax 끝 부분
		});

		//서버에서 HashMap형태로 가져오기
		$("#btn6").click(function(){	//아이디가 btn6인 버튼을 클릭했을 때 실행되는 것
			$.ajax({					//key : value로 구성됨
				url: "test6",			//url은 서버에 보내는 요청 주소
				type: "post",			//type은 데이터 전송 방식, get과 post가 있다. JSON타입은 post로 보내기
				dataType: "json", //서버에서 전달받는 데이터 타입, json타입으로 전달받을 것이다.		
				success: function(result) { //ArrayList가 배열 형태로 jsp로 전달
					$(result.list).each(function(index, item){ 	//$(result.list)을 통해HashMap에서 list를 뽑아낸다.
						var temp = "<tr>";
						temp += "<td>" + item.id + "</td>";
						temp += "<td>" + item.name + "</td>";
						temp += "</tr>";
						$("table").append(temp); ////$를 붙여 jQuery 문서객체로 변환
					});
				}, 			 
				error: function() {alert("실패");}	//error는 서버나 화면에 문제 발생시 여기에 있는 function이 실행됨
			}); //$.ajax 끝 부분
		});

		//서버로 파일 전송
		$("#btn7").click(function(){	//아이디가 btn7인 버튼을 클릭했을 때 실행되는 것
			//var form = document.getElementById("test4");와 같다
			
			var form = $("#test4")[0]; //자바스크립트 문서 객체, jQuery로 가져올 때는 배열형식이므로 하나만 있더라도 [0]로 쓴다.
			var formdata = new FormData(form); //FormData 객체 생성시 자바스크립트 문서 객체를 받음. form태그에 작업이 된다. 
			//FormData에 키는 name의 값, 밸류는 들어있는 값
			
			$.ajax({					//key : value로 구성됨
				url: "test7",			//url은 서버에 보내는 요청 주소
				type: "post",			//type은 데이터 전송 방식, get과 post가 있다. 파일 전송은 post 타입
				data: formdata,
				contentType : false,	//enctype="multipart/formdata"을 폼 태그에 적은 것과 같은 효과
				processData : false,	//false로 안 하면 서버에 보내는 내용물을 문자열로 변환한다. 첨부파일은 문자열로 변환하지 말고 날 것 그대로 하기 위해 false로
				success: function() {alert("성공") 				
				}, 			 
				error: function() {alert("실패");}	//error는 서버나 화면에 문제 발생시 여기에 있는 function이 실행됨
			}); 
			
		});
			
	});
</script>
</head>
<body>
	
	<form id="test4">
		ID : <input type="text" name="id" id="userid"><br/>
		PW : <input type="text" name="name" id="username"><br/>
		<input type="file" name="uploadFile">
	</form>
	
	
	<input type="button" id="btn1" value="전송1"><br/>
	<input type="button" id="btn2" value="전송2"><br/>
	<input type="button" id="btn3" value="전송3"><br/>
	<input type="button" id="btn4" value="전송4"><br/>
	<input type="button" id="btn5" value="전송5"><br/>
	<input type="button" id="btn6" value="전송6"><br/>
	<input type="button" id="btn7" value="전송7"><br/>
	
	<div>
		<table border="1">
			<tr>
				<th>ID</th>
				<th>NAME</th>
			</tr>
			
		</table>
	</div>
	<a href="/ajaxtest/getListForm" >ajax로 게시판 만들기</a>
	
</body>
</html>
