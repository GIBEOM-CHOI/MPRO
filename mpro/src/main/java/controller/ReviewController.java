package controller;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.MemberDTO;
import model.MylistDTO;
import service.MemberService;
import service.MylistService;
import model.ReviewDTO;
import service.ReviewService;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/review/*")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ReviewService review;
	MylistService mylist;
	
	public void init(ServletConfig config) throws ServletException {
		review = new ReviewService();
		mylist = new MylistService();
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String action = request.getPathInfo();
		HttpSession session = request.getSession(); 
		
		PrintWriter out = response.getWriter();
		String sessionId = (String) session.getAttribute("id");
 
		try {
			if(action.equals("/commentReview.do")) {
				if(sessionId == null || "".equals(sessionId) ){
					String code = request.getParameter("code");
					out.println("<script>alert('로그인 정보가 없습니다.');location.href='/mpro/shop/detail.do?code="+code+"';</script>");
					out.close();
				} else {
					String code = request.getParameter("code");
					MylistDTO dto = mylist.getMemberReviewC(sessionId, code);
					System.out.println("dto.getId() : " + dto.getId());
					if( dto.getId() == null || "".equals(dto.getId())) {
						out.println("<script>alert('주문하신 상품이 아닙니다.');location.href='/mpro/shop/detail.do?code="+code+"';</script>");
						out.close();
					}else if(dto.getSort() == 50) {
						request.setAttribute("code", code);
						nextPage = "/insert_review.jsp";
						System.out.println("로그인한 ID : " + sessionId);
					}else if(dto.getSort() != 50){
						out.println("<script>alert('배송완료된 상품이 아닙니다.');location.href='/mpro/shop/detail.do?code="+code+"';</script>");
						out.close();
					}
					
				}
			} else if(action.equals("/insertReview.do")) {
				String id = (String)session.getAttribute("id");
				String code = request.getParameter("code");
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				
				if("".equals(id) || id == null) {
					out.println("<script>alert('로그인 정보가 없습니다.'); location.href='/mpro/shop/detail.do?code="+code+"';</script>");
					out.close();
				} else if("".equals(code) || code == null) {
					out.println("<script>alert('상품정보가 없습니다.'); location.href='/mpro/shop/detail.do?code="+code+"'; </script>");
					out.close();
				} else if("".equals(title) || title == null) {
					out.println("<script>alert('제목을 입력해주세요.'); location.href='/mpro/shop/detail.do?code="+code+"';</script>");
					out.close();
				} else if("".equals(content) || content == null) {
					out.println("<script>alert('내용을 입력해주세요.'); location.href='/mpro/shop/detail.do?code="+code+"';</script>");
					out.close();
				} else {
					ReviewDTO dto = new ReviewDTO();
					dto.setId(id);
					dto.setCode(code);
					dto.setTitle(title);
					dto.setContent(content);
					review.insertReview(dto);
					}
				
				nextPage = "/shop/detail.do?code="+code;
				
				} else if(action.equals("/view_review.do")) {
					String review_id = request.getParameter("review_id");
					ReviewDTO reviewDTO = review.viewReview(review_id);
					request.setAttribute("reviewDTO", reviewDTO);
					
					nextPage = "/view_review.jsp";
				}else if(action.equals("/requestEdit.do")) {
					// 버튼에 get 방식으로 id 추출
					String review_id = request.getParameter("review_id");
					// review_id를 작성항 id 추출
					String handed_id = review.matchingReview(review_id);
						// 로그인 한 id와 작성 id가 같으면 
						if("".equals("sessionId") || sessionId == null){
							out.println("<script>alert('로그인이 필요합니다.');location.href='/mpro/member/login.do';</script>");//TODO : 고침
							out.close();
						} else if(sessionId.equals(handed_id)){
							ReviewDTO reviewDTO = review.viewReview(review_id);
							request.setAttribute("reviewDTO", reviewDTO);
							nextPage = "/edit_review.jsp";
						} else {
							out.println("<script>alert('수정권한이 없습니다.');window.history.back();</script>");//TODO : 고침
							out.close();
						}
					
				} else if(action.equals("/editReview.do")) {
					ReviewDTO dto = new ReviewDTO();
					String id = sessionId;
					String review_id = request.getParameter("review_id");
					String code = request.getParameter("code");
					String title = request.getParameter("title");
					String content = request.getParameter("content");
					
						if("".equals(id) || id == null) {
							out.println("<script>alert('로그인 정보가 없습니다.');location.href='/mpro/member/login.do';</script>");//TODO : 고침
							out.close();
						} else if("".equals(title) || title == null) {
							out.println("<script>alert('제목을 입력해주세요.');window.history.back();</script>");//TODO : 고침
							out.close();
						} else if("".equals(content) || content == null) {
							out.println("<script>alert('내용을 입력해주세요.');window.history.back();</script>");//TODO : 고침
							out.close();
						} else {
							dto.setId(id);
							dto.setReview_id(review_id);
							dto.setCode(code);
							dto.setTitle(title);
							dto.setContent(content);
							System.out.println(review_id);
							review.editReview(dto);
							nextPage = "/shop/detail.do??code="+code;
						}
				} else if(action.equals("/requestDelete.do")) {
					
					String review_id = request.getParameter("review_id");
					String handed_id = review.matchingReview(review_id);

						if("".equals("sessionId") || sessionId == null){
							out.println("<script>alert('로그인이 필요합니다.');location.href='/mpro/member/login.do';</script>");//TODO : 고침
							out.close();
						} else if(sessionId.equals(handed_id)){
							request.setAttribute("review_id", review_id);
							nextPage = "/review/deleteReview.do";
						} else {
							out.println("<script>alert('수정권한이 없습니다.');window.history.back();</script>");//TODO : 고침
							out.close();
						}
					
				} else if(action.equals("/deleteReview.do")) {
					String review_id = (String) request.getAttribute("review_id");
					ReviewDTO reviewDTO = review.viewReview(review_id);
					String code = reviewDTO.getCode();
					System.out.println("삭제 요청한 review_id : " + review_id);
					System.out.println("돌아갈 상품의 code : " + code);
					review.erasureReview(review_id);
					nextPage = "/shop/detail.do?code="+code;
				}	else	{
					nextPage = "/err.jsp";
				}
			
			System.out.println("nextPage: " + nextPage);
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
