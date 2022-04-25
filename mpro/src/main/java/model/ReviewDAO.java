package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ReviewDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private DataSource dataFactory;
	
	public ReviewDAO() {
		Context ctx;
		try {
			ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:comp/env");
			dataFactory = (DataSource)envContext.lookup("jdbc/banana");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public void insertReview(ReviewDTO rDTO) {
		try {
			con = dataFactory.getConnection();
			String query = " ";
			query += " INSERT INTO tb_review (review_id, id , code, title, content, write_date) values (tb_review_review_id_seq.nextval, ?, ?, ?, ?, sysdate) ";
			System.out.println("리뷰 입력 정보 DB에 삽입.");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, rDTO.getId());
			pstmt.setString(2, rDTO.getCode());
			pstmt.setString(3, rDTO.getTitle());
			pstmt.setString(4, rDTO.getContent());
			pstmt.executeUpdate();
			System.out.println("리뷰 등록 완료");
	
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String matchingReview(String review_id) {
		String id = "";
		try {
			con = dataFactory.getConnection();
			String query = " ";
			query += " SELECT id FROM tb_review where review_id = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, review_id);
			System.out.println("리뷰 아이디 추출 완료");
			ResultSet rs = pstmt.executeQuery();
			System.out.println(review_id+"에 등록된 ID를 불러오고 있습니다.");
			while(rs.next()) {
			id = rs.getString("id");
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}
	
	// 리뷰 수정 DAO
	public void editReview(ReviewDTO rDTO) {
		try {
			con = dataFactory.getConnection();
			String query = " ";
			query += " UPDATE tb_review SET id=?, code=?, title=? , content=?, write_date=sysdate where review_id = ? ";
			System.out.println("리뷰 입력 정보 DB에 삽입.");
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, rDTO.getId());
			pstmt.setString(2, rDTO.getCode());
			pstmt.setString(3, rDTO.getTitle());
			pstmt.setString(4, rDTO.getContent());
			pstmt.setString(5, rDTO.getReview_id());
			System.out.println("리뷰 수정 완료");
			pstmt.executeUpdate();

			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<ReviewDTO> selectReviewList(String code){ //상품코드에 해당하는 tb_review의 모든 레코드를 list에 저장
		List<ReviewDTO> list = new ArrayList<>();
		
		try {
			con = dataFactory.getConnection();
			
			String query = "select * from tb_review where code like '" + code + "'";
			pstmt = con.prepareStatement(query);
			ResultSet result = pstmt.executeQuery();
			while(result.next()) {
				ReviewDTO dto = new ReviewDTO();
				dto.setReview_id(result.getString("review_id"));
				dto.setId(result.getString("id"));
				dto.setCode(result.getString("code"));
				dto.setTitle(result.getString("title"));
				dto.setContent(result.getString("content"));
				dto.setWrite_date(result.getDate("write_date"));
				list.add(dto);
			}
			if(result != null) {
				result.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<ReviewDTO> selectReviewList(String code, int nowPage, int perPage){ //review테이블 페이징에 필요한 list
		List<ReviewDTO> list = new ArrayList<>();
		int offset = 1 + (nowPage - 1) * perPage;
		int end = nowPage * perPage;
		
		try {
			con = dataFactory.getConnection();
			
			String query = "select * from (select rownum num, r.* from tb_review r where code like '" + code + "%') where num between ? and ?";
//			String query = "select * from ("
//					+ "    select dense_rank() over(order by v.num desc) as rnk, v.*"
//					+ "    from v_review1 v where code like '" + code + "')"
//					+ "    where rnk between ? and ?";
//			pstmt = con.prepareStatement(query);
			pstmt = new LoggableStatement(con, query);//TODO : SQL 찍어보기
			pstmt.setInt(1, offset);
			pstmt.setInt(2, end);
			System.out.println(((LoggableStatement)pstmt).getQueryString());//TODO : SQL 찍어보기
			ResultSet result = pstmt.executeQuery();
			while(result.next()) {
				ReviewDTO dto = new ReviewDTO();
				dto.setReview_id(result.getString("review_id"));
				dto.setId(result.getString("id"));
				dto.setCode(result.getString("code"));
				dto.setTitle(result.getString("title"));
				dto.setContent(result.getString("content"));
				dto.setWrite_date(result.getDate("write_date"));
				list.add(dto);
			}
			if(result != null) {
				result.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<ReviewDTO> selectReviewList(String id, String code, int nowPage, int perPage) {
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		int offset = 1 + (nowPage -1) * perPage;
		int end = nowPage * perPage;
		
		try {
			con = dataFactory.getConnection();
			String query = " ";
			query += " SELECT * from (select rownum num, r.* tb_review r where code like '%" + code + "%' and id = " + id + " ) where num between ? and ? ";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, offset);
			pstmt.setInt(2, end);
			System.out.println(query + " = "+ code);
			ResultSet rs = pstmt.executeQuery();
			System.out.println(code+"에 대한 리뷰 목록을 불러오고 있습니다.");
			while(rs.next()) {
				
				String review_id = rs.getString("review_id");
				String id1 = rs.getString("id");
				String code1 = rs.getString("code");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Date write_date = rs.getDate("write_date");
				
				ReviewDTO dto = new ReviewDTO();
				
				dto.setReview_id(review_id);
				dto.setId(id1);
				dto.setCode(code1);
				dto.setTitle(title);
				dto.setContent(content);
				dto.setWrite_date(write_date);
				list.add(dto);
			}
			if(rs != null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int deleteReview(String review_id){
		int result = -10;
		try {
			con = dataFactory.getConnection();
			String query = "delete from tb_review where review_id = '" + review_id + "'";
			pstmt = con.prepareStatement(query);
			result = pstmt.executeUpdate();
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int deleteReviewToID(String id){
		int result = -10;
		try {
			con = dataFactory.getConnection();
			String query = "delete from tb_review where id like '" + id + "'";
			pstmt = con.prepareStatement(query);
			result = pstmt.executeUpdate();
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 해당 제품 리뷰 개수 출력 DAO
	public ReviewDTO viewReview(String review_id) {
		ReviewDTO dto = new ReviewDTO();
		try {
			con = dataFactory.getConnection();
			String query = " ";
			query += " select * from tb_review ";
			query += " where review_id = ? ";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, review_id);
			ResultSet rs = pstmt.executeQuery();
			System.out.println(review_id+ "에 대한 해당 상품의 리뷰를 불러오고있습니다.");
			while(rs.next()) {
			dto.setReview_id(rs.getString("review_id"));
			dto.setId(rs.getString("id"));
			dto.setCode(rs.getString("code"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setWrite_date(rs.getDate("write_date"));
			}
			if(rs != null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public void deleteReviewAdmin(String id) {
	try {
		con = dataFactory.getConnection();
		String query = " ";
		query += " DELETE FROM tb_review where id = ? ";
		System.out.println("리뷰 삭제중");
		pstmt = con.prepareStatement(query);
		pstmt.setString(1, id);
		System.out.println(id + " 리뷰 삭제 완료");
		pstmt.executeUpdate();
		if(pstmt != null) {
			pstmt.close();
		}
		if(con != null) {
			con.close();
		}
		
	}catch (Exception e) {
		e.printStackTrace();
	}
}
}