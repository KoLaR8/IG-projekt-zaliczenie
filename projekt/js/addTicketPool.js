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
    // var img = document.createElement("img")
    // img.src = "photos/map.PNG"
    // var el = document.getElementsByClassName("photo")
    // el.appendChild(img)
    // document.getElementById("load").innerHTML = "<img src=''>";
    alert("AAAAAAAA")
    var img = document.createElement("img");
    img.src = "http://www.google.com/intl/en_com/images/logo_plain.png";
    var src = document.getElementById("");
    src.appendChild(img);
}

function verify() {

    const name = document.getElementById("exampleFormControlTextarea1").value
    const artist = document.getElementById("exampleFormControlTextarea2").value
    const description = document.getElementById("exampleFormControlTextarea3").value
    const organizer = document.getElementById("exampleFormControlTextarea4").value

    const xhr = new XMLHttpRequest();
    xhr.open("POST", 'http://localhost:8000', true);
    xhr.setRequestHeader('Content-Type', 'text/plain');
    xhr.send(JSON.stringify({
        DBTable: "events",
        name: name,
        description: description,
        organizer: organizer
    }));
}

