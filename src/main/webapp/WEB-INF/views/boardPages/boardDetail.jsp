<%--
  Created by IntelliJ IDEA.
  User: lkm
  Date: 2023-05-06
  Time: 오전 8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/main.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>

<div id="section">
    <table>
        <tr>
            <th>id</th>
            <td>${board.id}</td>
        </tr>
        <tr>
            <th>writer</th>
            <td>${board.boardWriter}</td>
        </tr>
        <tr>
            <th>date</th>
            <td>
                <fmt:formatDate value="${board.boardCreatedDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
            </td>
        </tr>
        <tr>
            <th>hits</th>
            <td>${board.boardHits}</td>
        </tr>
        <tr>
            <th>title</th>
            <td>${board.boardTitle}</td>
        </tr>
        <tr>
            <th>contents</th>
            <td>${board.boardContents}</td>
        </tr>
        <c:if test="${board.fileAttached == 1}">
            <tr>
                <th>image</th>
                <td>
                    <c:forEach items="${boardFileList}" var="boardFile">
                        <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFileName}"
                             alt="" width="100" height="100">
                    </c:forEach>
                </td>
            </tr>
        </c:if>
    </table>
    <div id="commentArea">
        <c:choose>
            <c:when test="${commentList == null}">
                <h2>작성된 댓글이 없습니다.</h2>
            </c:when>
            <c:otherwise>
                <table>
                    <tr>
                        <th>id</th>
                        <th>작성자</th>
                        <th>내용</th>
                        <th>작성시간</th>
                    </tr>
                    <c:forEach items="${commentList}" var="comment">
                        <tr>
                            <td>${comment.id}</td>
                            <td>${comment.commentWriter}</td>
                            <td>${comment.commentContents}</td>
                            <td>
                                <fmt:formatDate value="${comment.commentCreatedDate}"
                                                pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <div id="resultArea"></div>
            </c:otherwise>
        </c:choose>
    </div>
    <c:choose>
        <c:when test="${loginId != null}">
            <div>
                <label for="writer">댓글작성자</label>
                <input type="text" name="writer" id="writer" value="${loginId}">
                <label for="commentContents">내용</label><br>
                <textarea name="commentContents" id="commentContents" cols="50" rows="5"></textarea> <br>
                <button onclick="commentWrite(${board.id})" type="submit">댓글작성</button>
            </div>
        </c:when>
    </c:choose>
    <button onclick="board_list()">목록</button>
    <c:choose>
        <c:when test="${board.boardWriter==loginId}">
            <button onclick="board_update()">수정</button>
            <button onclick="board_delete()">삭제</button>
        </c:when>
    </c:choose>
</div>
<%@include file="../component/footer.jsp" %>
</body>
<script>
    const commentWrite = (id) => {
        const result = document.querySelector("#commentArea");
        const writer = document.querySelector("#writer").value;
        const contents = document.querySelector("#commentContents").value;
        const comment = {
            "commentWriter": writer,
            "commentContents": contents,
            "boardId": id
        };
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: JSON.stringify(comment),
            contentType: "application/json",
            success: function (res) {
                console.log("등록성공!")
                let output = "<table>";
                output += "<tr>";
                output += "<th>id</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th>";
                output += "</tr>"
                for (let i in res) {
                    output += "<tr>";
                    output += "<td>" + res[i].id + "</td>";
                    output += "<td>" + res[i].commentWriter + "</td>";
                    output += "<td>" + res[i].commentContents + "</td>";
                    output += "<td>" + moment(res[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss") + "</td>";
                    output += "</tr>";
                }
                output += "</table>"
                result.innerHTML = output;
                document.getElementById("writer").value = "";
                document.getElementById("commentContents").value = "";
            },
            error: function () {
                console.log("등록실패!")
            }
        })
    }

    const board_list = () => {
        const page = ${page};
        location.href = "/board/paging?page=" + page;
    }
    const board_update = () => {
        const id = '${board.id}';
        location.href = "/board/update?id=" + id;
    }
    const board_delete = () => {
        const id = '${board.id}';
        location.href = "/board/delete?id=" + id;
    }
</script>
</html>
