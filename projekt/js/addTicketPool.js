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
    xhr.open("POST", 'http://localhost:8000/events', true);
    xhr.setRequestHeader('Content-Type', 'text/plain');
    xhr.send(JSON.stringify({
        name: name,
        description: description,
        organizer: organizer,
        city: city,
        street: street,
        building_number: building_number,
        date: date,
        time: time

    }));
}

