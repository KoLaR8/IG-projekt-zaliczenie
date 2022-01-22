let poolCounter = 0

function addPool() {
    poolCounter ++
    var el = document.createElement("div");
    var parent = document.querySelector(".data");
    var name_input = document.createElement("textarea")
    name_input.name = "poolNames"
    var name = document.createElement("p")
    var price_input = document.createElement("textarea")
    price_input.name = "priceInput"
    var price = document.createElement("p")
    var number_input = document.createElement("textarea")
    number_input.name = "numberInput"
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
let json = 0
function getPools(){
    console.log("hello");
    const poolsNames = document.getElementsByName("poolNames");
    const poolsPrices = document.getElementsByName("priceInput");
    const poolsNumbers = document.getElementsByName("numberInput");
    const eventName = document.getElementById("exampleFormControlTextarea1").value;
    var json_arr = {};
    let counter = 0;

    Array.from(poolsNames).forEach((el) => {
        json_arr["poolNames" + counter] = el.value
        counter++
    });
    counter = 0
    Array.from(poolsPrices).forEach((el) => {
        json_arr["poolPrice" + counter] = el.value
        counter++
    });
    counter = 0
    Array.from(poolsNumbers).forEach((el) => {
        json_arr["poolsNumber" + counter] = el.value
        counter++
    });
    json_arr["len"] = poolCounter;
    json_arr["eventName"] = eventName;
    let xhr1 = new XMLHttpRequest();

    xhr1.onload = () => {
        json = JSON.parse(xhr1.responseText)[0]["id"]
        json_arr["eventId"] = json;
        console.log(json)
    }
    xhr1.open("GET", 'http://localhost:8000/pools/' + eventName, true);
    xhr1.send();
    let xhr2 = new XMLHttpRequest();
    xhr2.open("POST", 'http://localhost:8000/pools/' + json, true);
    xhr2.setRequestHeader('Content-Type', 'application/json');
    console.log(json_arr)
    xhr2.send(JSON.stringify(json_arr));
}

function verify() {
    alert('Pomyślnie dodano wydarzenie! Możesz sprawdzić utworzone wydarzenia w zakładce "Moje wydarzenia" na stronie głównej.')
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
        idUser: window.sessionStorage.getItem("userID")
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
    getPools()

}