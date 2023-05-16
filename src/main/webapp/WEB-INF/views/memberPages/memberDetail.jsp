<%--
  Created by IntelliJ IDEA.
  User: lkm
  Date: 2023-05-03
  Time: 오전 6:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/detail.css">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
<%@include file="../component/mainheader.jsp" %>
<div id="main">
    <table>
        <tr>
            <th>No</th>
            <td>${memberDTO.id}</td>
        </tr>
        <tr>
            <th>id</th>
            <td>${memberDTO.memberId}</td>
        </tr>
        <tr>
            <th>password</th>
            <td>${memberDTO.memberPassword}</td>
        </tr>
        <tr>
            <th>name</th>
            <td>${memberDTO.memberName}</td>
        </tr>
        <tr>
            <th>birth</th>
            <td>${memberDTO.memberBirth}</td>
        </tr>
        <tr>
            <th>gender</th>
            <td>${memberDTO.gender}</td>
        </tr>
        <tr>
            <th>email</th>
            <td>${memberDTO.memberEmail}</td>
        </tr>
        <tr>
            <th>mobile</th>
            <td>${memberDTO.memberMobile}</td>
        </tr>
        <tr>
            <th><a href="/member/update?id=${memberDTO.id}">수정</a></th>
            <td><a href="">삭제</a></td>
        </tr>
        <c:if test="${memberDTO.fileAttached == 1}">
            <tr>
                <th>image</th>
                <td>
                    <c:forEach items="${memberFileList}" var="memberFile">
                        <img src="${pageContext.request.contextPath}/upload/${memberFile.storedFileName}"
                             alt="" width="100" height="100">
                    </c:forEach>
                </td>
            </tr>
        </c:if>
    </table>
</div>
</body>
</html>
