<%--
  Created by IntelliJ IDEA.
  User: lkm
  Date: 2023-05-01
  Time: 오전 6:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<script>
    const login = () => {
        loginForm.submit();
    }
</script>
<%--<script>--%>
<%--    const result = ${result};--%>
<%--    if (result > 0) {--%>
<%--        alert(`${dto.memberName}님의 회원가입을 축하드립니다.`)--%>
<%--    } else {--%>
<%--        alert("회원가입실패!")--%>
<%--    }--%>
<%--</script>--%>
<body>
<%@include file="./component/mainheader.jsp" %>
<main>
    <c:choose>
            <c:when test="${loginDTO==null}">
                <div id="main_wrapper">
                    <div id="main_logo" class="main_content">logo</div>
                    <div id="main_form_wrapper" class="main_content">
                        <form action="/" name="login_form" method="post" id="main_form" class="main_content">
                            <input type="text" id="memberId" name="memberId" placeholder="아이디">
                            <input type="text" id="memberPassword" name="memberPassword" placeholder="비밀번호">
                            <button onclick="login()">로그인</button>
                        </form>
                    </div>
                        <%--<a href="index2">index2</a>--%>
                    <div id="main_search" class="main_content">
                        <span><a href="#">아이디 찾기</a></span>
                        <span><a href="#">비밀번호 찾기</a></span>
                        <span><a href="/member/join">회원가입</a></span>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <h2>${loginDTO}님 환영합니다</h2>
            </c:otherwise>
    </c:choose>
</main>
<footer>
</footer>
<script>
    const goAdmin = () => {
        let sign = prompt("관리자 비밀번호를 적어주세요");
        if (sign == 999) {
            location.href = "/admin";
        } else {
            alert("비밀번호가 틀렸습니다")
        }
    }
</script>
</body>
</html>
