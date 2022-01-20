var eventId
function loadDataToEdit() {
    const xhr = new XMLHttpRequest();
    xhr.onload = function () {
        const eventName = document.getElementById("exampleFormControlTextarea1");
        const eventTime = document.getElementById("inputTime");
        const eventDate = document.getElementById("inputDate");
        const eventCity = document.getElementById("inputTown");
        const eventStreet = document.getElementById("inputStreet");
        const eventBuildingNumber = document.getElementById("inputBuilding");
        const eventOrganizer = document.getElementById("exampleFormControlTextarea4");
        const eventDescription = document.getElementById("exampleFormControlTextarea3");


        const json = JSON.parse(xhr.responseText)[0];
        eventId = json.event_id;
        console.log(eventId)
        eventName.defaultValue = json.name;
        eventTime.defaultValue = json.time;
        eventCity.defaultValue = json.city;
        eventStreet.defaultValue = json.street;
        eventBuildingNumber.defaultValue = json.building_number;
        eventDate.defaultValue = json.date.substring(0, 10);
        eventOrganizer.defaultValue = json.organizer;
        eventDescription.defaultValue = json.description;
    }
    let txt = document.location.href.split("?id=");
    xhr.open("GET", "http://localhost:8000/events/" + txt[1]);
    xhr.send();
    readArtists(txt);
}

function readArtists(txt){
    const xhr2 = new XMLHttpRequest();
    xhr2.onload = function () {
        const artists = document.getElementById("exampleFormControlTextarea2");

        const json = JSON.parse(xhr2.responseText);
        for(var i = 0; i < json.length; i++){
            artists.innerText += "   " + json[i].name + "   ";
        }

    }
    xhr2.open("GET", "http://localhost:8000/artists-in-events/" +txt[1])
    xhr2.send();
}

function verify() {
    alert('Pomyślnie zmodyfikowano dane wydarzenia!')
    const name = document.getElementById("exampleFormControlTextarea1").value
    const artist = document.getElementById("exampleFormControlTextarea2").value
    const description = document.getElementById("exampleFormControlTextarea3").value
    const organizer = document.getElementById("exampleFormControlTextarea4").value
    const city = document.getElementById("inputTown").value
    const street = document.getElementById("inputStreet").value
    const building_number = document.getElementById("inputBuilding").value
    const time = document.getElementById("inputTime").value
    const date = document.getElementById("inputDate").value
    const xhr = new XMLHttpRequest();

    // var artists = artist.split(", ");
    // var jsonArtists = JSON.stringify(Object.assign({}, artists));
    // var json_arr = {};
    // for(var i = 0; i< artists.length; i++){
    //     var key = "name" + i;
    //     json_arr[key] = artists[i];
    // }
    // json_arr["len"] = artists.length;
    // var json_string = JSON.stringify(json_arr);
    xhr.open("POST", 'http://localhost:8000/editEvent/' + eventId, true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify({
        name: name,
        description: description,
        organizer: organizer,
        city: city,
        street: street,
        building_number: building_number,
        date: date,
        time: time,
        idUser: window.sessionStorage.getItem("userID")
    }));
    // const xhr2 = new XMLHttpRequest();
    // xhr2.open("POST", 'http://localhost:8000/artists', true);
    // xhr2.setRequestHeader('Content-Type', 'application/json');
    // console.log(json_string);
    // xhr2.send(json_string);

    // const xhr3 = new XMLHttpRequest();
    // xhr3.open("POST", 'http://localhost:8000/artists-in-events', true);
    // xhr3.setRequestHeader('Content-Type', 'application/json');
    // xhr3.send(json_string)

}
