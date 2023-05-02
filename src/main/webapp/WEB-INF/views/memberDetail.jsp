<%--
  Created by IntelliJ IDEA.
  User: lkm
  Date: 2023-05-03
  Time: 오전 6:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/list.css">
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
<div id="main">
    <table>
        <tr>
            <th>No</th>
            <th>id</th>
            <th>password</th>
            <th>name</th>
            <th>birth</th>
            <th>gender</th>
            <th>email</th>
            <th>mobile</th>
            <th>삭제</th>
        </tr>
            <tr>
                <td>${memberDTO.id}</td>
                <td>${memberDTO.memberId}</td>
                <td>${memberDTO.memberPassword}</td>
                <td>${memberDTO.memberName}</td>
                <td>${memberDTO.memberBirth}</td>
                <td>${memberDTO.gender}</td>
                <td>${memberDTO.memberEmail}</td>
                <td>${memberDTO.memberMobile}</td>
                <td>삭제</td>
            </tr>
    </table>
</div>
</body>
</html>
