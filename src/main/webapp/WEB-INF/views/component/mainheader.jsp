<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-10
  Time: 오후 7:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header id="main_header">
  <c:choose>
    <c:when test="${loginDTO==null}">
      <ul id="main_header_left" class="main_header_ul">
        <li class="main_header_li"><a href="/"><i class="bi bi-house"></i></a></li>
        <li class="main_header_li"><a href="#">shop</a></li>
        <li class="main_header_li"><a href="#">review</a></li>
        <li class="main_header_li"><a href="/board/index">community</a></li>
        <li class="main_header_li"><a href="#">about</a></li>
      </ul>
      <ul id="main_header_right" class="main_header_ul">
        <li><a href="#">cart</a></li>
        <li><a href="#">mypage</a></li>
        <li><a href="#">profile</a></li>
      </ul>
    </c:when>
    <c:otherwise>
      <ul id="main_header_left" class="main_header_ul">
        <li class="main_header_li"><a href="/"><i class="bi bi-house"></i></a></li>
        <li class="main_header_li"><a href="#">shop</a></li>
        <li class="main_header_li"><a href="#">review</a></li>
        <li class="main_header_li"><a href="/board/index">community</a></li>
        <li class="main_header_li"><a href="#">about</a></li>
      </ul>
      <ul id="main_header_right" class="main_header_ul">
        <li><a href="/logout">logout</a></li>
        <li><a href="#">cart</a></li>
        <li><a href="/memberDetail?memberEmail=${loginDTO}">mypage</a></li>
        <li><a href="#">profile</a></li>
      </ul>
    </c:otherwise>
  </c:choose>
</header>
