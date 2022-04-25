<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/mpro/asset/css/header.css">
  <link rel="stylesheet" href="/mpro/asset/css/footer.css">
  <link rel="stylesheet" href="/mpro/asset/css/main_event.css">
  <link rel="stylesheet" href="/mpro/asset/css/item.css">
</head>
<meta charset="UTF-8">
<title>회원가입 | BANANAMILK</title>
    <link rel="stylesheet" href="/mpro/asset/join.css">
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
	
	<section>
		<div id="title">회원가입</div>
		<form method="post" action="/mpro/member/joinConfirm.do"><!-- 여기 mpro 지워야 할수도 있을 듯############### -->
			<div>이름</div>
			<input class="name" type="text" name="name">
			<div>아이디</div>
			<input class="id" type="text" name="id">
			<div>비밀번호</div>
			<input type="password" name="pw">
			<div>비밀번호 확인</div>
			<input type="password" name="pw_ch">
			<div>전화번호</div>
			<input class="tel" type="text" name="tel">
			<div>주소</div>
			<input class="address" type="text" name="address">
			<div>생년월일</div>
			<input class="birth" type="text" name="birth" placeholder="년">
			<input class="birth" type="text" name="birth" placeholder="월">
			<input class="birth" type="text" name="birth" placeholder="일">
			<div class="agree">
                <div class="agreeTitle">약관동의</div>
                <textarea readonly>약관동의 내용 Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium, necessitatibus dolorum tenetur reprehenderit facilis modi sed pariatur sequi sapiente consequatur, facere, assumenda temporibus impedit rerum libero obcaecati cupiditate hic labore?</textarea>
            </div>
			<input type="submit" value="가입">
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