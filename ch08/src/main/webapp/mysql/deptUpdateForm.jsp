<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,ch08.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../common.css");</style>
</head>
<body>
<%
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://127.0.0.1:3306/test?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String sql = "select * from dept where deptno=?";
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, "root", "mysql");
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, deptno);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	Dept dept = new Dept();
	dept.setDeptno(deptno);
	dept.setDname(rs.getString("dname"));
	dept.setLoc(rs.getString("loc"));
	pageContext.setAttribute("dept", dept);
	rs.close();
	pstmt.close();
	conn.close();
%>
	<form action="daptUpdate.jsp">
		<table>
			<caption>부서정보 수정</caption>
			<tr>
				<th>부서코드</th>
				<td>
					<input type="number" name="deptno" valud="${dept.deptno }" readonly>
				</td>
			</tr>
			<tr>
				<th>부서명</th>
				<td>
					<input type="text" name="dname" value="${dept.dname }" required autofocus>
				</td>
			</tr>
			<tr>
				<th>근무지</th>
				<td>
					<input type="text" name="loc" value="${dept.loc }" required>
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