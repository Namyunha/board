<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-01
  Time: 오전 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="/resources/css/style.css">
    <title>Title</title>
</head>
<body>
<header id="main_header">
  <ul id="main_header_left" class="main_header_ul">
    <li class="main_header_li"><a href="/">icon</a></li>
    <li class="main_header_li"><a href="#">shop</a></li>
    <li class="main_header_li"><a href="#">review</a></li>
    <li class="main_header_li"><a href="#">community</a></li>
    <li class="main_header_li"><a href="#">about</a></li>
  </ul>
  <ul id="main_header_right" class="main_header_ul">
    <li><a href="#">cart</a></li>
    <li><a href="#">mypage</a></li>
    <li><a href="#">profile</a></li>
  </ul>
</header>
<main>
  <h2>${dto.memberId}님 환영합니다</h2>
</main>
<footer>
</footer>
</body>
</html>
