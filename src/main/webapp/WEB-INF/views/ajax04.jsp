<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-02
  Time: 오전 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<button onclick="ajax04()">함수호출</button>
</body>
<script>
  const var1 = "hello monday";
  const ajax04 = () => {
    $.ajax({
      type: "get",
      url: "/ajax04",
      data: {
        param1: var1,
        param2: "hi hi",
        qqq: "asdasd"
      },
      success: function (res) {
        console.log("요청성공", res);
      },
      error: function () {
        console.log("요청실패");
      }
    });
  }
</script>
</html>
