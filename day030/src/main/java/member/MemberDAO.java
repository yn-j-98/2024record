package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.JDBCUtil;


public class MemberDAO {
	final String INSERT = "INSERT INTO MEMBER (MEMBER_ID,MEMBER_PASSWORD,MEMBER_NAME) VALUES(?,?,?)";
	final String UPDATE = "UPDATE MEMBER SET MEMBER_NAME=? WHERE MEMBER_ID =?";//변경할 열 = 변경할 데이터 데이터=null == 열 값 삭제
	final String DELETE = "DELETE FROM MEMBER WHERE MEMBER_ID=?";
	final String SELECTONE = "SELECT MEMBER_ID,MEMBER_PASSWORD,MEMBER_NAME,MEMBER_ROLE FROM MEMBER WHERE MEMBER_ID =?";
	final String SELECTALL = "SELECT MEMBER_ID,MEMBER_PASSWORD,MEMBER_NAME,MEMBER_ROLE FROM MEMBER";

	public boolean insert(MemberDTO memberDTO) {
		System.out.println("member.memberDAO insert 시작");
		// XxxUtil류는 객체 중요 x
		// 메서드 중요 O --->> 메서드를 클래스메서드화(static화 == 객체와 무관하게)
		Connection conn=JDBCUtil.connect();

		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(INSERT); //회원 가입
			pstmt.setString(1, memberDTO.getMember_id());
			pstmt.setString(2, memberDTO.getMember_password());
			pstmt.setString(3, memberDTO.getMember_name());
			int result = pstmt.executeUpdate();
			if(result <= 0) {
				System.err.println("(memberDAO.delete) insert 실패 변경된 행의 개수 0개");
				return false;
			}
		} catch (SQLException e) {
			System.err.println("(memberDAO.insert)[3]단계 실패 ...");
			return false;
		} finally {
			System.out.println("(memberDAO.insert) [3]단계 진행완료");
		}

		boolean flag=JDBCUtil.disconnect(conn, pstmt);
		System.out.println("member.memberDAO) insert 완료");
		return flag;
	}
	public boolean update(MemberDTO memberDTO) {
		System.out.println("member.memberDAO update 시작");
		Connection conn=JDBCUtil.connect();

		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(UPDATE);// 이름변경
			pstmt.setString(1, memberDTO.getMember_name());
			pstmt.setString(2, memberDTO.getMember_id());
			int result = pstmt.executeUpdate();
			if(result <= 0) {
				System.err.println("(memberDAO.delete) update 실패 변경된 행의 개수 0개");
				return false;
			}
		} catch (SQLException e) {
			System.err.println("(memberDAO.update) [3]단계 실패 ...");
			return false;
		} finally {
			System.out.println("(memberDAO.update) [3]단계 진행완료");
		}

		boolean flag=JDBCUtil.disconnect(conn, pstmt);
		System.out.println("member.memberDAO) update 완료");
		return flag;
	}
	public boolean delete(MemberDTO memberDTO) {
		System.out.println("member.memberDAO delete 시작");
		Connection conn=JDBCUtil.connect();

		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(DELETE);
			pstmt.setString(1, memberDTO.getMember_id());
			int result = pstmt.executeUpdate();
			if(result <= 0) {
				System.err.println("(memberDAO.delete) delete 실패 변경된 행의 개수 0개");
				return false;
			}
		} catch (SQLException e) {
			System.err.println("(memberDAO.delete) [3]단계 실패 ...");
			return false;
		} finally {
			System.out.println("(memberDAO.delete) [3]단계 진행완료");
		}
		boolean flag=JDBCUtil.disconnect(conn, pstmt);
		System.out.println("member.memberDAO) delete 완료");
		return flag;
	}
	private ArrayList<MemberDTO> selectAll(MemberDTO memberDTO) {
		System.out.println("member.memberDAO selectAll 시작");
		ArrayList<MemberDTO> datas = new ArrayList<MemberDTO>();
		Connection conn=JDBCUtil.connect();

		PreparedStatement pstmt=null;
		try {
				pstmt = conn.prepareStatement(SELECTALL);
				ResultSet rs=pstmt.executeQuery();
				if(rs.next()) {
					MemberDTO data=new MemberDTO();
					data.setMember_id((rs.getString("MEMBER_ID")));
					data.setMember_password((rs.getString("MEMBER_PASSWORD")));
					data.setMember_name((rs.getString("MEMBER_NAME")));
					data.setMember_role((rs.getString("MEMBER_ROLE")));
					datas.add(data);
				}
		} catch (SQLException e) {
			System.err.println("(memberDAO.selectAll) [3]단계 실패 ...");
		}finally {
			JDBCUtil.disconnect(conn, pstmt);
			System.out.println("(memberDAO.selectAll) [3]단계 진행완료");
		}
		System.out.println("member.memberDAO selectAll 완료");
		return datas;
	}
	public MemberDTO selectOne(MemberDTO memberDTO) {
		System.out.println("member.memberDAO selectOne 시작");
		Connection conn=JDBCUtil.connect();

		PreparedStatement pstmt=null;
		try {

				pstmt = conn.prepareStatement(SELECTONE);
				pstmt.setString(1, memberDTO.getMember_id());
				ResultSet rs=pstmt.executeQuery();
				if(rs.next()) {
					MemberDTO data=new MemberDTO();
					data.setMember_id(rs.getString("MEMBER_ID"));
					data.setMember_password(rs.getString("MEMBER_PASSWORD"));
					data.setMember_name(rs.getString("MEMBER_NAME"));
					data.setMember_role(rs.getString("MEMBER_ROLE"));
					return data;
				}
				else {
					return null;
				}
		} catch (SQLException e) {
			System.err.println("(memberDAO.selectOne) [3]단계 실패 ...");
			return null;
		} finally {
			System.out.println("(memberDAO.selectOne) [3]단계 진행완료");

			boolean flag=JDBCUtil.disconnect(conn, pstmt);
			if(!flag) {
				return null;
			}
			System.out.println("member.memberDAO selectOne 성공");
		}
	}

}