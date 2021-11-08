<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../common.css");</style>
</head>
<body>
	<table>
		<caption>자료실 목록</caption>
		<tr>
			<th>번호</th>
			<th>파일명</th>
			<th>설명</th>
			<th>보기</th>
		</tr>
		<c:forEach var="pds" items="${list }">
			<tr>
				<td>${pds.id }</td>
				<td>${pds.fileName }</td>
				<td>${pds.fileSize }</td>
				<td>${pds.description }</td>
				<td>
					<a href="../upload/${pds.fileName }">확인</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>