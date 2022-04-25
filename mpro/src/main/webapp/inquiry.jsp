<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="shortcut icon" type="image/x-icon" href="/mpro/asset/img/favicon.png">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>신나게 입자! BANANA MILK</title>

  <link rel="stylesheet" href="/mpro/asset/css/header.css">
  <link rel="stylesheet" href="/mpro/asset/css/footer.css">
  <link rel="stylesheet" href="/mpro/asset/css/mypage_cart._order_qna.css">
</head>
<body>
<div class="header">

    <!-- 검색창 -->
    <div class="search">
      <form>
        <input type="search" placeholder="Search">
        <span>검색</span>
      </form>
    </div>

    <!-- 로고 -->
    <div class="logo_sec">
      <c:if test="${fn:contains(id, 'member') || id eq null}"><a href="/mpro/shop/main.do"><img class="logo" src="/mpro/asset/img/logo.png" alt="로고"></a></c:if>
      <c:if test="${fn:contains(id, 'seller')}"><a href="/mpro/seller/seller_main.do"><img class="logo" src="/mpro/asset/img/logo.png" alt="로고"></a></c:if>
    </div>

    <!-- 네비 -->
    <div class="nav_sec">
      <ul class="nav">
        <c:if test="${ sessionScope.id eq null }">
        	<li><a href="/mpro/member/login.do">LOGIN</a></li>
        	<li><a href="/mpro/member/join.do">JOIN</a></li>
        </c:if>
			<c:if test="${ sessionScope.id ne null }"><li><a href="/mpro/member/logout.do">LOGOUT</a></li></c:if>
		<c:if test="${fn:contains(id, 'member')}"><li><a href="/mpro/member/mypage.do">MYPAGE</a></li></c:if>
		<c:if test="${fn:contains(id, 'seller')}"><li><a href="/mpro/seller/seller_main.do">MYPAGE</a></li></c:if>
        <c:if test="${fn:contains(id, 'member')}"><li><a href="/mpro/member/cart_list.do">CART</a></li></c:if>
        <c:if test="${fn:contains(id, 'member')}"><li><a href="/mpro/member/order_list.do">ORDER</a></li></c:if>
      </ul>
    </div>
  </div>

  <!-- 기본메뉴 -->
  <div class="menu_sec">
    <ul class="menu">
      <li><a href="/mpro/shop/list.do?code=outer">OUTER</a></li>
      <li><a href="/mpro/shop/list.do?code=top">TOP</a></li>
      <li><a href="/mpro/shop/list.do?code=bottom">BOTTOM</a></li>
      <li><a href="/mpro/shop/list.do?code=bag">BAGS</a></li>

    </ul>
  </div>
  
	<!-- <a href="/mpro/seller/seller_main.do">판매자 메인 이동</a><br> -->
  <div class="mypage login">
	<form action="/mpro/seller/inquiry_answer.do">
	<div class="table_wrap">
		<table>
			<tr>
				<th>글번호</th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>답변하기</th>
			</tr>
			<c:forEach var="inquiry" items="${ inquiry }">
				<tr>
					<td>${ inquiry.inquiry_id }</td>
					<td>${ inquiry.code }</td>
					<td>${ inquiry.name }</td>
					<td><a href="/mpro/inquiry/inquiryViewDetail.do?inquiry_id=${ inquiry.inquiry_id }">${ inquiry.title }</a></td>
					<td>${ inquiry.id }</td>
					<td>${ inquiry.write_date }</td>
					<td><c:if test="${ inquiry.pi_id eq '0' }"><a href="/mpro/inquiry/inquiry_answerView.do?pi_id=${ inquiry.inquiry_id }&code=${ inquiry.code }">답변 </a></c:if></td><!-- pi_id로 inquiry_id를 넣어준 이유는 이걸 부모로 하는 답글을 쓰려고 -->
				</tr>
			</c:forEach>
		</table>
		</div>
	</form>
	<br>
	<div style="text-align:center;">
			<c:if test="${ in_begin != 1 }"><a href="/mpro/seller/inquiry.do?in_nowPage=${ in_begin - 1 }">[이전]</a></c:if>
		        <c:forEach begin="${ in_begin }" end="${ in_end }" var="page">
						<a href="/mpro/seller/inquiry.do?in_nowPage=${ page }">[ ${ page } ]</a>
		        </c:forEach>
		    <c:if test="${ in_end != in_lastPage }"><a href="/mpro/seller/inquiry.do?in_nowPage=${ in_end + 1 }">[다음]</a></c:if>
	</div><!-- 페이징에 뭔가 현재페이지이면 변화가 있으면 좋을거 같은데 바쁘시면 안해도 되요!!!! -->
	</div>
	
	
	
	  <!-- footer -->
  <div class="footer">
    <div class="footer_sec">

      <div class="logo_and_mall">
        <div>
          <img class="footer_logo" src="/mpro/asset/img/footer_logo.png" alt="하단로고">
        </div>

        <!-- 입점신청 -->
        <div>
          <a href="/mpro/seller/entry.do"><input type="submit" value="입점신청" class="mall_admin"></a></input>
        </div>

      </div>

      <div class="information">
        <div class="info_1">
          <div><a href="#">회사소개</a></div>
          <div><a href="#">이용약관</a></div>
          <div><a href="#">개인정보</a></div>
          <div><a href="#">처리방침</a></div>
          <div><a href="#">이용안내</a></div>
        </div>

        <div class="info_2">
          상호 : (주)뚱바사조　대표 : 김뚱바　사업자등록번호 : 123-23-1234 <br>
          통신판매업신고번호 : 2022-충남천안-222 　<a href="#" style="color: #fff;">[사업자정보확인]</a> <br>
          대표번호 : 041-777-7777　팩스번호 : 041-777-7777　<a href="#" style="color: #fff;">메일 : info@ddungba.co.kr
          </a><br>
          주소 : 충청남도 천안시 뚱바구 바나동 맛나빌딩 1504호　개인정보관리자 : 김뚱바 <br>
        </div>

        <div class="copy_and_icon">
          <div class="info_3">
            copyright (c) ddungba all rights reserved.
          </div>

          <ul class="icons">
            <a href="#" target="_blank"><img src="/mpro/asset/img/home.png" alt="공식홈"></a>
            <a href="#" target="_blank"><img src="/mpro/asset/img/insta.png" alt="인스타"></a>
            <a href="#" target="_blank"><img src="/mpro/asset/img/facebook.png" alt="페이스북"></a>
          </ul>
        </div>
      </div>

    </div>
  </div>
	
</body>
</html>