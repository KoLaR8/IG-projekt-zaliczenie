function create() {
    const name = document.getElementById("name").value
    const surname = document.getElementById("surname").value
    const email = document.getElementById("email").value
    const login = document.getElementById("login").value
    const password = document.getElementById("password").value
    const password2 = document.getElementById("password2").value
    const organizer = document.getElementById("org").checked
    const xhr = new XMLHttpRequest();

    xhr.onload = function () {
        alert("Rejestracja zakończona pomyślnie!");
    }
    if (password === password2) {

        xhr.open("POST", 'http://localhost:8000/users', true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(JSON.stringify({
            name: name,
            surname: surname,
            email: email,
            login: login,
            password: password,
            organizer: organizer

        }));
    } else {
        alert("Podane hasla nie sa takie same!")
    }
}