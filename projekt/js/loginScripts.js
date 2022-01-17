let id;

const logInLink = document.createElement("li");
logInLink.setAttribute("class", "nav-item");
Object.assign(logInLink, {
    class: 'nav-item',
})
const logInLink_a = document.createElement("a")
logInLink_a.setAttribute("class", "nav-link");
Object.assign(logInLink_a, {
    id: 'logInOut',
    href: 'loginPage.html',
})
logInLink_a.innerHTML = "Zaloguj";
logInLink.appendChild(logInLink_a);

const userAccountDropdown = document.createElement("li");
userAccountDropdown.setAttribute("class", "nav-item dropdown");
userAccountDropdown.setAttribute("id", "logInOut");
const userAccountDropdown_a = document.createElement("a");
userAccountDropdown_a.setAttribute("class", "nav-link dropdown-toggle");
Object.assign(userAccountDropdown_a, {
    href: '#',
    id: 'navbarDropdownMenuLink',
    role: 'button',
})
userAccountDropdown_a.setAttribute("data-bs-toggle", "dropdown");
userAccountDropdown_a.setAttribute("aria-expanded", "false");
userAccountDropdown_a.setAttribute("aria-expanded", "false");
userAccountDropdown_a.innerHTML += "Konto Użytkownika";
const userAccountDropdown_a_svg = document.createElement("a");
userAccountDropdown_a_svg.setAttribute("class", "bi bi-person-circle");
Object.assign(userAccountDropdown_a_svg, {
    xmlns: 'http://www.w3.org/2000/svg',
    width: '16',
    height: '16',
    fill: 'currentColor',
    viewBox: '0 0 16 16',
});
const userAccountDropdown_a_svg_path1 = document.createElement("a");
userAccountDropdown_a_svg_path1.setAttribute("d", "M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z");
const userAccountDropdown_a_svg_path2 = document.createElement("a");
userAccountDropdown_a_svg_path2.setAttribute("fill-rule", "evenodd")
userAccountDropdown_a_svg_path2.setAttribute("d", "M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z")
const userAccountDropdown_ul = document.createElement("a");
userAccountDropdown_ul.setAttribute("class", "dropdown-menu");
userAccountDropdown_ul.setAttribute("aria-labelledby", "navbarDropdownMenuLink");
const userAccountDropdown_ul_li1 = document.createElement("a");
const userAccountDropdown_ul_li1_a = document.createElement("a");
userAccountDropdown_ul_li1_a.setAttribute("class", "dropdown-item");
userAccountDropdown_ul_li1_a.setAttribute("href", "myAccount.html");
userAccountDropdown_ul_li1_a.innerHTML = "Moje Konto";
const userAccountDropdown_ul_li2 = document.createElement("a");
const userAccountDropdown_ul_li2_a = document.createElement("a");
userAccountDropdown_ul_li2_a.setAttribute("class", "dropdown-item");


const userAccountDropdown_ul_li3 = document.createElement("a");
const userAccountDropdown_ul_li3_a = document.createElement("a");
userAccountDropdown_ul_li3_a.setAttribute("class", "dropdown-item");
userAccountDropdown_ul_li3_a.setAttribute("href", "mainPage.html");
userAccountDropdown_ul_li3_a.setAttribute("onclick", "logOut()");
userAccountDropdown_ul_li3_a.innerHTML = "Wyloguj";
userAccountDropdown_ul_li1.appendChild(userAccountDropdown_ul_li1_a);
userAccountDropdown_ul_li2.appendChild(userAccountDropdown_ul_li2_a);
userAccountDropdown_ul_li3.appendChild(userAccountDropdown_ul_li3_a);
userAccountDropdown_ul.append(userAccountDropdown_ul_li1, userAccountDropdown_ul_li2, userAccountDropdown_ul_li3);
userAccountDropdown_a_svg.append(userAccountDropdown_a_svg_path1, userAccountDropdown_a_svg_path2);
userAccountDropdown_a.appendChild(userAccountDropdown_a_svg);
userAccountDropdown_a.appendChild(userAccountDropdown_a_svg);
userAccountDropdown.append(userAccountDropdown_a, userAccountDropdown_ul);

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
        const json = JSON.parse(loginRequest.responseText);
        if (json.validLogin === "true") {
            if (id === "organizerLogin") {
                document.location.href = "mainPageOrganizer.html"
                window.sessionStorage.setItem("loginStatus", "organizer")
            } else {
                document.location.href = "mainPage.html"
                window.sessionStorage.setItem("loginStatus", "user")
            }
            window.sessionStorage.setItem("userID", json.userID)
        } else {
            alert("Niepoprawne dane logowania!")
        }
    }

}

function logOut() {
    window.sessionStorage.setItem("loginStatus", "loggedOut")
}

function redirectToProperMainPage() {
    if (window.sessionStorage.getItem("loginStatus") === "organizer") {
        window.location.href = "mainPageOrganizer.html"
    } else {
        window.location.href = "mainPage.html"
    }
}

function verifyLogin() {
    const logInOutButton = document.getElementById("logInOut")
    logInOutButton.remove();

    if (window.sessionStorage.getItem("loginStatus") != null && window.sessionStorage.getItem("loginStatus") !== "loggedOut") {
        if (window.sessionStorage.getItem("loginStatus") === "user") {
            userAccountDropdown_ul_li2_a.setAttribute("href", "myTickets.html");
            userAccountDropdown_ul_li2_a.innerHTML = "Moje Bilety";
        }
        else {
            userAccountDropdown_ul_li2_a.setAttribute("href", "organizerEvents.html");
            userAccountDropdown_ul_li2_a.innerHTML = "Moje Wydarzenia";
        }
        document.getElementById("navbar-items-list").appendChild(userAccountDropdown)
    } else {
        document.getElementById("navbar-items-list").appendChild(logInLink)
    }
}