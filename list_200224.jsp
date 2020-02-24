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
		$.ajax({
			url: "test5",
			type: "post",
			dataType: "json",
			success: function(result){
				$(result).each(function(index, item){
					var temp = "<tr>";
					temp += "<td>" + item.id + "</td>";
					temp += "<td>" + item.name + "</td>";
					temp += "</tr>";
					$("table").append(temp);
				});
			},
			error: function(){alert("에러 발생");}		
		});
	});
</script>
</head>
<body>
	
	<div>
		<table border="1">
			<tr>
				<th>ID</th>
				<th>NAME</th>
			</tr>
			
		</table>
	</div>
	
	
</body>
</html>
