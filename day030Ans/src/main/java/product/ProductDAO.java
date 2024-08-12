package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.JDBCUtil;

public class ProductDAO {
	private final String SELECTALL="SELECT * FROM PRODUCT ORDER BY NUM";
	private final String SELECTALL_NAME="SELECT * FROM PRODUCT WHERE NAME LIKE '%'||?||'%' ORDER BY NUM";
	private final String SELECTALL_SELLER="SELECT * FROM PRODUCT WHERE SELLER=? ORDER BY NUM";
	private final String SELECTONE="SELECT\r\n"
			+ "	P.NUM,\r\n"
			+ "	P.NAME AS P_NAME,\r\n"
			+ "	P.DETAILS,\r\n"
			+ "	P.PRICE,\r\n"
			+ "	P.CNT,\r\n"
			+ "	NVL(M.NAME,'탈퇴한 판매자입니다.') AS M_NAME\r\n"
			+ "FROM\r\n"
			+ "	PRODUCT P\r\n"
			+ "LEFT JOIN\r\n"
			+ "	MEMBER M\r\n"
			+ "ON\r\n"
			+ "	P.SELLER=M.MID\r\n"
			+ "WHERE\r\n"
			+ "	P.NUM=?";
	private final String INSERT="INSERT INTO PRODUCT VALUES((SELECT NVL(MAX(NUM),0)+1 FROM PRODUCT),?,?,?,?,?)";
	private final String UPDATE="UPDATE PRODUCT SET CNT=CNT-? WHERE NUM=?";
	private final String DELETE="DELETE FROM PRODUCT WHERE NUM=?";

	public ArrayList<ProductDTO> selectAll(ProductDTO productDTO){
		ArrayList<ProductDTO> datas=new ArrayList<ProductDTO>();

		Connection conn=JDBCUtil.connect();
		PreparedStatement pstmt=null;

		try {
			if(productDTO.getSearchKeyword().equals("ALL")) {
				pstmt=conn.prepareStatement(SELECTALL);
			}
			else if(productDTO.getSearchKeyword().equals("NAME")) {
				pstmt=conn.prepareStatement(SELECTALL_NAME);
				pstmt.setString(1, productDTO.getSearchContent());
			}
			else if(productDTO.getSearchKeyword().equals("SELLER")) {
				pstmt=conn.prepareStatement(SELECTALL_SELLER);
				pstmt.setString(1, productDTO.getSearchContent());
			}
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO data=new ProductDTO();
				data.setCnt(rs.getInt("CNT"));
				data.setDetails(rs.getString("DETAILS"));
				data.setName(rs.getString("NAME"));
				data.setNum(rs.getInt("NUM"));
				data.setPrice(rs.getInt("PRICE"));
				data.setSeller(rs.getString("SELLER"));
				datas.add(data);
			}
		} catch (SQLException e) {
			System.out.println("SQL문 실패");
		}

		JDBCUtil.disconnect(conn,pstmt);

		return datas;
	}
	public ProductDTO selectOne(ProductDTO productDTO){
		ProductDTO data=null;

		Connection conn=JDBCUtil.connect();
		PreparedStatement pstmt=null;

		try {
			pstmt=conn.prepareStatement(SELECTONE);
			pstmt.setInt(1, productDTO.getNum());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				data=new ProductDTO();
				data.setCnt(rs.getInt("CNT"));
				data.setDetails(rs.getString("DETAILS"));
				data.setName(rs.getString("P_NAME"));
				data.setNum(rs.getInt("NUM"));
				data.setPrice(rs.getInt("PRICE"));
				data.setSellerName(rs.getString("M_NAME"));
			}
		} catch (SQLException e) {
			System.out.println("SQL문 실패");
		}

		JDBCUtil.disconnect(conn,pstmt);

		return data;
	}
	public boolean insert(ProductDTO productDTO){
		Connection conn=JDBCUtil.connect();
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(INSERT);
			pstmt.setString(1, productDTO.getName());
			pstmt.setString(2, productDTO.getDetails());
			pstmt.setInt(3, productDTO.getPrice());
			pstmt.setInt(4, productDTO.getCnt());
			pstmt.setString(5, productDTO.getSeller());
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
	public boolean update(ProductDTO productDTO){
		Connection conn=JDBCUtil.connect();
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(UPDATE);
			pstmt.setInt(1, productDTO.getCnt());
			pstmt.setInt(2, productDTO.getNum());
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
	public boolean delete(ProductDTO productDTO){
		Connection conn=JDBCUtil.connect();
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(DELETE);
			pstmt.setInt(1, productDTO.getNum());
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
