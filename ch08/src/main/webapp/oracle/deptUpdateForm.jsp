<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, ch08.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">@import url("../common.css");</style>
<title>Insert title here</title>
</head>
<body>
<%	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String sql = "select * from dept where deptno=?";
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,"scott","tiger");
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, deptno);
	ResultSet rs = pstmt.executeQuery();
	rs.next(); // 목록에서 넘어왔기 때문에 무조건 값이 존재
	Dept dept = new Dept();
	dept.setDeptno(deptno);
	dept.setDname(rs.getString("dname"));
	dept.setLoc(rs.getString("loc"));
	pageContext.setAttribute("dept", dept); // pageContext 현재 페이지에서만 사용
	rs.close(); pstmt.close(); conn.close();
%>
	<form action="deptUpdate.jsp">
	<!-- 	hidden에 사용하면 deptUpdate.jsp에 데이터 전달 -->
		<input type="hidden" name="deptno" value="${dept.deptno }">
		<table>
			<caption>부서정보 수정</caption>
			<tr>
				<th>부서코드</th>
				<td>${deptno }</td>
			</tr> <!-- 키는 수정 안함 -->
			<tr>
				<th>부서명</th>
				<td>
					<input type="text" name="dname" value="${dept.dname }"required autofocus>
				</td>
			</tr>
			<tr>
				<th>근무지</th>
				<td>
					<input type="text" name="loc" value="${dept.loc}"required>
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