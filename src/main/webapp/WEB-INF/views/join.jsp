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
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="/resources/js/join.js"></script>
<%--    <script defer src="/resources/js/join.js"></script>--%>
</head>
<body>
<%--<header id="main_header">--%>
<%--    <ul id="main_header_left" class="main_header_ul">--%>
<%--        <li class="main_header_li"><a href="/">icon</a></li>--%>
<%--        <li class="main_header_li"><a href="#">shop</a></li>--%>
<%--        <li class="main_header_li"><a href="#">review</a></li>--%>
<%--        <li class="main_header_li"><a href="#">community</a></li>--%>
<%--        <li class="main_header_li"><a href="#">about</a></li>--%>
<%--    </ul>--%>
<%--    <ul id="main_header_right" class="main_header_ul">--%>
<%--        <li><a href="#">cart</a></li>--%>
<%--        <li><a href="#">mypage</a></li>--%>
<%--        <li><a href="#">profile</a></li>--%>
<%--    </ul>--%>
<%--</header>--%>

<main>
    <div id="main_wrapper">
        <div id="main_form_wrapper"  class="main_content">
            <form action="/join" method="post" name="main_form" id="main_form" class="main_content" enctype="multipart/form-data">
                <label for="memberId" >아이디</label>
                    <input type="text" onblur="aaa()" id="memberId" name="memberId">
                <p id="checkIdResult"></p>
                <label for="memberPassword">비밀번호</label>
                    <input type="text" onblur="password()" id="memberPassword" name="memberPassword">
                <p id="checkPw"></p>
                <label for="checkPassword">비밀번호 재확인</label>
                    <input onblur="checkPass()" type="text" id="checkPassword" name="checkPassword" disabled>
                <p id="checkPwResult"></p>
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
                    <input type="text" onblur="bbb()" id="memberEmail" name="memberEmail" >
                <p id="checkEmail"></p>
                <label for="memberMobile">휴대전화</label>
                    <input type="text" id="memberMobile" name="memberMobile"  >
                <input type="file" id="memberProfile" name="memberProfile" multiple>
                <button onclick="join()" >가입하기</button>
            </form>
        </div>
    </div>
</main>
<script>
</script>

</body>
</html>
