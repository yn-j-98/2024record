package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.common.JDBCUtil;
import model.dto.IDDTO;

public class IDDAO {
	private final String SELECTONE = "SELECT IDCHECK FROM CHECKID WHERE IDCHECK=?";
	
	public IDDTO selectone(IDDTO idDTO) {
		IDDTO data = null;
		
		Connection conn=JDBCUtil.connect();
		PreparedStatement pstmt=null;
		
		try {
			pstmt=conn.prepareStatement(SELECTONE);
			pstmt.setString(1, idDTO.getId());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				data = new IDDTO();
				data.setId(rs.getString("IDCHECK"));
			}
		} catch (SQLException e) {
			System.out.println("SQL문 실패...");
		}
		
		JDBCUtil.disconnect(conn,pstmt);
		
		return data;
	}

}
