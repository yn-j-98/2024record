package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.JDBCUtil;
import model.dto.BoardDTO;
import model.dto.ReplyDTO;

public class ReplyDAO {
	private final String SELECTALL = "SELECT R.RID,R.BID,R.CONTENT,M.NAME FROM REPLY R JOIN BOARD B ON R.BID=B.BID JOIN MEMBER M ON R.WRITER=M.MID WHERE R.BID=?";
	
	public ArrayList<ReplyDTO> selectAll(ReplyDTO replyDTO){
		ArrayList<ReplyDTO> datas=new ArrayList<ReplyDTO>();
		
		Connection conn=JDBCUtil.connect();
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(SELECTALL);
			pstmt.setInt(1, replyDTO.getBid());
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				ReplyDTO data=new ReplyDTO();
				data.setBid(rs.getInt("BID"));
				data.setContent(rs.getString("CONTENT"));
				data.setRid(rs.getInt("RID"));
				data.setWriter(rs.getString("NAME"));
				datas.add(data);
			}
		} catch (SQLException e) {
			System.out.println("SQL문 실패");
		}
		JDBCUtil.disconnect(pstmt,conn);
		
		return datas;
	}
	public ReplyDTO selectOne(ReplyDTO replyDTO){
		ReplyDTO data=null;
		
		return data;
	}
	public boolean insert(ReplyDTO replyDTO) {
		return false;
	}
	public boolean update(ReplyDTO replyDTO) {
		return false;
	}
	public boolean delete(ReplyDTO replyDTO) {
		return false;
	}
}
