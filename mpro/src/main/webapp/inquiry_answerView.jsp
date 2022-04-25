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
  <link rel="stylesheet" href="/mpro/asset/css/join.css">
  <link rel="stylesheet" href="/mpro/asset/css/mypage_qna_write.css">
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
      <a href="#"><img class="logo" src="/mpro/asset/img/logo.png" alt="로고"></a>
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

 <div class="mypage login">

    <h2>문의 답변</h2>

    <hr style="border: solid 1px rgba(128, 128, 128, 0.534);">
	<form action="/mpro/inquiry/inquiry_answer.do" method="post">
	    <div class="write_sec">
	      <span>답변 제목</span>
	      <input type="text" name="title" placeholder="제목을 입력해 주세요.">
	
	    </div>
	
	    <div class="write_sec_2">
	      <span>내용</span>
	      <input type="text" name="title" placeholder="리뷰 내용을 입력해 주세요.">
	    </div>
			<input type="hidden" name="pi_id" value="${ pi_id }">
			<input type="hidden" name="code" value="${ code }">
	    <div class="edit_bt">
	      <input type="submit" value="등록하기"></input>
	    </div>
	</form>
  </div>



<!--   <div class="mypage login"> -->
<!-- 	<form action="/mpro/inquiry/inquiry_answer.do" method="post"> -->
<!-- 		<table> -->
<!-- 			<tr> -->
<!-- 				<th>답변 제목 </th> -->
<!-- 				<td><input type="text" name="title"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>답변 내용 </th> -->
<!-- 				<td><textarea name="content"></textarea></td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<%-- 		<input type="hidden" name="pi_id" value="${ pi_id }"> --%>
<%-- 		<input type="hidden" name="code" value="${ code }"> --%>
<!-- 	</form> -->
<!--   </div> -->
<!-- 		<input type="submit" value="등록"> -->
  
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