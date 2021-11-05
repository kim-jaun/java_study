package ch16;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.*;

public class DeptDao {
	// singleton
	private static DeptDao instance = new DeptDao();
	private DeptDao() {}
	public static DeptDao getInstance() {
		return instance;
	}
	// database Connection pool
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println("연결 에러 : " + e.getMessage());
		}
		return conn;
	}
	public List<Dept> list() {
		List<Dept> list = new ArrayList<Dept>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from dept order by deptno";
		Connection conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Dept dept = new Dept();
				dept.setDeptno(rs.getInt(1)); //deptno
				dept.setDname(rs.getString(2));
				dept.setLoc(rs.getString(3));
				
				list.add(dept);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}catch (Exception e) {	}
		}
		return list;
	}
}
