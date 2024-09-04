package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.JDBCUtil;
import model.dto.BoardDTO;

public class BoardDAO {
	private final String SELECTALL = "SELECT B.BID,B.TITLE,M.NAME,B.REGTIME FROM BOARD B JOIN MEMBER M ON B.WRITER=M.MID";
	private final String SELECTONE = "SELECT B.TITLE,B.CONTENT,M.NAME,B.CNT,B.REGTIME FROM BOARD B JOIN MEMBER M ON B.WRITER=M.MID WHERE B.BID=?";
	private final String INSERT = "INSERT INTO BOARD (BID,TITLE,CONTENT,WRITER) VALUES((SELECT NVL(MAX(BID),100)+1 FROM BOARD),'?','?','?');";
	public ArrayList<BoardDTO> selectAll(BoardDTO boardDTO){
		ArrayList<BoardDTO> datas=new ArrayList<BoardDTO>();
		
		Connection conn=JDBCUtil.connect();
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(SELECTALL);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO data=new BoardDTO();
				data.setBid(rs.getInt("BID"));
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
		
		Connection conn=JDBCUtil.connect();
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(SELECTONE);
			pstmt.setInt(1, boardDTO.getBid());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				data=new BoardDTO();
				data.setTitle(rs.getString("TITLE"));
				data.setContent(rs.getString("CONTENT"));
				data.setWriter(rs.getString("NAME"));
				data.setCnt(rs.getInt("CNT"));
				data.setRegtime(rs.getString("REGTIME"));
			}
		} catch (SQLException e) {
			System.out.println("SQL문 실패");
		}
		JDBCUtil.disconnect(pstmt,conn);
		
		return data;
	}
	public boolean insert(BoardDTO boardDTO) {
		Connection conn = JDBCUtil.connect();
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(INSERT);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public boolean update(BoardDTO boardDTO) {
		return false;
	}
	public boolean delete(BoardDTO boardDTO) {
		return false;
	}
}
