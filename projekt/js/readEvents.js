window.onload = function loadDataAboutEvent(){
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

    xhr.open("GET", "http://localhost:8000/events/1");
    xhr.send();
}