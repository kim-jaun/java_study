<%@page import="java.io.*"%>
<%@page import="javax.naming.*,javax.sql.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	String sql = "insert into test values('a2',?)";
	String real = application.getRealPath("/pool/ioi.jpg");
	File file = new File(real);
	InputStream is = new FileInputStream(file);
	int fileSize = (int)file.length();
	Context ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setBinaryStream(1, is, fileSize);
	int result = pstmt.executeUpdate();
	is.close(); pstmt.close(); conn.close();
	if (result > 0) out.println("입력 성공");
	else out.println("입력 실패");
%>
</body>
</html>