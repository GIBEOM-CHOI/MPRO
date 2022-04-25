<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="shortcut icon" type="image/x-icon" href="asset/img/favicon.png">
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
      <a href="/mpro/admin/admin_main.do"><img class="logo" src="/mpro/asset/img/logo.png" alt="로고"></a>
    </div>

    <!-- 네비 -->
    <!-- 네비 -->
    <div class="nav_sec">
      <ul class="nav">
        <c:if test="${ sessionScope.id eq null }">
        <li><a href="/mpro/member/login.do">LOGIN</a></li>
        </c:if>
		<c:if test="${ sessionScope.id ne null }"><li><a href="/mpro/member/logout.do">LOGOUT</a></li></c:if>
        <li><a href="/mpro/admin/admin_main.do">ADMINPAGE</a></li>
      </ul>
    </div>
  </div>



  <div class="login">

     <h2 style="text-align:center">판매자 회원수정</h2>

    <hr style="border: solid 1px rgba(128, 128, 128, 0.534);">

    <form method="post" action="/mpro/admin/edit_seller_submit.do">
      <div class="login_mg">
        <h3>아이디</h3>
        ${memberDTO.id }
        <input type="hidden" name="id" value="${memberDTO.id }">
      </div>

      <div class="login_mg">
        <h3>비밀번호</h3>
        <input type="password" name="pw" value="${memberDTO.password }">
      </div>

      <div class="login_mg">
        <h3>이름</h3>
        <input type="text" name="name" value="${memberDTO.name }">
      </div>

      <div class="login_mg">
        <h3>번호</h3>
        	<input type="text" name="tel" value="${memberDTO.tel }">
      </div>

      <div class="login_mg">
        <h3>주소</h3>
        <input type="text" name="address" value="${memberDTO.address }">
      </div>
      
       <div class="login_mg">
        <h3>회사명</h3>
        <input type="text" name="com_name" value="${memberDTO.com_name }">
      </div>

      <div class="login_mg">
        <h3>사업자 번호</h3>
        <div class="login_tel">
          ${memberDTO.cr_no }
        </div>
      </div>
      <div class="login_mg">
        <h3>판매자 승인여부</h3>
        	<div class="login_tel">
          		<input type="radio" name="entry" value="1" <c:if test="${memberDTO.entry eq 1 }"> checked</c:if>> 입점승인
          		<input type="radio" name="entry" value="0" <c:if test="${memberDTO.entry eq 0 }"> checked </c:if>> 입점취소
      		</div>
      </div>
      
      <div class="login_mg join">
        <div>
          <input type="submit" value="판매자 회원 수정"></input>
        </div>
      </div>
    </form>
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