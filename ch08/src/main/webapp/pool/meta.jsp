<%@page import="javax.naming.*,javax.sql.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	String sql = "select * from emp";
	Context ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	// 컬럼이름을 모를 때 사용, 컬럼명, 데이터 타입등 table에 정보
	ResultSetMetaData rsmd = rs.getMetaData();
	// rsmd.getColumnCount() 컬럼의 갯수
	for(int i = 1; i <= rsmd.getColumnCount(); i++) {
		out.println(i+"번째 컬럼 : "+rsmd.getColumnName(i)+"<br>");
		out.println(i+"번째 컬럼타입 : "+rsmd.getColumnTypeName(i)+"<p>");
	}
	rs.close(); pstmt.close(); conn.close();
%>
</body>
</html>