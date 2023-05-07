<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-03
  Time: 오후 6:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/board/search" method="post">
    <label for="search">검색</label>
    <select name="search" id="search">
        <option value="">선택</option>
        <option name="" value="boardTitle">제목</option>
        <option name="" value="boardContents">내용</option>
        <option name="" value="boardWriter">작성자</option>
    </select>
    <input type="text" id="" name="">
    <button onclick="searchBtn()">검색</button>
</form>
<div id="resultArea"></div>
</body>
<script>
    const resultArea = document.querySelector("#resultArea");
    const searchBtn = () => {

    }
</script>
</html>
