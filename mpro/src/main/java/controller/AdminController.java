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
import service.AdminService;
import service.InquiryService;
import service.MemberService;
import service.MylistService;
import service.ProductService;
import service.ReviewService;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

@WebServlet("/admin/*")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductService productService;
//	ReviewService reviewService;
//	MylistService mylistService;
	MemberService memberService;
//	InquiryService inquiryService;
	AdminService adminService;
	
		public void init(ServletConfig config) throws ServletException {
//			memberService = new MemberService();
			productService = new ProductService();
//			reviewService = new ReviewService();
//			mylistService = new MylistService();
			memberService = new MemberService();
//			inquiryService = new InquiryService();
			adminService = new AdminService();
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
		System.out.println("action : " + action);
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String sessionId = (String) session.getAttribute("id");
		String sessionAuthority_id = (String) session.getAttribute("authority_id");
		
		try {
			if (action.equals("/admin_main.do")) {
				if(sessionId.equals("admin") && sessionAuthority_id.equals("10")) {
					nextPage = "/admin_main.jsp";
				} else {
					out.println("<script>alert('로그인 정보가 없습니다.');location.href='/mpro/member/login.do;</script>");
					out.close();
				}
			// SELLER CRUD
			} else if(action.equals("/list_seller.do")){
				
				Integer nowPage = 1;
				if(request.getParameter("nowPage") != null) {
					nowPage = Integer.parseInt(request.getParameter("nowPage"));
				}
				int section = 5; // 5개씩 끊어서 페이지 숫자 나오도록 12345/678910/... 이런식
				int perPage = 5; // 10개씩 출력
				//	페이징 구현하기
				Integer total = adminService.selectAllSellerInfo().size();
				System.out.println("total : " + total);

				int lastPage = total % perPage == 0 ? total / perPage : total / perPage + 1;//한 페이지당 나오는 상품수를 12개로 정함
				int position = nowPage % section == 0 ? nowPage / section : nowPage / section + 1;//이전과 다음 사이에 나오는 페이지 수를 section개로 함
				int begin = (position - 1) * section + 1;
				int end = position * section;
				if(end > lastPage) {
					end = lastPage;
				}
				System.out.println("position : " + position + ", lastPage : " + lastPage + ", begin : " + begin + ", end : " + end);
				List<MemberDTO> sellerList = adminService.selectAllSellerInfo(nowPage, perPage);
				request.setAttribute("sellerList", sellerList);
				request.setAttribute("nowPage", nowPage);
				request.setAttribute("lastPage", lastPage);
				request.setAttribute("begin", begin);
				request.setAttribute("end", end);
				
				nextPage = "/admin_seller_list.jsp";
				// 수정버튼 누르면 edit_seller.jsp로 이동
			} else if(action.equals("/edit_seller.do")){
				
				String seller_id = request.getParameter("seller_id");
				String seller_password = request.getParameter("seller_password");
				System.out.println("뽑아온 회원의 값 : " + seller_id + " + " + seller_password);
				MemberDTO memberDTO = adminService.selectInfo(seller_id, seller_password);
				
				request.setAttribute("memberDTO", memberDTO);
				
				nextPage = "/admin_edit_seller.jsp";
				
			}	else if(action.equals("/edit_seller_submit.do")){
				String id = request.getParameter("id");
				String name = request.getParameter("name");
				String password = request.getParameter("pw");
				String tel = request.getParameter("tel");
				String address = request.getParameter("address");
//				String[] birth = request.getParameterValues("birth");
//				String birthIn = birth[0] + "-" + birth[1] + "-" + birth[2];
//				Date births =  Date.valueOf(birthIn);
				String com_name = request.getParameter("com_name");
//				String[] cr_no_arr = request.getParameterValues("cr_no");
//				String cr_no = cr_no_arr[0] + "-" + cr_no_arr[1] + "-" + cr_no_arr[2];
				String entry = request.getParameter("entry");
				System.out.println(entry);
				
				MemberDTO sellerDTO = new MemberDTO();
				sellerDTO.setId(id);
				sellerDTO.setName(name);
				sellerDTO.setPassword(password);
				sellerDTO.setTel(tel);
				sellerDTO.setAddress(address);
//				sellerDTO.setBirth(births);
				sellerDTO.setCom_name(com_name);
//				sellerDTO.setCr_no(cr_no);
				sellerDTO.setEntry(entry);
				
				response.setContentType("text/html;charset=UTF-8");
				
				if("".equals(name) || name == null ||
						"".equals(password) || password == null ||
						"".equals(tel) || tel == null ||
						"".equals(address) || address == null ||
						"".equals(com_name) || com_name == null) {
					out.println("<script>alert('모든 내용을 입력해주세요.'); location.href='/admin/edit_seller.do';</script>");
					out.close();
				} else {
					int result = adminService.updateSellerInfo(sellerDTO);
					if(result==8) {
					System.out.println("판매자회원수정 완료");
					}
				}
				nextPage = "/admin/list_seller.do";
			} else if(action.equals("/delete_seller.do")){
				String rId = request.getParameter("rId");
				adminService.deleteSeller(rId);
				
				nextPage = "/admin/list_seller.do";
				
			// MEMBER CRUD
			}else if(action.equals("/list_member.do")){
				Integer mb_nowPage = 1;
				if(request.getParameter("nowPage") != null) {
					mb_nowPage = Integer.parseInt(request.getParameter("nowPage"));
				}
				int mb_section = 5; // 5개씩 끊어서 페이지 숫자 나오도록 12345/678910/... 이런식
				int mb_perPage = 5; // 10개씩 출력
				Integer mb_total = adminService.selectAllMemberInfo().size();
				System.out.println("total : " + mb_total);
				
				int mb_lastPage = mb_total % mb_perPage == 0 ? mb_total / mb_perPage : mb_total / mb_perPage + 1;//한 페이지당 나오는 상품수를 12개로 정함
				int mb_position = mb_nowPage % mb_section == 0 ? mb_nowPage / mb_section : mb_nowPage / mb_section + 1;//이전과 다음 사이에 나오는 페이지 수를 section개로 함
				int mb_begin = (mb_position - 1) * mb_section + 1;
				int mb_end = mb_position * mb_section;
				if(mb_end > mb_lastPage) {
					mb_end = mb_lastPage;
				}
				System.out.println("position : " + mb_position + ", lastPage : " + mb_lastPage + ", begin : " + mb_begin + ", end : " + mb_end);
				List<MemberDTO> memberList = adminService.selectAllMemberInfo(mb_nowPage, mb_perPage);
				request.setAttribute("memberList", memberList);
				request.setAttribute("nowPage", mb_nowPage);
				request.setAttribute("lastPage", mb_lastPage);
				request.setAttribute("begin", mb_begin);
				request.setAttribute("end", mb_end);
				
				nextPage = "/admin_member_list.jsp";
				
			} else if(action.equals("/edit_member.do")){
				String member_id = request.getParameter("member_id");
				String member_password = request.getParameter("member_password");
				System.out.println("뽑아온 회원의 값 : " + member_id + " + " + member_password);
				MemberDTO memberDTO = adminService.selectInfo(member_id, member_password);
				
				request.setAttribute("memberDTO", memberDTO);
				nextPage = "/admin_edit_member.jsp";
				
			} else if(action.equals("/edit_member_submit.do")){
				String id = request.getParameter("id");
				String name = request.getParameter("name");
				String password = request.getParameter("pw");
				String tel = request.getParameter("tel");
				String address = request.getParameter("address");
//				String[] birth = request.getParameterValues("birth");
//				String birthIn = birth[0] + "-" + birth[1] + "-" + birth[2];
//				Date births =  Date.valueOf(birthIn);
				
				MemberDTO memberDTO = new MemberDTO();
				memberDTO.setId(id);
				memberDTO.setName(name);
				memberDTO.setPassword(password);
				memberDTO.setTel(tel);
				memberDTO.setAddress(address);
//				memberDTO.setBirth(births);
				
				response.setContentType("text/html;charset=UTF-8");
				
				if("".equals(name) || name == null ||
						"".equals(password) || password == null ||
						"".equals(tel) || tel == null ||
						"".equals(address) || address == null)
//						"".equals(birthIn) || birthIn == null) {
						{
					out.println("<script>alert('모든 내용을 입력해주세요.'); location.href='/admin/edit_seller.do';</script>");
					out.close();
				} else {
					int result = adminService.updateMemberInfo(memberDTO);
					if(result==6) {
					System.out.println("일반회원수정 완료");
					}
				}
				nextPage = "/admin/list_member.do";
			} else if(action.equals("/delete_member.do")){
				String rId = request.getParameter("rId"); // id는 입력하지 않고 넘겨받기
				adminService.deleteMember(rId);
				nextPage = "/admin/list_member.do";
			}
			
			System.out.println("nextPage: " + nextPage);
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
