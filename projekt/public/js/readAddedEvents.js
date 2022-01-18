function loadOrganizedEvents(){
    let userId = window.sessionStorage.getItem("userID")
    console.log(userId)
    const xhr = new XMLHttpRequest();
    xhr.onload = function () {
        const list = document.getElementById("list-group")
        const json = JSON.parse(xhr.responseText)
        for (let i = 0; i < json.length; i++) {
            const dateAndHour = json[i].date.split("T");
            const a = document.createElement("a")
            a.setAttribute("href", "http://localhost:8000/BuyingTicketsForEventPage.html?id=" + json[i].event_id)
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
            divSmall.innerHTML = dateAndHour[0] + " " + json[i].time
            const artistsInEventsRequest = new XMLHttpRequest();
            artistsInEventsRequest.onload = function () {
                const json = JSON.parse(artistsInEventsRequest.responseText);
                for (let j = 0; j < json.length; j++) {
                    if (j !== 0) {
                        p.innerText += ","
                    }
                    p.innerText += " " + json[j].name;
                }
            }
            artistsInEventsRequest.open("GET", "http://localhost:8000/artists-in-events/" + json[i].event_id)
            artistsInEventsRequest.send();
            small.innerHTML = json[i].city + ", " + json[i].street + ", " + json[i].building_number
            div.append(h5, divSmall)
            a.append(div, p, small)
            list.appendChild(a)
        }
    }
    xhr.open("GET", "http://localhost:8000/addedEvents/" + userId);
    xhr.send();
}