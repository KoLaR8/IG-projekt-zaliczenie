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
    }
    else {
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
    let login = document.getElementById("login")
    let password = document.getElementById("password")
    if(login.value === "test" && password.value === "test") {
        if (id === "organizerLogin") {
            window.location = "mainPageOrganizer.html"
            window.sessionStorage.setItem("loginStatus", "organizer")
        } else {
            window.location = "mainPageUser.html"
            window.sessionStorage.setItem("loginStatus", "user")
        }
    }
    else {
        alert("Niepoprawne dane logowania!")
    }
}

function redirectToProperMainPage() {
    if(window.sessionStorage.getItem("loginStatus") === "organizer") {
        window.location.href = "mainPageOrganizer.html"
    }
    else {
        window.location.href = "mainPageUser.html"
    }
}