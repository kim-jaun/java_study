package ch08;
import java.sql.*;
import javax.naming.*;
import javax.sql.DataSource;
public class TestCall {
	private int empno;
	public void setEmpno(int empno) { 	this.empno = empno;	}
	public String call() throws Exception {
		String sql = "{?=call employ_ename(?)}";
		// Database Connection pool을 이용한 DB연결
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");	 	
		Connection conn = ds.getConnection();
		// function 사용하기 위한 준비
		CallableStatement cs = conn.prepareCall(sql);
		cs.registerOutParameter(1, Types.VARCHAR); // function 실행한 후에 반환된 값 설정
		cs.setInt(2, empno); // function 사번 넣기
		cs.execute();  // function 실행
		String result = cs.getString(1); // 반환된 값 가져오기
		cs.close(); conn.close();
		return result;
	}
}