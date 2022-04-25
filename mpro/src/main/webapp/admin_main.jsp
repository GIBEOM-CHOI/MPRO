<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <link rel="shortcut icon" type="image/x-icon" href="/mpro/asset/img/favicon.png">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>�ų��� ����! BANANA MILK</title>

  <link rel="stylesheet" href="/mpro/asset/css/header.css">
  <link rel="stylesheet" href="/mpro/asset/css/footer.css">
  <link rel="stylesheet" href="/mpro/asset/css/join.css">
  <link rel="stylesheet" href="/mpro/asset/css/mypage.css">
</head>

<body>

  <div class="header">

    <!-- �˻�â -->
    <div class="search">
      <form>
        <input type="search" placeholder="Search">
        <span>�˻�</span>
      </form>
    </div>

    <!-- �ΰ� -->
    <div class="logo_sec">
      <a href="/mpro/admin/admin_main.do"><img class="logo" src="/mpro/asset/img/logo.png" alt="�ΰ�"></a>
    </div>

    <!-- �׺� -->
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


  <!-- ȸ������â -->

  <div class="mypage">

    <h2>������ ������</h2>

    <hr style="border: solid 1px rgba(128, 128, 128, 0.534);">

    <div class="my_menu">
      <a href="/mpro/admin/list_seller.do">�Ǹ��� ��������</a>
    </div>
    
    <div class="my_menu">
      <a href="/mpro/admin/list_member.do">�Ϲ�ȸ�� ��������</a>
    </div>

  </div>


  <!-- footer -->
  <div class="footer">
    <div class="footer_sec">

      <div class="logo_and_mall">
        <div>
          <img class="footer_logo" src="/mpro/asset/img/footer_logo.png" alt="�ϴܷΰ�">
        </div>

        <!-- ������û -->
        <div>
          <a href="/mpro/seller/entry.do"><input type="submit" value="������û" class="mall_admin"></a></input>
        </div>

      </div>

      <div class="information">
        <div class="info_1">
          <div><a href="#">ȸ��Ұ�</a></div>
          <div><a href="#">�̿���</a></div>
          <div><a href="#">��������</a></div>
          <div><a href="#">ó����ħ</a></div>
          <div><a href="#">�̿�ȳ�</a></div>
        </div>

        <div class="info_2">
          ��ȣ : (��)�׹ٻ�������ǥ : ��׹١�����ڵ�Ϲ�ȣ : 123-23-1234 <br>
          ����Ǹž��Ű��ȣ : 2022-�泲õ��-222 ��<a href="#" style="color: #fff;">[���������Ȯ��]</a> <br>
          ��ǥ��ȣ : 041-777-7777���ѽ���ȣ : 041-777-7777��<a href="#" style="color: #fff;">���� : info@ddungba.co.kr
          </a><br>
          �ּ� : ��û���� õ�Ƚ� �׹ٱ� �ٳ��� �������� 1504ȣ���������������� : ��׹� <br>
        </div>

        <div class="copy_and_icon">
          <div class="info_3">
            copyright (c) ddungba all rights reserved.
          </div>

          <ul class="icons">
            <a href="#" target="_blank"><img src="/mpro/asset/img/home.png" alt="����Ȩ"></a>
            <a href="#" target="_blank"><img src="/mpro/asset/img/insta.png" alt="�ν�Ÿ"></a>
            <a href="#" target="_blank"><img src="/mpro/asset/img/facebook.png" alt="���̽���"></a>
          </ul>
        </div>
      </div>

    </div>
  </div>



</body>

</html>