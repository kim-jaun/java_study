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
	<form action="ome_result.jsp">
		<table>
			<caption>오늘의 메뉴</caption>
			<tr>
				<th>메뉴 선택</th>
				<td>
					<select name="menu" multiple size="6">
						<option>떡라면</option>
						<option>짬뽕</option>
						<option>치즈라면</option>
						<option>만두라면</option>
						<option>김치라면</option>
						<option>군라면</option>
					</select>
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