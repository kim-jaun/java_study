<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
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
	String sql = "insert into dept values(?, ?, ?)";
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	try { 
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, "root", "mysql");
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, deptno);
		pstmt.setString(2, dname);
		pstmt.setString(3, loc);
		int result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
%>
	<script type="text/javascript">
		alert("부서정보가 입력 되었습니다");
		location.href = "select.jsp";
	</script>
<% 	} catch(Exception e) { %>
	<script type="text/javascript">
		alert("부서코드가 중복됐습니다 다시 입력하세요");
		history.go(-1);
	</script>
<%	} %>
</body>
</html>