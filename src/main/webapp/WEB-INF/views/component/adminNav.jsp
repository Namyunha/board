<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="nav">
    <ul>
        <li>
            <a href="/">
                <i class="bi bi-house"></i>
            </a>
        </li>
        <li>
            <a onclick="findAll()">회원관리</a>
        </li>
        <li>
            <a href="#">상품관리</a>
        </li>
        <li>
            <a href="#">주문관리</a>
        </li>
        <li>
            <a href="/member/logout">Logout</a>
        </li>
    </ul>
</div>