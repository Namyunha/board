<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-02
  Time: 오전 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<button onclick="ajax06()">함수호출</button>
</body>
<script>
  const var1 = "hello monday";
  const ajax06 = () => {
    const memberEmail = "aa@aaa.com";
    const memberPasswor = "1a2a3a"
    const memeberName = "member1";
    $.ajax({
      type: "get",
      url: "/ajax06",
      data: {
        "memberEmail": memberEmail,
        "memberPassword": memberPasswor,
        "memberName": memeberName
      },
      success: function (res) {
        console.log("요청성공", res);
        console.log(res.memberEmail)
        console.log(res.memberPassword)
        console.log(res.memberName)
      },
      error: function () {
        console.log("요청실패");
      }
    });
  }
</script>
</html>
