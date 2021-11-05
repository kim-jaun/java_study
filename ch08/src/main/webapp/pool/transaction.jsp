<%@page import="javax.naming.*,javax.sql.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	String sql = "insert into dept values(27,'울보팀','대구')";
	Context ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	Connection conn = ds.getConnection();
	conn.setAutoCommit(false); // default true, 여러 테이블에 수정/삭제/입력이 있을 사용
	PreparedStatement pstmt = conn.prepareStatement(sql);
	int result = pstmt.executeUpdate();
	if (result > 0) {
		out.println("입력 성공");
		conn.commit();
	} else {
		out.println("입력 실패");
		conn.rollback();
	}
	conn.setAutoCommit(true);
	pstmt.close(); conn.close();
%>
</body>
</html>