<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-03
  Time: 오전 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/boardUpdate" name="boardForm" method="post">
        <input type="text" name="id" value="${boardDTO.id}">
        <label for="boardTitle">제목</label>
        <input type="text" id="boardTitle" name="boardTitle" value="${boardDTO.boardTitle}">
        <label for="boardContents">내용</label>
        <input type="text" id="boardContents" name="boardContents" value="${boardDTO.boardContents}">
        <input type="submit" value="수정하기">
    </form>
</body>
<script></script>
</html>
