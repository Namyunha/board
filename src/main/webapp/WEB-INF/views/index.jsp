<%--
  Created by IntelliJ IDEA.
  User: lkm
  Date: 2023-05-01
  Time: 오전 6:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/style.css">
    <title>Title</title>
</head>
<script>
    const result = ${result};
    if (result > 0) {
        alert(`${dto.memberName}님의 회원가입을 축하드립니다.`)
    } else {
        alert("회원가입실패!")
    }
</script>
<body>
<header id="main_header">
    <ul id="main_header_left" class="main_header_ul">
        <li class="main_header_li"><a href="/">icon</a></li>
        <li class="main_header_li"><a href="#">shop</a></li>
        <li class="main_header_li"><a href="#">review</a></li>
        <li class="main_header_li"><a href="/board">community</a></li>
        <li class="main_header_li"><a href="#">about</a></li>
    </ul>
    <ul id="main_header_right" class="main_header_ul">
        <li><a href="#">cart</a></li>
        <li><a href="#">mypage</a></li>
        <li><a href="#">profile</a></li>
    </ul>
</header>
<script>
    const login = () => {
        loginForm.submit();
    }

</script>
<main>
    <div id="main_wrapper">
        <div id="main_logo" class="main_content">logo</div>
        <div id="main_form_wrapper" class="main_content">
            <form action="/" name="login_form" method="post" id="main_form" class="main_content">
                <input type="text" id="memberId" name="memberId" placeholder="아이디">
                <input type="text" id="memberPassword" name="memberPassword" placeholder="비밀번호">
                <button onclick="login()">로그인</button>
            </form>
        </div>
<%--        <a href="index2">index2</a>--%>
        <div id="main_search" class="main_content">
            <span><a href="#">아이디 찾기</a></span>
            <span><a href="#">비밀번호 찾기</a></span>
            <span><a href="join">회원가입</a></span>
        </div>
    </div>
</main>
<footer>
</footer>
</body>
</html>
