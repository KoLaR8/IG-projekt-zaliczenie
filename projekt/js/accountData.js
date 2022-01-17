function loadDataAboutAccount() {
    const xhr = new XMLHttpRequest();
    xhr.onload = function () {
        const el = document.getElementById("info")

        const json = JSON.parse(xhr.responseText)
        console.log(xhr.responseText)


        for (let i = 0; i < json.length; i++) {
            const div = document.createElement("div")
            div.setAttribute("class", "styleDiv")
            const l1 = document.createElement("label")
            const l2 = document.createElement("label")
            const l3 = document.createElement("label")
            const l4 = document.createElement("label")
            const l5 = document.createElement("label")
            const l6 = document.createElement("label")
            const l7 = document.createElement("label")
            const l8 = document.createElement("label")
            const l9 = document.createElement("label")
            const l10 = document.createElement("label")
            l1.setAttribute("class", "labels")
            l1.innerText = "Imie:"
            l2.setAttribute("class", "labels")
            l2.innerText = "Nazwisko:"
            l3.setAttribute("class", "labels")
            l3.innerText = "E-mail:"
            l4.setAttribute("class", "labels")
            l4.innerText = "Login:"
            l5.setAttribute("class", "labels")
            l5.innerText = "Hasło:"
            l6.setAttribute("class", "datalabels")
            l6.setAttribute("id", "name")
            l7.setAttribute("class", "datalabels")
            l7.setAttribute("id", "surname")
            l8.setAttribute("class", "datalabels")
            l8.setAttribute("id", "email")
            l9.setAttribute("class", "datalabels")
            l9.setAttribute("id", "login")
            l10.setAttribute("class", "datalabels")
            l10.setAttribute("id", "password")

            console.log(json[i].user_id);
            l6.innerHTML = json[i].name
            l7.innerHTML = json[i].surname
            l9.innerHTML = json[i].login
            l8.innerHTML = json[i].email
            l10.innerHTML = json[i].password


            div.append(l1, l6, l2, l7, l3, l8, l4, l9, l5, l10)
            el.appendChild(div)
        }
    }

    const id = window.sessionStorage.getItem("userID")

    xhr.open("GET", "http://localhost:8000/myAccount/" + id, true)
    xhr.send();
}