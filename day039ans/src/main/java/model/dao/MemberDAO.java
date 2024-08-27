package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.JDBCUtil;
import model.dto.MemberDTO;

public class MemberDAO {
	private final String SELECTONE_CHECKMID = "SELECT MID,NAME,IMAGEPATH FROM MEMBER WHERE MID=?";
	
	private final String INSERT="INSERT INTO MEMBER (MID,PASSWORD,NAME,IMAGEPATH) VALUES(?,?,?,?)";
	
	public ArrayList<MemberDTO> selectAll(MemberDTO memberDTO){
		ArrayList<MemberDTO> datas=new ArrayList<MemberDTO>();
		
		return datas;
	}
	public MemberDTO selectOne(MemberDTO memberDTO){
		MemberDTO data=null;
		
		Connection conn=JDBCUtil.connect();
		PreparedStatement pstmt=null;
		try {
			if(memberDTO.getCondition().equals("CHECKMID")) {
				pstmt=conn.prepareStatement(SELECTONE_CHECKMID);
				pstmt.setString(1, memberDTO.getMid());
				ResultSet rs=pstmt.executeQuery();
				if(rs.next()) {
					data=new MemberDTO();
					data.setMid(rs.getString("MID"));
					data.setName(rs.getString("NAME"));
					data.setImagepath(rs.getString("IMAGEPATH"));
				}
			}			
		} catch (SQLException e) {
			System.out.println("SQL문 실패");
		}
		JDBCUtil.disconnect(pstmt,conn);
		
		return data;
	}
	public boolean insert(MemberDTO memberDTO) {
		Connection conn=JDBCUtil.connect();
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(INSERT);
			pstmt.setString(1, memberDTO.getMid());
			pstmt.setString(2, memberDTO.getPassword());
			pstmt.setString(3, memberDTO.getName());
			pstmt.setString(4, memberDTO.getImagepath());
			int result=pstmt.executeUpdate();
			if(result<=0) {
				return false;
			}
		} catch (SQLException e) {
			System.out.println("SQL문 실패");
			return false;
		}
		JDBCUtil.disconnect(pstmt,conn);
				
		return true;
	}
	public boolean update(MemberDTO memberDTO) {
		return false;
	}
	public boolean delete(MemberDTO memberDTO) {
		return false;
	}
}
