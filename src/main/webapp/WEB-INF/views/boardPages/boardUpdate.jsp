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
    <form action="/board/update" name="boardForm" method="post">
        <input type="text" name="id" value="${boardDTO.id}"><br>
        <label for="boardTitle">제목</label>
        <input type="text" id="boardTitle" name="boardTitle" value="${boardDTO.boardTitle}"><br>
        <label for="boardContents">내용</label>
        <input type="text" id="boardContents" name="boardContents" value="${boardDTO.boardContents}"><br>
        <label for="boardPass">비밀번호입력</label>
        <input type="text" id="boardPass" name="boardPass" placeholder="비밀번호를입력해주세요"><br>
        <button onclick="boardUpdate(`${boardDTO.boardPass}`)">수정하기</button>
    </form>
</body>
<script>
    const boardUpdate = (dbPass) => {
        const boardPass = document.querySelector("#boardPass").value;
        if(boardPass == dbPass){
            boardForm.submit();
            alert("수정이 완료됐습니다.")
        } else {
            location.href ="/board/";
            alert("비밀번호를 확인해주세요")
        }
    }
</script>
</html>
