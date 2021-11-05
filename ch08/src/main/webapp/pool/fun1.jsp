<%@page import="javax.naming.*,javax.sql.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%	String sql = "{?=call employ_ename(?)}"; // function은  '?='추가
	Context ctx = new InitialContext();
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");	
	Connection conn = ds.getConnection();
	CallableStatement cs = conn.prepareCall(sql);
	cs.registerOutParameter(1, Types.VARCHAR);
	cs.setInt(2, 7566);
	cs.execute();
	out.println("이름 : "+cs.getString(1));
	cs.close(); conn.close();
%>
</body>
</html>