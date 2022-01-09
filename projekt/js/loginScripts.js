let id;

function chooseAccountAndLogin(element) {
    id = element.id
    // for (let userChooseButton of document.getElementsByClassName("userChooseButton")) {
    for (let userChooseButton of document.getElementsByClassName("btn btn-primary btn-lg")) {
        userChooseButton.style.display = "none"
    }
    let loggingInAsType = document.getElementById("loggingInAsType")
    if (id === "organizerLogin") {
        loggingInAsType.innerText = "Logowanie jako Organizator"
    } else {
        loggingInAsType.innerText = "Logowanie jako Użytkownik"
    }
    loggingInAsType.style.display = "initial"
    for (let userChooseButton of document.getElementsByClassName("loginLabel")) {
        userChooseButton.style.display = "initial"
    }
    for (let userChooseButton of document.getElementsByClassName("loginButton")) {
        userChooseButton.style.display = "initial"
    }
}

function login() {
    const loginRequest = new XMLHttpRequest()
    let login = document.getElementById("login")
    let password = document.getElementById("password")
    loginRequest.open("POST", 'http://localhost:8000/login/', true);
    loginRequest.setRequestHeader('Content-Type', 'application/json');
    loginRequest.send(JSON.stringify({
        loginType: id,
        login: login.value,
        password: password.value,
    }));
    loginRequest.onload = function () {
        if (loginRequest.responseText === "true") {
            if(id === "organizerLogin") {
                document.location.href = "mainPageOrganizer.html"
                window.sessionStorage.setItem("loginStatus", "organizer")
            }
            else {
                document.location.href = "mainPageUser.html"
                window.sessionStorage.setItem("loginStatus", "user")
            }
        }  else {
            //alert("Niepoprawne dane logowania!")
        }
    }

}

function logOut() {
    window.sessionStorage.setItem("loginStatus", null)
}

function redirectToProperMainPage() {
    if (window.sessionStorage.getItem("loginStatus") === "organizer") {
        window.location.href = "mainPageOrganizer.html"
    } else if (window.sessionStorage.getItem("loginStatus") === "user") {
        window.location.href = "mainPageUser.html"
    } else {
        window.location.href = "mainPageLoggedOut.html"
    }
}