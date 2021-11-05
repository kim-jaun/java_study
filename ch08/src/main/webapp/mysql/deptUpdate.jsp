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
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://127.0.0.1:3306/test?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
	String sql = "update dept set dname=?, loc=? where deptno=?";
	try {
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, "root", "mysql");
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dname);
		pstmt.setString(2, loc);
		pstmt.setInt(3, deptno);
		int result = pstmt.executeUpdate();
		if(result > 0){
%>
		<script type="text/javascript">
			alert("대박 수정 성공");
			location.href = "select.jsp";
		</script>
<%		} else {
%>			
		<script type="text/javascript">
			alert("수정 실패");
			history.go(-1);
		</script>
<%		}
	}catch(Exception e) {
		System.out.println(e.getMessage());
%>
		<script type="text/javascript">
			alert("에러발생");
			history.go(-1);
		</script>
<%
	}
%>
</body>
</html>