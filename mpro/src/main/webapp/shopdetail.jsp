<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <link rel="stylesheet" href="/mpro/asset/shopDetail.css">
        <link rel="stylesheet" href="/mpro/asset/css/footer.css">
    </head>
	<body>
        <header>
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
      <a href="/mpro/shop/main.do"><img class="logo" src="/mpro/asset/img/logo.png" alt="로고"></a>
    </div>

    <!-- 네비 -->
    <div class="nav_sec">
      <ul class="nav">
        <c:if test="${ sessionScope.id eq null }">
        <li><a href="/mpro/member/login.do">LOGIN</a></li>
        <li><a href="/mpro/member/join.do">JOIN</a></li>
        </c:if>
		<c:if test="${ sessionScope.id ne null }"><li><a href="/mpro/member/logout.do">LOGOUT</a></li></c:if>
        <li><a href="/mpro/member/mypage.do">MYPAGE</a></li>
        <li><a href="/mpro/member/cart_list.do">CART</a></li>
        <li><a href="/mpro/member/order_list.do">ORDER</a></li>
        <li><a href="/mpro/inquiry/member_inquiryView.do">Q&A</a></li>
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
    
	    <section id="top">
	        <div id="imgTitle" style="background-image: url('${ product[0].representative }')"></div>
	        
	        <div id="imgDesc">
	            <div id="productName">
	                ${ product[0].name }
	            </div>
	            <div id="productPrice">
	                ${ product[0].price }원
	            </div>
	            <div id="productBtn">
	                <a id="purchase" href="/mpro/member/order.do?code=${ product[0].code }"><div>구매하기</div></a>
	                <a  id="shoppingBasket" href="/mpro/member/cart.do?code=${ product[0].code }"><div>장바구니</div></a>
	            </div>
	        </div>
	    </section>
	<hr>
		<section id="imgDetail" style="background-image: url('${ product[0].details }')">
		</section>


		<!-- 리뷰 -->
		<section id="reviewContainer">
			<table class="tableList">
				<tr>
					<th colspan="3">리뷰</th>
				</tr>
				<tr>
					<th class="title">제목</th>
					<th class="writer">작성자</th>
					<th class="writeD">작성일</th>
				</tr>
				<c:forEach var="dto" items="${ review }">
					<tr>
						<td class="title"><a href="/mpro/review/view_review.do?review_id=${dto.review_id}">${ dto.title }</a></td>
						<td class="writer">${ dto.id }</td>
						<td class="writeD">${ dto.write_date }</td>
					</tr>
				</c:forEach>
			</table>
			<div style="text-align:center;">
			<c:if test="${ begin != 1 }"><a href="/mpro/shop/detail.do?nowPage=${ begin - 1 }&code=${ code }">[이전]</a></c:if>
		        <c:forEach begin="${ begin }" end="${ end }" var="page">
						<a href="/mpro/shop/detail.do?nowPage=${ page }&code=${ code }">[ ${ page } ]</a>
		        </c:forEach>
		    <c:if test="${ end != lastPage }"><a href="/mpro/shop/detail.do?nowPage=${ end + 1 }&code=${ code }">[다음]</a></c:if>
			</div>
	        <a class="writeBtn" href="/mpro/review/commentReview.do?code=${ code }">리뷰작성</a>
		</section>
		
		
		
		<section id="reviewContainer">
			<table class="tableList">
				<tr>
					<th colspan="3">문의</th>
				</tr>
				<tr>
					<th class="title">제목</th>
					<th class="writer">작성자</th>
					<th class="writeD">작성일</th>
				</tr>
				<c:forEach var="dto" items="${ inquiry }">
					<tr>
						<td class="title"><a href="/mpro/inquiry/inquiryViewDetail.do?inquiry_id=${ dto.inquiry_id }">${ dto.title }</a></td><!-- 고침고침 여기 고쳤어요 ******************************************!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!######################################## -->
						<td class="writer">${ dto.id }</td>
						<td class="writeD">${ dto.write_date }</td>
					</tr>
				</c:forEach>
			</table>
			<div style="text-align:center;">
			<c:if test="${ in_begin != 1 }"><a href="/mpro/shop/detail.do?in_nowPage=${ in_begin - 1 }&code=${ code }">[이전]</a></c:if>
		        <c:forEach begin="${ in_begin }" end="${ in_end }" var="page">
						<a href="/mpro/shop/detail.do?in_nowPage=${ page }&code=${ code }">[ ${ page } ]</a>
		        </c:forEach>
		    <c:if test="${ in_end != in_lastPage }"><a href="/mpro/shop/detail.do?in_nowPage=${ in_end + 1 }&code=${ code }">[다음]</a></c:if>
			</div>
	        <a class="writeBtn" href="/mpro/inquiry/member_reg.do?code=${ product[0].code }">문의작성</a><!-- 여기로 넘어온 product에 대한 list는 1개밖에 없음 -->
		</section>
		
  <div class="footer">
    <div class="footer_sec">

      <div class="logo_and_mall">
        <div>
          <img class="footer_logo" src="/mpro/asset/img/footer_logo.png" alt="하단로고">
        </div>

        <!-- 입점신청 -->
        <div>
          <a href="/mpro/seller/entry.do"><input type="submit" value="입점신청" class="mall_admin"></a>
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