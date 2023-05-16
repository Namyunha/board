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
    <script src="/resources/js/update.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
<%@include file="../component/mainheader.jsp" %>
<div id="main">
    <form action="/update" method="post">
        <table>
            <tr>
                <th>No</th>
                <td><input type="text" value="${memberDTO.id}"></td>
            </tr>
            <tr>
                <th>id</th>
                <td><input type="text" value="${memberDTO.memberId}"></td>
            </tr>
            <tr>
                <th>password</th>
                <td><input type="text" value="${memberDTO.memberPassword}"></td>
            </tr>
            <tr>
                <th>name</th>
                <td><input type="text" value="${memberDTO.memberName}"></td>
            </tr>
            <tr>
                <th>birth</th>
                <td><input type="text" value="${memberDTO.memberBirth}"></td>
            </tr>
            <tr>
                <th>gender</th>
                <td><input type="text" value="${memberDTO.gender}"></td>
            </tr>
            <tr>
                <th>email</th>
                <td><input type="text" value="${memberDTO.memberEmail}"></td>
            </tr>
            <tr>
                <th>mobile</th>
                <td><input type="text" value="${memberDTO.memberMobile}"></td>
            </tr>
            <c:if test="${memberDTO.fileAttached == 1}">
                <tr>
                    <th>image</th>
                    <td>
                        <c:forEach items="${memberFileList}" var="memberFile">
                            <img id=${memberFile.id} src="${pageContext.request.contextPath}/upload/${memberFile.storedFileName}"
                                 alt="" width="100" height="100">
                            <button onclick="deleteImg(`${memberFile.MemberId}`)">X</button>
                        </c:forEach>
                    </td>
                </tr>
            </c:if>
            <tr>
                <th>파일추가하기</th>
                <td><input type="file" id="memberProfile" name="memberProfile" multiple></td>
            </tr>
            <tr>
                <th>
                    <button onclick="update()">수정</button>
                </th>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
