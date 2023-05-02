<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-02
  Time: 오전 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<button onclick="ajax08()">함수호출</button>
<div id="result-area">
</div>
</body>
<script>
  const ajax08 = () => {
    const member = {
      "memberEmail" : "ㄴㅇㅁㄴㅇ@ㅁㅁㅁ.com",
      "memberPassword" : "1a2a3a",
      "memberName" : "회원"
    };
    $.ajax({
      type: "post",
      url: "/ajax08",
      // js object -> JSON 변환
      data:JSON.stringify(member),
      // 서버에게 보내는 데이터의 타입을 지정
      contentType: "application/json",

      success: function (res) {
        console.log("요청성공", res);
        const resultArea = document.getElementById("result-area");
        let result = "<table>";
        for(let i in res) {
          result += "<tr>";
          result += "<td>" + res[i].memberEmail + "</td>";
          result += "<td>" + res[i].memberPassword + "</td>";
          result += "<td>" + res[i].memberName + "</td>";
          result += "</tr>";
        }
        result += "</table>";
        resultArea.innerHTML = result;
      },
      error: function () {
        console.log("요청실패");
      }
    });
  }
</script>
</html>
