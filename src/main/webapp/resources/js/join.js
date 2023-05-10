


const join = () => {
    main_form.submit();
}


const viewUser = (id) => {
    location.href = "memberDetail?id=" + id;
}

const bbb = () => {
    const memberEmail = document.querySelector("#memberEmail").value;
    const checkEmail = document.querySelector("#checkEmail");
    $.ajax({
        type: "post",
        url: "/duCheck",
        data: {
            "memberEmail": memberEmail,
        },
        success: function () {
            checkEmail.innerHTML = "사용가능한 이메일입니다";
            checkEmail.style.color = "green"
        },
        error: function (){
            checkEmail.innerHTML = "중복된 이메일입니다";
            checkEmail.style.color = "red"
        }
    })
}

const aaa = () => {
    const checkId = document.querySelector("#memberId").value;
    const checkIdResult = document.querySelector("#checkIdResult");
    const exp = /^(?=.*[a-z])(?=.*\d)[a-z\d]{6,12}$/;
    if (checkId.match(exp)) {
        $.ajax({
            type: "post",
            url: "/search",
            data: {
                "checkId": checkId,
            },
            success: function () {
                checkIdResult.innerHTML = "사용가능한 아이디입니다";
                checkIdResult.style.color = "green"
            },
            error: function () {
                checkIdResult.innerHTML = "이미 사용중인 아이디입니다";
                checkIdResult.style.color = "red"
            }
        })
    } else {
        checkIdResult.innerHTML = "영소문자,숫자 포함 6~12자리로 입력";
        checkIdResult.style.color = "red"
    }
}

const checkPass = () => {
    const password = document.querySelector("#memberPassword").value;
    const checkPassword = document.querySelector("#checkPassword").value;
    const checkIdResult = document.querySelector("#checkPwResult");
    if (password == checkPassword) {
        checkIdResult.innerHTML = "비밀번호가 일치합니다";
        checkIdResult.style.color = "green"
    } else {
        checkIdResult.innerHTML = "비밀번호가 일치하지 않습니다.";
        checkIdResult.style.color = "red"
    }
}

const password = () => {
    const password = document.querySelector("#memberPassword").value;
    const exp = /^(?=.*[a-z])(?=.*\d)[a-z\d]{6,12}$/;
    const checkPwResult = document.querySelector("#checkPw");
    const ducheck = document.querySelector("#checkPassword");
    const ducheckResult = document.querySelector("#checkPwResult");
    if(password.match(exp)){
        checkPwResult.innerHTML = "사용가능한 비밀번호입니다.";
        checkPwResult.style.color = "green"
        ducheck.disabled=false;
    }else{
        ducheck.disabled=true;
        ducheck.value="";
        ducheckResult.innerHTML=""
        checkPwResult.innerHTML = "영소문자,숫자 포함 6~12자리로 입력";
        checkPwResult.style.color = "red"
    }

}