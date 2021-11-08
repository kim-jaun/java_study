<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../common.css");</style>
</head>
<body>
	<form action="add_result.jsp">
		<table>
			<caption>이름과 주소</caption>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" required autofocus>
				</td>
			</tr>
			<tr>
			
				<th>주소</th>
				<td>
					<input type="text" name="addr" required>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="확인">
				</th>
			</tr>
		</table>
	</form>
</body>
</html>