function addPool(element) {
    var el = document.createElement("div");
    var parent = document.querySelector(".data");
    var name_input = document.createElement("textarea")
    var name = document.createElement("p")
    var price_input = document.createElement("textarea")
    var price = document.createElement("p")
    var number_input = document.createElement("textarea")
    var number = document.createElement("p")
    el.className = "newPool"
    name.innerText = " Nazwa puli: "
    price.innerText = " Cena: "
    number.innerText = " Liczba biletów: "
    el.appendChild(name)
    el.appendChild(name_input)
    el.appendChild(price)
    el.appendChild(price_input)
    el.appendChild(number)
    el.appendChild(number_input)
    parent.appendChild(el)

}

function addPhoto() {


}

function verify() {

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

    var artists = artist.split(", ");
    var jsonArtists = JSON.stringify(Object.assign({}, artists));
    var json_arr = {};
    for(var i = 0; i< artists.length; i++){
        var key = "name" + i;
        json_arr[key] = artists[i];
    }
    json_arr["len"] = artists.length;
    var json_string = JSON.stringify(json_arr);

    xhr.open("POST", 'http://localhost:8000/events', true);
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
    }));
    const xhr2 = new XMLHttpRequest();
    xhr2.open("POST", 'http://localhost:8000/artists', true);
    xhr2.setRequestHeader('Content-Type', 'application/json');
    console.log(json_string);
    xhr2.send(json_string);

    const xhr3 = new XMLHttpRequest();
    xhr3.open("POST", 'http://localhost:8000/artists-in-events', true);
    xhr3.setRequestHeader('Content-Type', 'application/json');
    xhr3.send(json_string)

}