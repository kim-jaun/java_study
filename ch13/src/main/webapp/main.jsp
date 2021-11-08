<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	header {
		height: 30px;
		background: pink;
	}
	article {
		height: 300px;
	}
</style>
</head>
<body>
	<c:if test="${empty param.pgm }">
		<c:set var="pgm" value="home.jsp"></c:set>
	</c:if>
	<c:if test="${not empty param.pgm }">
		<c:set var="pgm" value="${param.pgm }"></c:set>
	</c:if>
	<header>
		<jsp:include page="menu.jsp"></jsp:include>
	</header> 
	<article>
		<jsp:include page="${pgm}"></jsp:include>
	</article>
</body>
</html>