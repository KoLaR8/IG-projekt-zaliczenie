
function loadDataAboutEvent() {
    const xhr = new XMLHttpRequest();
    xhr.onload = function () {
        const eventName = document.getElementById("eventName");
        const eventTime = document.getElementById("eventTime");
        const eventCity = document.getElementById("eventCity");
        const eventStreet = document.getElementById("eventStreet");
        const eventBuildingNumber = document.getElementById("eventBuildingNumber");
        const eventOrganizer = document.getElementById("eventOrganizer");
        const eventDescription = document.getElementById("eventDescription");


        const json = JSON.parse(xhr.responseText)[0];
        eventName.innerHTML = json.name;
        eventTime.innerHTML = json.date.substring(0, json.date.indexOf("T")) + ", " + json.time;
        eventCity.innerHTML = json.city;
        eventStreet.innerHTML = json.street;
        eventBuildingNumber.innerHTML = json.building_number;
        eventOrganizer.innerHTML = json.organizer;
        eventDescription.innerText = json.description;
    }
    let txt = document.location.href.split("?id=");
    xhr.open("GET", "http://localhost:8000/events/" + txt[1]);
    xhr.send();
    readArtists(txt);
    readPools()
}

function readArtists(txt){
    const xhr2 = new XMLHttpRequest();
    xhr2.onload = function () {
        const artists = document.getElementById("artists");

        const json = JSON.parse(xhr2.responseText);
        for(var i = 0; i < json.length; i++){
            artists.innerText += "   " + json[i].name + "   ";
        }

    }
    xhr2.open("GET", "http://localhost:8000/artists-in-events/" +txt[1])
    xhr2.send();
}

function readPools(){
    const xhr = new XMLHttpRequest()
    xhr.onload = (req ) => {
        console.log(xhr.responseText)
        console.log(JSON.parse(xhr.responseText))
        const json = JSON.parse(xhr.responseText)
        for(let i = 0; i< json.length; i++) {
            let container = document.getElementById("pools")
            let frame = document.createElement("div")
            frame.className = "ticketPool"

            let poolName = document.createElement("div")
            let p = document.createElement("p")
            poolName.className = "ticketPoolName"
            p.innerText = json[i].name
            poolName.appendChild(p)

            let poolPrice = document.createElement("div")
            let p2 = document.createElement("p")
            poolPrice.className = "ticketPoolPrice"
            poolPrice.setAttribute("id", "poolPrice" + i)
            p2.innerText = json[i].price
            poolPrice.appendChild(p2)

            let poolCurrency = document.createElement("div")
            let p3 = document.createElement("p")
            poolCurrency.className = "ticketPoolCurrency"
            p3.innerText = "zł"
            poolCurrency.appendChild(p3)

            let minusSign = document.createElement("div")
            let p4 = document.createElement("p")
            p4.setAttribute("id", "ticketNumber" + i)
            minusSign.className = "minusSign"
            minusSign.setAttribute("onclick", "console.log(" + i + "); decreaseTicketNumber(" + i + ");")
            p4.innerText = "-"
            minusSign.appendChild(p4)

            let ticketNumber = document.createElement("div")
            let p5 = document.createElement("p")
            p5.setAttribute("id", "ticketNumber" + i)
            ticketNumber.className = "numberOfTickets"
            ticketNumber.setAttribute("id", "numberOfTickets" + i)
            // p5.innerText = json[i].number_of_tickets
            p5.innerText = "0"
            ticketNumber.appendChild(p5)

            let plusSign = document.createElement("div")
            let p6 = document.createElement("p")
            plusSign.className = "plusSign"
            plusSign.setAttribute("onclick", "console.log(" + i + "); increaseTicketNumber(" + i + ");")
            p6.innerText = "+"
            plusSign.appendChild(p6)

            frame.appendChild(poolName)
            frame.appendChild(poolPrice)
            frame.appendChild(poolCurrency)
            frame.appendChild(minusSign)
            frame.appendChild(ticketNumber)
            frame.appendChild(plusSign)
            container.appendChild(frame)
        }
    }
    let txt = document.location.href.split("?id=");
    xhr.open("GET", "http://localhost:8000/events/" +txt[1] + "/pools")
    xhr.send();
}
