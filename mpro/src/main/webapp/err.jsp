<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>에러페이지</title>
  <link rel="stylesheet" href="/mpro/asset/css/header.css">
  <link rel="stylesheet" href="/mpro/asset/css/footer.css">
  <link rel="stylesheet" href="/mpro/asset/css/main_event.css">
  <link rel="stylesheet" href="/mpro/asset/css/item.css">
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
<body>
	<div style="text-align:center; color:margenta;">
		<h1>에러페이지</h1><br>
		<h1>에러페이지</h1><br>
		<h1>에러페이지</h1><br>
		<h1>에러페이지</h1><br>
		<h1>에러페이지</h1><br>
		<h1>에러페이지</h1><br>
		<h1>에러페이지</h1><br>
		<h1>에러페이지</h1><br>
		<h1>에러페이지</h1><br>
		<h1>에러페이지</h1><br>
	</div>
</body>
</html>