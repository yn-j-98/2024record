package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.JDBCUtil;
import model.dto.MemberDTO;

public class MemberDAO {
	private final String LOGIN="SELECT MID,PASSWORD FROM MEMBER WHERE MID=? AND PASSWORD=?"; 
	private final String INSERT="INSERT INTO MEMBER (MID,PASSWORD,NAME) VALUES(?,?,?)";

	public ArrayList<MemberDTO> selectAll(MemberDTO memberDTO){
		ArrayList<MemberDTO> datas=new ArrayList<MemberDTO>();

		return datas;
	}
	public MemberDTO selectOne(MemberDTO memberDTO){
		MemberDTO data=null;

		Connection conn=JDBCUtil.connect();
		PreparedStatement pstmt=null;

		try {
			pstmt=conn.prepareStatement(LOGIN);
			pstmt.setString(1, memberDTO.getMid());
			pstmt.setString(2, memberDTO.getPassword());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				data=new MemberDTO();
				data.setMid(rs.getString("MID"));
				data.setName(rs.getString("PASSWORD"));
			}
		} catch (SQLException e) {
			System.out.println("SQL문 실패");
		}

		JDBCUtil.disconnect(conn,pstmt);

		return data;
	}
	public boolean insert(MemberDTO memberDTO) {

		Connection conn=JDBCUtil.connect();
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(INSERT); // 회원가입
			pstmt.setString(1, memberDTO.getMid()); 
			pstmt.setString(2, memberDTO.getPassword());
			pstmt.setString(3, memberDTO.getName());

			int res = pstmt.executeUpdate();
			if(res<=0) {
				return false;
			}
		} catch (SQLException e) {
			System.out.println("SQL문 실패");
			return false;
		} finally {
			JDBCUtil.disconnect(conn,pstmt);
		}
		return true;
	}
	public boolean update(MemberDTO memberDTO) {
		return false;
	}
	public boolean delete(MemberDTO memberDTO) {
		return false;
	}
}
