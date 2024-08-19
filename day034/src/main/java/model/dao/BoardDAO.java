package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.JDBCUtil;
import model.dto.BoardDTO;

public class BoardDAO {
	private final String SELECTALL = "SELECT B.TITLE,M.NAME,B.REGTIME FROM BOARD B JOIN MEMBER M ON B.WRITER=M.MID";
	
	public ArrayList<BoardDTO> selectAll(BoardDTO boardDTO){
		ArrayList<BoardDTO> datas=new ArrayList<BoardDTO>();
		
		Connection conn=JDBCUtil.connect();
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(SELECTALL);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO data=new BoardDTO();
				data.setTitle(rs.getString("TITLE"));
				data.setWriter(rs.getString("NAME"));
				data.setRegtime(rs.getString("REGTIME"));
				datas.add(data);
			}
		} catch (SQLException e) {
			System.out.println("SQL문 실패");
		}
		JDBCUtil.disconnect(pstmt,conn);

		return datas;
	}
	public BoardDTO selectOne(BoardDTO boardDTO){
		BoardDTO data=null;
		
		return data;
	}
	public boolean insert(BoardDTO boardDTO) {
		return false;
	}
	public boolean update(BoardDTO boardDTO) {
		return false;
	}
	public boolean delete(BoardDTO boardDTO) {
		return false;
	}
}
