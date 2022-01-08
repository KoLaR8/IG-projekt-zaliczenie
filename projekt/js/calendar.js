const months = ["Styczeń", "Luty", "Marzec", "Kwiecień", "Maj", "Czerwiec", "Lipiec", "Sierpień", "Wrzesień", "Październik", "Listopad", "Grudzień"]
let newMonth = 0
let newYear = 0
let monthDB = 0
function setDate(offset) {
    let dateElement = document.getElementById("dateLabel");
    if (offset === 1 || offset === -1) {
        changeMonth(dateElement, offset)
    } else {
        const today = new Date()
        newMonth = today.getMonth()
        newYear = today.getFullYear()
        dateElement.innerHTML = months[newMonth] + " " + newYear.toString()
    }
    const events = document.getElementById("list-group")
    const newEvents = document.createElement("div")
    newEvents.setAttribute("class", "list-group")
    newEvents.setAttribute("id", "list-group")
    document.body.replaceChild(newEvents, events)
    getEvents(dateElement.innerHTML.split(" "))
}

function changeMonth(dateElement, offset) {
    const date = dateElement.innerHTML.split(" ")
    newMonth = months.findIndex(element => element === date[0]) + offset
    newYear = parseInt(date[1], 10)
    if (newMonth === 12) {
        newMonth = 0
        newYear += 1
    }
    if (newMonth === -1) {
        newMonth = 11
        newYear -= 1
    }
    dateElement.innerHTML = months[newMonth] + " " + newYear.toString()

}

function getEvents() {
    const xhr = new XMLHttpRequest();
    xhr.onload = function () {
        const list = document.getElementById("list-group")
        const json = JSON.parse(xhr.responseText)
        for (let i = 0; i < json.length; i++) {
            const dateAndHour = json[i].date.split("T");
            const a = document.createElement("a")
            a.setAttribute("href", "#")
            a.setAttribute("class", "list-group-item")
            a.setAttribute("aria-current", "true")
            const div = document.createElement("div")
            div.setAttribute("class", "d-flex w-100 justify-content-between")
            const h5 = document.createElement("h5")
            h5.setAttribute("class", "mb-1")
            const divSmall = document.createElement("small")
            const p = document.createElement("p")
            p.setAttribute("class", "mb-1")
            const small = document.createElement("small")
            h5.innerHTML = json[i].name
            divSmall.innerHTML = dateAndHour[0] + ", " + dateAndHour[1].substring(0, 5)
            p.innerHTML = "Janusz Kowalski, Mariusz Pudzianowski, Gracjan Roztocki"
            small.innerHTML = json[i].city + ", " + json[i].street + ", " + json[i].building_number
            div.append(h5, divSmall)
            a.append(div, p, small)
            list.appendChild(a)
        }
    }
    monthDB = newMonth + 1
    xhr.open("GET", 'http://localhost:8000/events?month=' + monthDB + '&year=' + newYear, true);
    xhr.send();

}