package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	private PreparedStatement pstmt;
	private Connection con;
	private DataSource dataFactory;
	
	public MemberDAO() {
		Context ctx;
		try {
			ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:comp/env");
			dataFactory = (DataSource)envContext.lookup("jdbc/banana");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public int insertMemberInfo(MemberDTO dto) { //member테이블에 member 저장
		int result = -10;
		try {
			con = dataFactory.getConnection();
			String query = "insert into tb_member(id, authority_id, password, birth, name, tel, address)"
					+ " values (?, 30, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());
			pstmt.setDate(3, dto.getBirth());
			pstmt.setString(4, dto.getName());
			pstmt.setString(5, dto.getTel());
			pstmt.setString(6, dto.getAddress());
			result = pstmt.executeUpdate();
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public String selectMemberID(String id) { //member 회원가입시 중복ID 체크에 필요
		String idC = null;
		try {
			con = dataFactory.getConnection();
			
			String query = "select * from tb_member where id = '" + id + "' and authority_id = 30";
			pstmt = con.prepareStatement(query);
			ResultSet result = pstmt.executeQuery();
			while(result.next()) {
				idC = result.getString("id");
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
		return idC;
	}
	
	public MemberDTO selectMemberToID(String id) { //ID로 회원 뽑기
		MemberDTO dto = new MemberDTO();
		try {
			con = dataFactory.getConnection();
			
			String query = "select * from tb_member where id = '" + id + "' and authority_id = 30";
			pstmt = con.prepareStatement(query);
			ResultSet result = pstmt.executeQuery();
			while(result.next()) {
				dto.setId(result.getString("id"));
				dto.setAuthority_id(result.getString("authority_id"));
				dto.setPassword(result.getString("password"));
				dto.setAddress(result.getString("address"));
				dto.setBirth(result.getDate("birth"));
				dto.setName(result.getString("name"));
				dto.setTel(result.getString("tel"));
				dto.setCom_name(result.getString("com_name"));
				dto.setCr_no(result.getString("cr_no"));
				dto.setEntry(result.getString("entry"));
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
		return dto;
	}
	
	public MemberDTO selectAllInfo(String id, String password) { //member, seller 구분없이 모든 회원 정보 select (속성에 값이 없으면 null값이 입력될 거임)
		MemberDTO dto = new MemberDTO();
		try {
			con = dataFactory.getConnection();
			
			String query = "select id, authority_id, password, birth, name, tel, address, com_name, cr_no, entry from tb_member where id = '" + id + "' and password = '" + password + "'";
//			pstmt = con.prepareStatement(query);
			pstmt = new LoggableStatement(con, query);
			System.out.println(((LoggableStatement)pstmt).getQueryString());
			ResultSet result = pstmt.executeQuery();
			while(result.next()) {
				dto.setId(result.getString("id"));
				dto.setAuthority_id(result.getString("authority_id"));
				dto.setPassword(result.getString("password"));
				dto.setBirth(result.getDate("birth"));
				dto.setName(result.getString("name"));
				dto.setTel(result.getString("tel"));
				dto.setAddress(result.getString("address"));
				dto.setCom_name(result.getString("com_name"));
				dto.setCr_no(result.getString("cr_no"));
				dto.setEntry(result.getString("entry"));
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
		return dto;
	}
	
	public int insertSellerInfo(MemberDTO dto) { //member테이블에 seller 저장
		int result = -10;
		try {
			con = dataFactory.getConnection();
			String query = "insert into tb_member(id, authority_id, password, name, tel, address, com_name, cr_no, entry)"
					+ " values ('sellerID' || tb_seller_id_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "20");
			pstmt.setString(2, "pw" + Integer.toString((int)(Math.random() * (99999 - 10000 + 1)) + 10000));
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getAddress());
			pstmt.setString(6, dto.getCom_name());
			pstmt.setString(7, dto.getCr_no());
			pstmt.setString(8, "0");
			result = pstmt.executeUpdate();
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public MemberDTO selectSellerInfo(String id, String password) { //seller 회원 정보 select
		MemberDTO dto = new MemberDTO();
		try {
			con = dataFactory.getConnection();
			
			String query = "select id, authority_id, password, name, tel, address, com_name, cr_no, entry from tb_member where id = '" + id + "' and password = '" + password + "'";
			pstmt = con.prepareStatement(query);
			ResultSet result = pstmt.executeQuery();
			while(result.next()) {
				dto.setId(result.getString("id"));
				dto.setAuthority_id(result.getString("authority_id"));
				dto.setPassword(result.getString("password"));
				dto.setName(result.getString("name"));
				dto.setTel(result.getString("tel"));
				dto.setAddress(result.getString("address"));
				dto.setCom_name(result.getString("com_name"));
				dto.setCr_no(result.getString("cr_no"));
				dto.setEntry(result.getString("entry"));
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
		return dto;
	}
	
	public List<MemberDTO> selectAllSellerInfo() { // 모든 seller 회원 정보 select
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		try {
			con = dataFactory.getConnection();
			String query = "select id, authority_id, password, name, tel, address, com_name, cr_no, entry from tb_member where authority_id = 20";
			pstmt = con.prepareStatement(query);
			ResultSet result = pstmt.executeQuery();
			while(result.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(result.getString("id"));
				dto.setAuthority_id(result.getString("authority_id"));
				dto.setPassword(result.getString("password"));
				dto.setName(result.getString("name"));
				dto.setTel(result.getString("tel"));
				dto.setAddress(result.getString("address"));
				dto.setCom_name(result.getString("com_name"));
				dto.setCr_no(result.getString("cr_no"));
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
	
	public List<MemberDTO> selectAllSellerInfo(int nowPage, int perPage) { // 모든 seller 회원 정보 select
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		int offset = 1 + (nowPage - 1) * perPage;
		int end = nowPage * perPage;
		
		try {
			con = dataFactory.getConnection();
			String query = "select id, password, name, tel, address, com_name, cr_no, entry "
					+ " from (select rownum num, m.id, m.password, m.name, m.tel, m.address, m.com_name, m.cr_no, m.entry "
					+ "	from tb_member m where authority_id = 20) "
					+ " where num between ? and ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, offset);
			pstmt.setInt(2, end);
			ResultSet result = pstmt.executeQuery();
			while(result.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(result.getString("id"));
//				dto.setAuthority_id(result.getString("authority_id"));
				dto.setPassword(result.getString("password"));
				dto.setName(result.getString("name"));
				dto.setTel(result.getString("tel"));
				dto.setAddress(result.getString("address"));
				dto.setCom_name(result.getString("com_name"));
				dto.setCr_no(result.getString("cr_no"));
				dto.setEntry(result.getString("entry"));
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
	
	public List<MemberDTO> selectAllMemberInfo() { // 모든 회원 정보 select
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		try {
			con = dataFactory.getConnection();
			String query = "select id, password, name, tel, address from tb_member where authority_id = 30";
			pstmt = con.prepareStatement(query);
			ResultSet result = pstmt.executeQuery();
			while(result.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(result.getString("id"));
				dto.setPassword(result.getString("password"));
				dto.setName(result.getString("name"));
				dto.setTel(result.getString("tel"));
				dto.setAddress(result.getString("address"));
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
	
	public List<MemberDTO> selectAllMemberInfo(int nowPage, int perPage) { // 모든 일반회원 정보 select
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		int offset = 1 + (nowPage - 1) * perPage;
		int end = nowPage * perPage;
		
		try {
			con = dataFactory.getConnection();
			String query = "select id, password, name, tel, address "
					+ " from (select rownum num, m.id, m.password, m.name, m.tel, m.address "
					+ " from tb_member m where authority_id = 30) "
					+ " where num between ? and ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, offset);
			pstmt.setInt(2, end);
			ResultSet result = pstmt.executeQuery();
			while(result.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(result.getString("id"));
				dto.setPassword(result.getString("password"));
				dto.setName(result.getString("name"));
				dto.setTel(result.getString("tel"));
				dto.setAddress(result.getString("address"));
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
	
	public int updateMember(MemberDTO dto) {
		int result = -10;
		try {
			con = dataFactory.getConnection();
			String query = "UPDATE tb_member"
					+ " SET "
					+ " name = ?,"
					+ " password = ?,"
					+ " tel = ?,"
					+ " address = ?"
					+ " WHERE"
					+ " id like ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getTel());
			pstmt.setString(4, dto.getAddress());
			pstmt.setString(5, dto.getId());
			result = pstmt.executeUpdate();
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteMember(String id) { //member테이블에 seller 저장
		int result = -10;
		try {
			con = dataFactory.getConnection();
			String query = "delete from tb_member where id like ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
			if(pstmt != null) {
				pstmt.close();
			}
			if(con != null) {
				con.close();
			}
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// Seller 수정 DAO
		public int updateSellerInfo(MemberDTO sellerDTO) {
			int result = -10;
			try {
				con = dataFactory.getConnection();
				String query = " ";
				query += " UPDATE tb_member SET name=?, password=?, tel=?, address=?, com_name=? , entry=? "
					  + " where id = ?";
				System.out.println("리뷰 입력 정보 DB에 삽입.");
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, sellerDTO.getName());
				pstmt.setString(2, sellerDTO.getPassword());
				pstmt.setString(3, sellerDTO.getTel());
				pstmt.setString(4, sellerDTO.getAddress());
				pstmt.setString(5, sellerDTO.getCom_name());
				pstmt.setString(6, sellerDTO.getEntry());
				pstmt.setString(7, sellerDTO.getId());
				result = pstmt.executeUpdate();
		
				if(pstmt != null) {
					pstmt.close();
				}
				if(con != null) {
					con.close();
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		return result;
	}
		// id값을 받아와서 해당 코드에 해당하는 Seller 삭제
		public int deleteSeller(String id) {
			int result = -1;
			try {
				con = dataFactory.getConnection();
				String query = " ";
				query += " DELETE FROM tb_member where id = ? ";
				System.out.println("판매자 회원정보 삭제중");
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, id);
				System.out.println(id + "판매자 회원정보 삭제 완료");
				result = pstmt.executeUpdate();
				if(pstmt != null) {
					pstmt.close();
				}
				if(con != null) {
					con.close();
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		return result;
		}
	
}
