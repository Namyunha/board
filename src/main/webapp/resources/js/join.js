const join = () => {
    main_form.submit();
}

const checkId = () => {
    const checkId = document.querySelector("#memberId").value;
    const checkIdResult = document.querySelector("#checkIdResult");
    $.ajax({
        type: "post",
        url: "/search",
        data: {
            "checkId": checkId
        },
        success: function () {
            checkIdResult.innerHTML = "사용가능한 아이디입니다";
            checkIdResult.style.color = "green"
        },
        error: function () {
            checkIdResult.innerHTML = "이미 사용중인 이메일입니다";
            checkIdResult.style.color = "red"
        }
    })
}
const viewUser = (id) => {
    location.href = "memberDetail?id=" + id;
}

// const ajaxDetail = (id) => {
//     const detailArea = document.querySelector("#ajax-result");
//     $.ajax({
//         type: "post",
//         url: "/detail-ajax",
//         data: {
//             "id" : id
//         },
//         success: function (res) {
//            let result = <table>;
//            result += <tr>;
//            result += <td>memberDTO.memberId</td>;
//            result += <td>memberDTO.memberPassword</td>;
//         }
//     })
// }
