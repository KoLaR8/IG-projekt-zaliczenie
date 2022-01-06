function buyTickets(){
    const name = document.getElementById("formGroupNameInput").value;
    const surname = document.getElementById("formGroupSurnameInput").value;
    const mail = document.getElementById("formGroupMailInput").value;
    const numberOfBoughtTickets = document.getElementById("ticketNumber").innerText;
    const price = document.getElementById("finalPrice").innerText;

    const xhr = new XMLHttpRequest();
    xhr.open("POST", 'http://localhost:8000', true);
    xhr.setRequestHeader('Content-Type', 'text/plain');
    xhr.send(JSON.stringify({
        DBTable: "tickets",
        name: name,
        surname: surname,
        numberOfBoughtTickets: numberOfBoughtTickets,
        mail: mail,
        price: price
    }));

    alert("Kupiono bilet! Możesz sprawdzić zakupione bilety w zakładce Konto użytkownika > Moje bilety!");
}