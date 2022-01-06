function getEvents() {
    const xhr = new XMLHttpRequest();
    xhr.onload = function () {
        const events = document.getElementById("events")
        const json = JSON.parse(xhr.responseText)
        for(let i = 0; i < json.length; i++) {
            const element = document.createElement("div")
            element.innerHTML = json[i].name + " " + json[i].date;
            events.appendChild(element)

        }
    }
    xhr.open("GET", 'http://localhost:8000/events', true);
    xhr.send();
}