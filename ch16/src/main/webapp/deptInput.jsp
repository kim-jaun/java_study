<%@page import="ch16.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("common.css");</style>
</head>
<body>
<%
	DeptDao dd = DeptDao.getInstance();
	List<Dept> list = dd.list(); 
%>
	<!-- <form action="EmpInfo"> -->
	<!-- <form action="EmpXml"> -->
	<form action="EmpJson">
		<table>
			<caption>부서 선택</caption>
			<tr>
				<th>
					<select name="deptno">
						<option value="0">전체(0)</option>
						<% for(Dept dept:list) { %>
						<option value="<%=dept.getDeptno() %>">
							<%=dept.getDname() %>(<%=dept.getDeptno() %>)
						</option>
						<% }%>
					</select>
				</th>
			</tr>
			<tr>
				<th>
					<input type="submit" value="확인">
				</th>
			</tr>
		</table>
	</form>
</body>
</html>