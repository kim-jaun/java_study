<%@page import="ch08.TestCall"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	TestCall tc = new TestCall();
	tc.setEmpno(7369);
	String result = tc.call();
%>
이름 : <%=result %>
</body>
</html>