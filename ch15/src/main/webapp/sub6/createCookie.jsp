<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Cookie cook = new Cookie("id", "kildong");
		response.addCookie(cook);
	%>
	<h2>쿠키가 생성 되었습니다.</h2>
	<button onclick="location.href='cook_use.jsp'">쿠키 값 보기</button>
</body>
</html>