<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-02
  Time: 오전 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<button onclick="ajax09()">함수호출</button>
</body>
<script>
    const ajax09 = () => {
        $.ajax({
            type: "post",
            url: "/ajax09",
            data: {
                "memberEmail": "ㄴㅇㅁㄴㅇ@ㅁㅁㅁ.com",
                "memberPassword": "1a2a3a",
                "memberName": "회원"
            },
            success: function (res) {
                console.log("요청성공", res);
                console.log(res.memberEmail);
                console.log(res.memberPassword);
                console.log(res.memberName);
            },
            error: function () {
                console.log("요청실패");
            }
        });
    }
</script>
</html>
