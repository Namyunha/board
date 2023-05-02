<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-01
  Time: 오전 8:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/style.css">
    <title>Title</title>
</head>
<body>
<header id="main_header">
    <ul id="main_header_left" class="main_header_ul">
        <li class="main_header_li"><a href="/">icon</a></li>
        <li class="main_header_li"><a href="#">shop</a></li>
        <li class="main_header_li"><a href="#">review</a></li>
        <li class="main_header_li"><a href="#">community</a></li>
        <li class="main_header_li"><a href="#">about</a></li>
    </ul>
    <ul id="main_header_right" class="main_header_ul">
        <li><a href="#">cart</a></li>
        <li><a href="#">mypage</a></li>
        <li><a href="#">profile</a></li>
    </ul>
</header>
<script>
    const join = () => {
        main_form.submit();
    }
</script>
<main>
    <div id="main_wrapper">
        <div id="main_form_wrapper"  class="main_content">
            <form action="/join" method="post" name="main_form" id="main_form" class="main_content">
                <label for="memberId" onblur="checkId()">아이디</label>
                    <input type="text" id="memberId" name="memberId">
                <label for="memberPassword">비밀번호</label>
                    <input type="text" id="memberPassword" name="memberPassword">
                <label for="checkPassword">비밀번호 재확인</label>
                    <input type="text" id="checkPassword" name="checkPassword" >
                <label for="memberName">이름</label>
                    <input type="text" id="memberName" name="memberName" >
                <label for="memberBirth">생년월일</label>
                    <input type="text" id="memberBirth" name="memberBirth" >
                <label for="gender">성별</label>
                <select name="gender" id="gender">
                    <option value="">성별</option>
                    <option value="male">남</option>
                    <option value="female">여</option>
                </select>
                <label for="memberEmail">이메일</label>
                    <input type="text" id="memberEmail" name="memberEmail" >
                <label for="memberMobile">휴대전화</label>
                    <input type="text" id="memberMobile" name="memberMobile"  >
                <button onclick="join()">가입하기</button>
            </form>
        </div>
    </div>
</main>
<footer>
    footer
</footer>
<script src="/resources/js/join.js">
</script>
</body>
</html>
