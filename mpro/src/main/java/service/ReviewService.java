package service;

import java.util.List;

import model.ReviewDAO;
import model.ReviewDTO;

public class ReviewService {
	ReviewDAO dao;
	
	public ReviewService() {
		dao = new ReviewDAO();
	}
	
	public void insertReview(ReviewDTO reviewDTO) {
		dao.insertReview(reviewDTO);
	}
	public void editReview(ReviewDTO reviewDTO) {
		dao.editReview(reviewDTO);
	}
	public String matchingReview(String review_id) {
		String id = dao.matchingReview(review_id);
		return id;
	}
	public ReviewDTO viewReview(String review_id) {
		return dao.viewReview(review_id);
	}
	public List<ReviewDTO> getCodeReviewList(String code) {
		List<ReviewDTO> list = dao.selectReviewList(code);
		return list;
	}
	
	public List<ReviewDTO> getCodeReviewList(String code, int nowPage, int perPage) {
		List<ReviewDTO> list = dao.selectReviewList(code, nowPage, perPage);
		return list;
	}
	
	public int erasureReview(String review_id) {
		return dao.deleteReview(review_id);
	}
	
	public int erasureReviewToId(String id) {
		return dao.deleteReviewToID(id);
	}

}
