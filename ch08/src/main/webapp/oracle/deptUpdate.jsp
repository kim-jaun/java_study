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
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String sql = "update dept set dname=?, loc=? where deptno=?";
	try {
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, "scott", "tiger");
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dname);
		pstmt.setString(2, loc);
		pstmt.setInt(3, deptno);
		int result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		if(result > 0) {
%>		
		<script type="text/javascript">
			alert("수정 성공");
			location.href = "select/jsp";
		</script>
<%		} else { %>
		<script type="text/javascript">
			alert("수정 실패");
			history.ho(-1);
		</script>
<%		}
	} catch(Exception e) { %>
		<script type="text/javascript">
			alert("수정 실패");
			history.go(-1);
		</script>
<% 	} %>
</body>
</html>