<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-03
  Time: 오전 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<script>
    const result =
    ${result}
    if (result > 0) {
        alert("회원가입에 성공")
    } else {
        alert("회원가입실패")
    }
</script>
<body>
<h2>i'm list</h2>
<a href="board">home</a>
<table>
    <tr>
        <th>No</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성시간</th>
    </tr>
    <c:forEach items="${boardList}" var="board">
        <tr>
            <td onclick="board_detail_ajax(`${board.id}`)">${board.id}</td>
            <td>${board.boardTitle}</td>
            <td>${board.boardWriter}</td>
            <td>${board.board_created_time}</td>
            <td>
                <button onclick="board_update(`${board.id}`)">수정하기</button>
            </td>
            <td>
                <button onclick="board_delete(`${board.id}`)">삭제하기</button>
            </td>
        </tr>
    </c:forEach>
</table>
<div>
    <button onclick="page1()">1</button>
    <button onclick="page2()">2</button>
</div>
<div id="ajax-area"></div>
<script>
    const board_detail_ajax = (id) => {
        const resultArea = document.querySelector("#ajax-area");
        $.ajax({
            type: "get",
            url: "/ajax-detail",
            data: {
                "id": id
            },
            success: function (res) {
                let ajaxArea = "<table>";
                ajaxArea += "<tr>";
                ajaxArea += "<th>작성자</th>";
                ajaxArea += "<th>비밀번호</th>";
                ajaxArea += "<th>제목</th>";
                ajaxArea += "<th>내용</th>";
                ajaxArea += "<th>작성시간</th>";
                ajaxArea += "<th>최근수정시간</th>";
                ajaxArea += "<th>조회수</th>";
                ajaxArea += "<th>첨부파일</th>";
                ajaxArea += "</tr>";
                ajaxArea += "<tr>";
                ajaxArea += "<td>" + res.boardWriter + "</td>";
                ajaxArea += "<td>" + res.boardPass + "</td>";
                ajaxArea += "<td>" + res.boardTitle + "</td>";
                ajaxArea += "<td>" + res.boardContents + "</td>";
                ajaxArea += "<td>" + res.board_created_time + "</td>";
                ajaxArea += "<td>" + res.board_updated_time + "</td>";
                ajaxArea += "<td>" + res.board_hits + "</td>";
                ajaxArea += "<td>" + res.board_file_attached + "</td>";
                ajaxArea += "</tr>"
                ajaxArea += "</table>"
                resultArea.innerHTML = ajaxArea;
            },
            error: function () {
                alert("일치하는 정보가 없습니다.")
            }
        })
    }
    const board_delete = (id) => {
        location.href = "/deleteCheck?id="+id;
    }
    const board_update = (id) => {
        location.href = "/boardUpdate?id=" + id;
    }
    const page1 = () => {
        location.href = "boardList";
    }
    const page2 = () => {
        location.href = "boardList2"
    }
</script>
</body>
</html>
