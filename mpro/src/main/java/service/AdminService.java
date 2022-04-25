package service;

import java.util.List;

import model.InquiryDAO;
import model.MemberDAO;
import model.MemberDTO;
import model.MylistDAO;
import model.ReviewDAO;

public class AdminService {
	private MemberDAO mmdao;
	private ReviewDAO rvdao;
	private InquiryDAO iqdao;
	private MylistDAO mldao;
	
	public AdminService() {
		mmdao = new MemberDAO();
		rvdao = new ReviewDAO();
		iqdao = new InquiryDAO();
		mldao = new MylistDAO();
	}
	
	public List<MemberDTO> selectAllSellerInfo(int nowPage, int perPage) {
		return mmdao.selectAllSellerInfo(nowPage, perPage);
	}
	
	public List<MemberDTO> selectAllSellerInfo() {
		return mmdao.selectAllSellerInfo();
	}
	
	public int updateSellerInfo(MemberDTO sellerDTO) {
		int result = mmdao.updateSellerInfo(sellerDTO);
		return result;
	}

	public List<MemberDTO> selectAllMemberInfo(int nowPage, int perPage) {
		return mmdao.selectAllMemberInfo(nowPage, perPage);
	}
	
	public List<MemberDTO> selectAllMemberInfo() {
		return mmdao.selectAllMemberInfo();
	}
	
	public int updateMemberInfo(MemberDTO memberDTO) {
		int result = mmdao.updateMember(memberDTO);
		return result;
	}
	
	
	public MemberDTO selectInfo(String id, String password) {
		MemberDTO dto = mmdao.selectAllInfo(id, password);
		return dto;
	}
	
	public void deleteSeller(String id) {
		rvdao.deleteReviewAdmin(id);
		iqdao.deleteInquiryToId(id);
		mldao.deleteMylistToId(id);
		mmdao.deleteSeller(id);
	}
	
	public void deleteMember(String id) {
		rvdao.deleteReviewAdmin(id);
		iqdao.deleteInquiryToId(id);
		mldao.deleteMylistToId(id);
		mmdao.deleteMember(id);
	}
}
