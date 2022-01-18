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
        eventTime.innerHTML = json.date;
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
