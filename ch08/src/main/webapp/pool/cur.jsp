<%@page import="javax.naming.*,javax.sql.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	String sql = "select * from emp";
	Context ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	Connection conn = ds.getConnection();
	// ResultSet.TYPE_SCROLL_SENSITIVE 데이터를 임의로 추출
	PreparedStatement pstmt = conn.prepareStatement(sql,
			ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	ResultSet rs = pstmt.executeQuery();
	rs.last(); // 마지막
	out.println(rs.getInt("empno")+", "+rs.getString("ename")+"<br>");
	rs.first(); // 첫번째
	out.println(rs.getInt("empno")+", "+rs.getString("ename")+"<br>");
	rs.absolute(3); // 3번째 데이터
	out.println(rs.getInt("empno")+", "+rs.getString("ename")+"<br>");
	rs.close(); pstmt.close(); conn.close();
%>
</body>
</html>