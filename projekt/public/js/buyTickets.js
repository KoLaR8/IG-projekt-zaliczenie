

function dataValidation(){
    let allDataIsFilled = true;

    let name = document.getElementById("formGroupNameInput")
    if(name.value === ""){
        name.style.border = "solid 1px red"
        allDataIsFilled = false;
    }
    let surname = document.getElementById("formGroupSurnameInput")
    if(surname.value === ""){
        surname.style.border = "solid 1px red"
        allDataIsFilled = false;
    }
    let mail = document.getElementById("formGroupMailInput")
    if(mail.value === ""){
        mail.style.border = "solid 1px red"
        allDataIsFilled = false;
    }
    return allDataIsFilled
}


function buyTickets(){
    let allDataIsFilled = dataValidation()
    if(!allDataIsFilled) {
        alert("Wypełnij wszystkie pola!")
        return;
    }
    document.getElementById("formGroupNameInput").style.border = "none"
    document.getElementById("formGroupSurnameInput").style.border = "none"
    document.getElementById("formGroupMailInput").style.border = "none"
    const name = document.getElementById("formGroupNameInput").value;
    const surname = document.getElementById("formGroupSurnameInput").value;
    const mail = document.getElementById("formGroupMailInput").value;
    let numberOfBoughtTickets = 0
    const price = document.getElementById("finalPrice").innerText;
    const numberOfTickets = document.getElementsByClassName("numberOfTickets")

    for(let i =0; i < numberOfTickets.length; i++){
        numberOfBoughtTickets += parseInt(numberOfTickets[i].innerText)
    }

    let txt = document.location.href.split("?id=");
    const xhr = new XMLHttpRequest();
    xhr.open("POST", 'http://localhost:8000/tickets', true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify({
        eventid: txt[1],
        name: name,
        surname: surname,
        numberOfBoughtTickets: numberOfBoughtTickets,
        mail: mail,
        price: price,
        ID: window.sessionStorage.getItem("userID")
    }));
    alert("Kupiono bilet! Możesz sprawdzić zakupione bilety w zakładce Konto użytkownika > Moje bilety!");
}