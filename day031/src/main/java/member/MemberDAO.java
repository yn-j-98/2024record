package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.JDBCUtil;

public class MemberDAO {
	private final String SELECTALL="";
	private final String SELECTONE_LOGIN="SELECT MID,PASSWORD,NAME,ROLE FROM MEMBER WHERE MID=? AND PASSWORD=?";
	private final String SELECTONE_NAME="SELECT MID,PASSWORD,NAME,ROLE FROM MEMBER WHERE MID=?";
	private final String INSERT="INSERT INTO MEMBER VALUES(?,?,?,'USER')";
	private final String UPDATE="UPDATE MEMBER SET NAME=? WHERE MID=?";
	private final String DELETE="DELETE FROM MEMBER WHERE MID=?";

	private ArrayList<MemberDTO> selectAll(MemberDTO memberDTO){
		ArrayList<MemberDTO> datas=new ArrayList<MemberDTO>();

		return datas;
	}
	public MemberDTO selectOne(MemberDTO memberDTO){
		MemberDTO data=null;

		Connection conn=JDBCUtil.connect();
		PreparedStatement pstmt=null;

		try {
			if(memberDTO.getSearchKeyword().equals("LOGIN")) {
				pstmt=conn.prepareStatement(SELECTONE_LOGIN);
				pstmt.setString(1, memberDTO.getMid());
				pstmt.setString(2, memberDTO.getPassword());
			}
			else if(memberDTO.getSearchKeyword().equals("NAME")) {
				pstmt=conn.prepareStatement(SELECTONE_NAME);
				pstmt.setString(1, memberDTO.getMid());
			}
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				data=new MemberDTO();
				data.setMid(rs.getString("MID"));
				data.setName(rs.getString("NAME"));
				data.setPassword(rs.getString("PASSWORD"));
				data.setRole(rs.getString("ROLE"));
			}
		} catch (SQLException e) {
			System.out.println("SQL문 실패");
		}

		JDBCUtil.disconnect(conn,pstmt);

		return data;
	}
	public boolean insert(MemberDTO memberDTO){
		Connection conn=JDBCUtil.connect();
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(INSERT);
			pstmt.setString(1, memberDTO.getMid());
			pstmt.setString(2, memberDTO.getPassword());
			pstmt.setString(3, memberDTO.getName());
			int result=pstmt.executeUpdate();
			if(result<=0) {
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
	public boolean update(MemberDTO memberDTO){
		Connection conn=JDBCUtil.connect();
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(UPDATE);
			pstmt.setString(1, memberDTO.getName());
			pstmt.setString(2, memberDTO.getMid());
			int result=pstmt.executeUpdate();
			if(result<=0) {
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
	public boolean delete(MemberDTO memberDTO){
		Connection conn=JDBCUtil.connect();
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(DELETE);
			pstmt.setString(1, memberDTO.getMid());
			int result=pstmt.executeUpdate();
			if(result<=0) {
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
}
