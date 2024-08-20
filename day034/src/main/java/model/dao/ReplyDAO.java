package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.JDBCUtil;
import model.dto.ReplyDTO;

public class ReplyDAO {
	//private final String SELECTALL="SELECT R.RID, R.CONTENT, R.WRITER FROM REPLY R JOIN BOARD B ON R.BID = B.BID WHERE R.BID = ?";
	private final String SELECTALL = "SELECT R.RID,R.BID,R.CONTENT,M.NAME FROM REPLY R JOIN BOARD B ON R.BID=B.BID JOIN MEMBER M ON R.WRITER=M.MID WHERE R.BID=?";

	public ArrayList<ReplyDTO> selectAll(ReplyDTO replyDTO){
		
		// ReplyDTO 객체를 담을 ArrayList 생성
		ArrayList<ReplyDTO> datas=new ArrayList<ReplyDTO>();

		// DB 연결
		Connection conn=JDBCUtil.connect();
		PreparedStatement pstmt=null;

		try {
			// SQL 쿼리 준비
			pstmt=conn.prepareStatement(SELECTALL);
			// 댓글 목록을 조회할 게시글 ID 설정
			pstmt.setInt(1,replyDTO.getBid()); 
			// 쿼리를 실행하고 결과를 ResultSet으로 받음
			ResultSet rs = pstmt.executeQuery();
			
			// ResultSet에서 데이터를 읽어와서 ArrayList에 추가
			while(rs.next()) {
				// 새로운 ReplyDTO 객체 생성
				ReplyDTO data=new ReplyDTO();
				// ResultSet에서 BID 값을 읽어와서 ReplyDTO 객체에 설정
				data.setBid(rs.getInt("BID"));
				// ResultSet에서 CONTENT 값을 읽어와서 ReplyDTO 객체에 설정
				data.setContent(rs.getString("CONTENT"));
				// ResultSet에서 RID 값을 읽어와서 ReplyDTO 객체에 설정
				data.setRid(rs.getInt("RID"));
				// ResultSet에서 NAME 값을 읽어와서 ReplyDTO 객체에 설정
				data.setWriter(rs.getString("NAME"));
				//ArrayList에 댓글 정보를 추가
				datas.add(data); 
			}
		} catch (SQLException e) {
			System.out.println("SQL문 실패");
		}
		
		JDBCUtil.disconnect(conn, pstmt);
		//결과로 담긴 댓글 목록을 반환
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
