const joinForm = document.querySelector("#main_form");


function handleJoin(event) {
    event.preventDefault();
    let memberId = document.querySelector("#memberId");
    const exp = /^(?=.*[a-z])[a-z\d]{5,10}$/;
    if(memberId.match(exp)){

    }else {

    }
}

joinForm.addEventListener("submit", handleJoin);