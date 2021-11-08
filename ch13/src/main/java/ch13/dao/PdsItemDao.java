package ch13.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class PdsItemDao {
	// singleton
	private static PdsItemDao instance = new PdsItemDao();
	private PdsItemDao() {}
	public static PdsItemDao getInstance() {
		return instance;
	}
	// Database COnnection Pool
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch (Exception e) {
			System.out.println("연결에러 : "+e.getMessage());
		}
		return conn;
	}
	public int insert(PdsItem pi) {
		int result = 0;
		PreparedStatement pstmt = null;
		Connection conn = getConnection();
//	pds_seq.nextval 저동으로 1씩 증가
		String sql = "insert into pds_item values(pds_seq.nextval,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pi.getFileName());
			pstmt.setInt(2, pi.getFileSize());
			pstmt.setString(3, pi.getDescription());
			
			result = pstmt.executeUpdate();
		}catch (Exception e) {	System.out.println(e.getMessage());
		}finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}catch (Exception e) {		}
		}
		return result;
	}
	public List<PdsItem> list() {
		List<PdsItem> list = new ArrayList<PdsItem>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = getConnection();
		String sql = "select * from pds_item order by id desc";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PdsItem pi = new PdsItem();
				pi.setId(rs.getInt("id"));
				pi.setFileName(rs.getString("fileName"));
				pi.setFileSize(rs.getInt("fileSize"));
				pi.setDescription(rs.getString("description"));
				
				list.add(pi);
			}
		}catch (Exception e) {	System.out.println(e.getMessage());
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}catch (Exception e) {		}
		}
		return list;
	}
}