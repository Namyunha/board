// const joinForm = document.querySelector("#main_form");
// const memberId = document.querySelector("#memberId");

// function duCheckId(){
//     const checkId = memberId.value;
//     const checkIdResult = document.querySelector("#checkIdResult");
//     $.ajax({
//         type: "post",
//         url: "/search",
//         data: {
//             "checkId": checkId
//         },
//         success: function(){
//             checkIdResult.innerHTML = "사용가능한 아이디입니다";
//             checkIdResult.style.color = "green"
//         },
//         error : function() {
//             checkIdResult.innerHTML = "이미 사용중인 이메일입니다";
//             checkIdResult.style.color = "red"
//         }
//     })
// }

// memberId.addEventListener("onblur", duCheckId);
// function handleJoin(event) {
//     event.preventDefault();
//     let memberId = document.querySelector("#memberId");
//     const exp = /^(?=.*[a-z])[a-z\d]{5,10}$/;
//     if(memberId.match(exp)){
//
//     }else {
//
//     }
// }

// joinForm.addEventListener("submit", handleJoin);