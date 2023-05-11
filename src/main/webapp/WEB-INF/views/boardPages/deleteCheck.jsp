<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-03
  Time: 오전 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form name="deleteForm" action="/board/delete-check?id=${deleteBoard.id}" method="get">
    <input type="text" id="boardPass" name="boardPass" value="글작성비밀번호">
    <button onclick="deleteCheck(`${deleteBoard.boardPass}`)">확인</button>
</form>
</body>
<script>
    deleteCheck = (dbPass) => {
        const inputPass = document.getElementById("boardPass").value;
        if (inputPass == dbPass) {
            deleteForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다.")
        }
    }
</script>
</html>
