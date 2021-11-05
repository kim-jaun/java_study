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
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String sql = "delete from dept where deptno=?";
	try {
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, "scott", "tiger");
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, deptno);
		int result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		if (result > 0){
%>
		<script type="text/javascript">
			alert("삭제 완료");
			location.href = "select.jsp";
		</script>
<%
		} else {
%>
		<script type="text/javascript">
			alert("삭제 실패");
			history.go(-1);
		</script>
<%		
		}
	 }catch(Exception e) {
%>		
		<script type="text/javascript">
			alert("삭제 실패");
			history.go(-1);
		</script> 
<%
	 }
%>
</body>
</html>