<%--
  Created by IntelliJ IDEA.
  User: lkm
  Date: 2023-05-03
  Time: 오전 5:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/list.css">
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="/resources/js/join.js"></script>
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
    <div id="ajax-result"></div>
</header>
<div id="main">
    <table>
        <tr>
            <th>No</th>
            <th>id</th>
            <th>password</th>
            <th>name</th>
            <th>조회</th>
            <th>삭제</th>
        </tr>
        <c:forEach items="${memberList}" var="member">
            <tr>
                <td>${member.id}</td>
                <td>${member.memberId}</td>
                <td>${member.memberPassword}</td>
                <td>${member.memberName}</td>
                <td>
                    <button onclick="viewUser(`${member.id}`)">조회</button>
                </td>
                <td>삭제</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
