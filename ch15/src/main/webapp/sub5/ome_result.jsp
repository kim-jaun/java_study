<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>오늘의 메뉴</h2>
<%
	String[] menu = request.getParameterValues("menu");
	if (menu == null) {
		out.println("메뉴가 없습니다.");
	} else {
		for(String m : menu) {
			out.println(m + "<br>"); // 메뉴 출력할 때 : 맛있어
		}
	}
%>
</body>
</html>