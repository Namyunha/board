<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-03
  Time: 오전 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>

<body>
<%@include file="../component/mainheader.jsp" %>
<form action="/board/save" name="boardSave" method="post" enctype="multipart/form-data">
    <label for="boardWriter">작성자</label>
    <input type="text" id="boardWriter" name="boardWriter" value=""><br>
    <label for="boardPass">글 비밀번호</label>
    <input type="text" id="boardPass" name="boardPass"><br>
    <label for="boardTitle">글 제목</label>
    <input type="text" id="boardTitle" name="boardTitle"><br>
    <label for="boardContents">내용</label><br>
    <textarea name="boardContents" id="boardContents" cols="30" rows="10"></textarea> <br>
    <input type="file" name="boardFile" multiple> <br>
    <input onclick="boardSubmit()" type="button" value="작성하기">
</form>
</body>
<script>
    const boardSubmit = () => {
        boardSave.submit();
    }
</script>
</html>
