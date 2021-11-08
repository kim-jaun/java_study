<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch13.service.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	IdChk ic = new IdChk();
	int result = ic.idChk(id, password); 
	if (result > 0) {
%>
<h2>메뉴</h2>
1. 환경보호<p>
2. 세계편화<p>
3. 국가발전
<%  } else { %>
<script type="text/javascript">
	alert("로그인 실패 꺼져 !!");
	history.go(-1);
</script>
<%  } %>
</body>
</html>