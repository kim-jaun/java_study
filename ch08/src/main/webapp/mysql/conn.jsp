<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://127.0.0.1:3306/test?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,"root","mysql");
	if (conn != null) out.println("연결 성공!");
	else out.println("연결 실패");
	conn.close();
%>
</body>
</html>