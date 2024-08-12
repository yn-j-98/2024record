package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.JDBCUtil;

public class ProductDAO {
	private final String SELECTALL="SELECT * FROM PRODUCT ORDER BY PRODUCT_NUM";
	private final String SELECTALL_NAME="SELECT * FROM PRODUCT WHERE PRODUCT_NAME LIKE '%'||?||'%' ORDER BY PRODUCT_NUM";
	private final String SELECTALL_SELLER="SELECT * FROM PRODUCT WHERE SELLER=? ORDER BY PRODUCT_NUM";
	private final String SELECTONE="SELECT * FROM PRODUCT WHERE PRODUCT_NUM=?";
	private final String PRODUCT_INSERT="INSERT INTO PRODUCT VALUES((SELECT NVL(MAX(PRODUCT_NUM),0)+1 FROM PRODUCT),?,?,?,?,?)";
	private final String PRODUCT_UPDATE="UPDATE PRODUCT SET PRODUCT_CNT=PRODUCT_CNT-? WHERE PRODUCT_NUM=?";
	private final String PRODUCT_DELETE="DELETE FROM PRODUCT WHERE PRODUCT_NUM=?";

	public ArrayList<ProductDTO> selectAll(ProductDTO productDTO){
		System.out.println("selectAll 시작");
		//R selectAll  컨트롤러에서 호출하면 모든 DB에있는 모든값 배열에 담아 반환
		ArrayList<ProductDTO> datas=new ArrayList<ProductDTO>();
		// DB에 연결하기 위해서 Connection 객체가 필요하고 DB를 연결하고 관리할 객체에서 커넥트라는 메서드를 호출해서 기능에 결과값을 저장할거야 
		Connection conn=JDBCUtil.connect();
		//DB연결객체에서 연결기능 값 Connection 저장
		PreparedStatement pstmt=null;
		//Connection 객체 생성후 PreparedStatement로 SQL문 담을 공간 확보 초기값 지정
		try {
			pstmt=conn.prepareStatement(SELECTALL_NAME);//  
			// DB연결 객체에서 sql쿼리로 SELECTALL_NAME으로 담을 공간 저장
			pstmt.setString(1,productDTO.getName());
			// SQL쿼리문 연결에서 스트링 타입으로 상품이랑 이름 받아오기
			ResultSet rs = pstmt.executeQuery(); 
			// SQL객체에서 쿼리문으로 결과 확인값 ResultSet에 저장
			// 몇번 호출할지 모르니까 
			while(rs.next()) {
				ProductDTO data = new ProductDTO(); // ProductDTO에 셀렉트올 기능 추가
				int cnt=rs.getInt("PRODUCT_CNT"); // 결과값 정수형타입으로 개수 int cnt에 저장
				data.setCnt(cnt); // cnt에 
				data.setDetails(rs.getString("PRODUCT_DETAILS")); //상품 상세내용 받아오기
				data.setName(rs.getString("PRODUCT_NAME"));// 상품 이름 받아오기
				data.setNum(rs.getInt("PRODUCT_NUM")); // DB통해서 상품 DTO에 PK 값 부여하기
				data.setPrice(rs.getInt("PRODUCT_PRICE"));
				data.setSeller(rs.getString("PRODUCT_SELLER"));
				
				datas.add(data);
			}

		}catch(SQLException e) {// SQL실행중 오류 처리 
			System.err.println("SQL문 실패");
		}
		JDBCUtil.disconnect(conn,pstmt);// DB연결 종료

		return datas;
	}

	public ProductDTO selectOne(ProductDTO productDTO){
		System.out.println("selectone 시작");
		//R selectOne 컨트롤러에서 pk 주면 그거 반환
		ProductDTO data= null;
		Connection conn=JDBCUtil.connect();
		// Connetction: DB연결 객체   
		// JDBCUtil : DB를 사용할수 있도록 하는 연결객체
		// connect :객체에 값을 넣을 연결 기능
		PreparedStatement pstmt=null;	
		//PreparedStatement 연결 준비 기능 초기값 지정 
		try {
			pstmt = conn.prepareStatement(SELECTONE);
			pstmt.setInt(1,productDTO.getNum());
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				data = new ProductDTO();
				data.setCnt(rs.getInt("PRODUCT_CNT")); // 입력 값검색에서  결과값 정수형타입으로 sql문에 넣기 
				data.setDetails(rs.getString("PRODUCT_DETAILS"));
				data.setName(rs.getString("PRODUCT_NAME"));
				data.setNum(rs.getInt("PRODUCT_NUM"));
				data.setPrice(rs.getInt("PRODUCT_PRICE"));
				data.setSeller(rs.getString("PRODUCT_SELLER"));
				
				return data;
			}
		}
		catch(SQLException e){
			System.err.println("SQL문 실패");
		}
		JDBCUtil.disconnect(conn, pstmt);

		return null;

	}
	public boolean insert(ProductDTO productDTO){
		//C 상품추가 PK는 시스템 입력 나머지는 컨트롤에서 준 값
		System.out.println("insert 시작");
		Connection conn=JDBCUtil.connect();
		//커넥션이라는 객체에 값 저장  = DB 연결 .기능확보 
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(PRODUCT_INSERT);
	       //pstmt.setInt(1, productDTO.getNum()); PK는 서브쿼리 사용으로 안보내도 된다 
			pstmt.setString(1, productDTO.getName()); //  멤버변수 상품이름 와서 문자열 객체에 저장 
			pstmt.setString(2, productDTO.getDetails());
			pstmt.setInt(3, productDTO.getPrice());
			pstmt.setInt(4, productDTO.getCnt());
			pstmt.setString(5, productDTO.getSeller());
			pstmt.executeUpdate();
			//뭐리문 연결에서 업데이트 수행하기 
			
		}catch(SQLException e) { 
			System.err.println("SQL문 실패");
			JDBCUtil.disconnect(conn, pstmt);
		}
		return true;
	}
	public boolean update(ProductDTO productDTO){
		System.out.println("update 시작");
		ProductDTO data=null;
		//U update 컨트롤러에서 PK 넘겨주면 PK에 맞는 상품을 찾아서 그 상품에 CNT-1
		Connection conn=JDBCUtil.connect();
		PreparedStatement pstmt=null;
		try {
			pstmt =conn.prepareStatement(PRODUCT_UPDATE);
			pstmt.setInt(1, productDTO.getCnt()); //정수형타입으로 상품 개수 받아오기
			pstmt.setInt(2, productDTO.getNum()); // 정수형타입으로 상품 PK 받아오기
			
			int result = pstmt.executeUpdate();
			//SQL문 실행및 결과확인 
			
			//성공여부
			if(result <=0) { // 업데이트 실패시 false 반환
				return false;
			}
			
		}
		catch(SQLException e) {
			System.err.println("SQL문 실패");// 오류메시지 출력
		}
		JDBCUtil.disconnect(conn, pstmt); // DB연결 종료 
		
		return true;
	}
	public boolean delete(ProductDTO productDTO){// 
		System.out.println("delete 시작");
		//D delete PK 넘겨주면 그 PK에있는 정보 다 삭제
		Connection conn=JDBCUtil.connect();
		//JDBCUtil안에 연결 객체에서 커넥트 기능을 호출해서 Connection 결과값 저장
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement(PRODUCT_DELETE);// 제품 삭제시 SQL문 
			pstmt.setInt(1, productDTO.getNum());
			int result = pstmt.executeUpdate(); // sql문 실행 및 결과확인하기
			
			if(result <= 0) {// 결과 false 반환
				return false;
			}
			
		}catch(SQLException e) {
			System.err.println("SQL문 실패");
		}
		JDBCUtil.disconnect(conn, pstmt);//DB연결 해제
		
		return true;
	}
}
