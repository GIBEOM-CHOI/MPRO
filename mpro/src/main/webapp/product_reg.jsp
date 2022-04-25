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
	<meta charset="UTF-8">
	<title>상품등록 | bananamilk</title>
	<link rel="stylesheet" href="/mpro/asset/css/header.css">
	<link rel="stylesheet" href="/mpro/asset/css/footer.css">
	<link rel="stylesheet" href="/mpro/asset/shopDetail.css">
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
	        <c:if test="${ id == null }"><li><a href="/mpro/member/login.do">LOGIN</a></li></c:if>
			<c:if test="${ id != null }"><li><a href="/mpro/member/logout.do">LOGOUT</a></li></c:if>
	        <li><a href="/mpro/seller/seller_main.do">MYPAGE</a></li>
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
	  
	<section id="reviewContainer" style="align-items:center">	   
		<form action="/mpro/seller/product_regInfo.do" method="post">
			<table>
				<tr>
				<th colspan="6"><h1> 판매자 상품 등록 </h1><br><hr></th>

				<tr>
					<th>코드</th>
					<th>상품명</th>
					<th>가격</th>
					<th>대표이미지</th>
					<th>상세이미지</th>
					<th>등록하기</th>
				</tr>
				<tr>
					<td>
						<select name="code">
							<option value="outer_jk">아우터_자켓</option>
							<option value="outer_ct">아우터_코트</option>
							<option value="outer_pd">아우터_패딩</option>
							<option value="outer_jp">아우터_점퍼</option>
							<option value="top_ss">상의_반팔</option>
							<option value="top_ls">상의_긴팔</option>
							<option value="top_hd">상의_후드</option>
							<option value="top_mm">상의_맨투맨</option>
							<option value="top_sh">상의_셔츠</option>
							<option value="bottom_dn">하의_데님</option>
							<option value="bottom_sl">하의_슬랙스</option>
							<option value="bottom_sp">하의_반바지</option>
							<option value="bottom_sk">하의_치마</option>
							<option value="bottom_jg">하의_조거</option>
							<option value="bag_bp">가방_백팩</option>
							<option value="bag_cb">가방_크로스백</option>
							<option value="bag_ec">가방_에코백</option>
							<option value="bag_sb">가방_숄더백</option>
							<option value="bag_td">가방_토드백</option>
						</select>
					</td>
					<td><input type="text" name="name"></td>
					<td><input type="text" name="price"></td>
					<td><input type="text" name="representative"></td>
					<td><input type="text" name="details"></td>
					<td><input type="submit" value="등록" style="width:60px; height:30px; margin:auto;"></td>
				</tr>
			</table>
		</form>
</section>
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