<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*,java.io.*" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	String id = request.getParameter("id");
	String sql = "select photo from test where id=?";
	Context ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	Connection conn = ds.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	Blob blob = rs.getBlob("photo");
	// 내장변수 out충돌 방지
	out.clear();
	out = pageContext.pushBody();
	// response.getOutputStream()) 요청한 blobView.jsp응답
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	InputStream is = blob.getBinaryStream();
	int length = (int)blob.length();
	byte[] buffer = new byte[length];
	// -1 더이상 데이터 없다
	while((length=is.read(buffer)) != -1) {
		bos.write(buffer);
	}
	bos.close(); is.close(); pstmt.close(); conn.close();
%>
</body>
</html>