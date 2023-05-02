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