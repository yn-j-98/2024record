package model.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JDBCUtil {
	private static final String driverName="oracle.jdbc.driver.OracleDriver";
	private static final String url="jdbc:oracle:thin:@localhost:1521:xe";
	private static final String userName="YENA"; 
	private static final String password="1234";
	
	public static Connection connect() {
		Connection conn=null;
		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패");
		}
		
		try {
			conn=DriverManager.getConnection(url, userName, password);
		} catch (SQLException e) {
			System.out.println("conn 연결 실패");
		}
		return conn;
	}
	
	public static void disconnect(Connection conn, PreparedStatement pstmt) {
		try {
			pstmt.close();
			conn.close();	
		} catch (SQLException e) {
			System.out.println("연결 해제 실패");
		}		
	}
}
