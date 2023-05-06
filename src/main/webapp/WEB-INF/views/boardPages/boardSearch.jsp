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
<form action="searchBoard" method="post">
    <label for="boardTitle">제목검색</label>
    <input type="text" id="boardTitle" name="boardTitle">
    <input type="submit" value="검색하기">
</form>
<div id="resultArea"></div>
</body>
<script>
    const resultArea = document.querySelector("#resultArea");

</script>
</html>
