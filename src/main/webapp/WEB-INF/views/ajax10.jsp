<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-02
  Time: 오전 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<button onclick="ajax10()">함수호출</button>
<div id="result-area"></div>
</body>
<script>
    const ajax10 = () => {
        const member = {
            "memberEmail": "ㄴㅇㅁㄴㅇ@ㅁㅁㅁ.com",
            "memberPassword": "1a2a3a",
            "memberName": "회원"
        };
        $.ajax({
            type: "post",
            url: "/ajax10",
            data: JSON.stringify(member),
            contentType: "application/json",

            success: function (res) {
                console.log("요청성공", res);
                console.log("name", res.member.memberName);
                for(let i in res.memberList){
                    console.log(res.memberList[i]);
                }
            },
            error: function () {
                console.log("요청실패");
            }
        });
    }
</script>
</html>
