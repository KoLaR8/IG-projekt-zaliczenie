function loadDataAboutTickets() {
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
            l1.innerText = "Imie"
            l2.setAttribute("class", "labels")
            l2.innerText = "Nazwisko"
            l3.setAttribute("class", "labels")
            l3.innerText = "Cena"
            l4.setAttribute("class", "labels")
            l4.innerText = "Email"
            l5.setAttribute("class", "labels")
            l5.innerText = "Ilosc kupionych biletow"
            l6.setAttribute("class", "datalabels")
            l6.setAttribute("id", "name")
            l7.setAttribute("class", "datalabels")
            l7.setAttribute("id", "surname")
            l8.setAttribute("class", "datalabels")
            l8.setAttribute("id", "price")
            l9.setAttribute("class", "datalabels")
            l9.setAttribute("id", "email")
            l10.setAttribute("class", "datalabels")
            l10.setAttribute("id", "numberOfBoughtTickets")

            console.log(json[i].event_id);
            l6.innerHTML = json[i].name
            l7.innerHTML = json[i].surname
            l8.innerHTML = json[i].price
            l9.innerHTML = json[i].mail
            l10.innerHTML = json[i].numberOfBoughtTickets


            const xhr2 = new XMLHttpRequest();
            xhr2.onload = function () {
                const json2 = JSON.parse(xhr2.responseText);
                // console.log(json2)
                for (let i = 0; i < json.length; i++) {
                    const l11 = document.createElement("label")
                    l11.setAttribute("class", "concertName")
                    l11.innerHTML = json2[i].name

                    div.append(l11)
                }
            }
            div.append(l1, l6, l2, l7, l3, l8, l4, l9, l5, l10)
            el.appendChild(div)
            xhr2.open("GET", "http://localhost:8000/myTickets/event/" + json[i].event_id + "/" + json[i].mail)
            xhr2.send()

        }
    }

    const id = window.sessionStorage.getItem("userID")
    xhr.open("GET", "http://localhost:8000/myTickets/" + id, true)
    xhr.send();
}