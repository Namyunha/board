const findAll = () => {
    const listArea = document.querySelector("#listArea");
    $.ajax({
        type: "get",
        url: "/admin/list",
        success: function (res) {
            console.log("성공");
            let output = "<table class='table'>";
            output += "<tr>";
            output += "<th>아이디</th>";
            output += "<th>비밀번호</th>";
            output += "<th>이름</th>";
            output += "<th>생일</th>";
            output += "<th>성별</th>";
            output += "<th>이메일</th>";
            output += "<th>전화번호</th>";
            output += "</tr>";
            for (i in res) {
                output += "<tr>";
                output += "<td>" + res[i].memberId + "</td>";
                output += "<td>" + res[i].memberPassword + "</td>";
                output += "<td>" + res[i].memberName + "</td>";
                output += "<td>" + res[i].memberBirth + "</td>";
                output += "<td>" + res[i].gender + "</td>";
                output += "<td>" + res[i].memberEmail + "</td>";
                output += "<td>" + res[i].memberMobile + "</td>";
                output += "</tr>"
            }
            output += "</table>"
            listArea.innerHTML = output;
        },
        error: function () {
            console.log("실패");
        }
    })
}