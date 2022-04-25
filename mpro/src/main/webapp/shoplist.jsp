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

  <title>상품목록 | 신나게 입자! BANANA MILK</title>

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
    
      <!-- 기본메뉴 -->
      <div class="menu_sec">
        <ul class="menu">
          <li><a href="/mpro/shop/list.do?code=outer">OUTER</a></li>
          <li><a href="/mpro/shop/list.do?code=top">TOP</a></li>
          <li><a href="/mpro/shop/list.do?code=bottom">BOTTOM</a></li>
          <li><a href="/mpro/shop/list.do?code=bag">BAGS</a></li>
        </ul>
      </div>
      
	<!-- 첫번째 줄 -->

		<section id="imgContainer">
            <div class="listImageContainer" 	
            	style="display: flex;
				justify-content: start;
				text-align: center;
				flex-wrap: wrap;
				width:100%;
				margin:auto;
				min-height: 1000px;
				justify-content: center;">
            	<c:forEach var="i" begin="1" end="4" step="1">
	                <div class="listImageDContainer">
		                <c:forEach var="k" begin="1" end="3" step="1">
			                    <c:if test="${ product[(i - 1) * 3 + k - 1].code eq null }">
			                    	<c:set var="doLoop" value="true"></c:set>
			                    </c:if>
		                	<c:if test="${ not doLoop }">
			                    <a class="product" href="/mpro/shop/detail.do?code=${ product[(i - 1) * 3 + k - 1].code }">
			                        <div class="imageD" style="background-image:url('${ product[(i - 1) * 3 + k - 1].representative }'); width:350px; height:350px; background-size:contain; margin: 50px 25px" ></div>
			                        <span class="imageTextContainer">
				                        <div class="imageText">${ product[(i - 1) * 3 + k - 1].name }</div>
				                        <div class="imageText" style="margin-bottom:25px;">${ product[(i - 1) * 3 + k - 1].price }원</div>
			                        </span>
			                    </a>
		                    </c:if>
		                </c:forEach>
		            </div>
		        </c:forEach>
		    </div>
		        <div style="text-align:center; width:100%;>">
			        <c:if test="${ begin != 1 }"><a href="/mpro/shop/list.do?nowPage=${ begin - 1 }&code=${ code }">[이전]</a></c:if>
			        	<c:forEach begin="${ begin }" end="${ end }" var="page">
							<a href="/mpro/shop/list.do?nowPage=${ page }&code=${ code }">[ ${ page } ]</a>
			        	</c:forEach>
			        <c:if test="${ end != lastPage }"><a href="/mpro/shop/list.do?nowPage=${ end + 1 }&code=${ code }">[다음]</a></c:if>
		        </div>
        </section>

<!-- 리스트 끝 -->
    

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