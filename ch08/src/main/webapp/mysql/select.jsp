<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,ch08.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	List<Dept> list = new ArrayList<>();
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://127.0.0.1:3306/test?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
	String sql = "select * from dept order by deptno";
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, "root","mysql");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		Dept dept = new Dept();
		dept.setDeptno(rs.getInt("deptno"));
		dept.setDname(rs.getString("dname"));
		dept.setLoc(rs.getString("loc"));
		list.add(dept);
	}
	request.setAttribute("list", list);
	rs.close();
	stmt.close();
	conn.close();
%>
	<jsp:forward page="select_result.jsp"></jsp:forward>
</body>
</html>