function buyTickets(){
    const name = document.getElementById("formGroupNameInput").value;
    const surname = document.getElementById("formGroupSurnameInput").value;
    const mail = document.getElementById("formGroupMailInput").value;
    const numberOfBoughtTickets = document.getElementById("ticketNumber").innerText;
    const price = document.getElementById("finalPrice").innerText;

    const xhr = new XMLHttpRequest();
    xhr.open("POST", 'http://localhost:8000/tickets', true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify({
        name: name,
        surname: surname,
        numberOfBoughtTickets: numberOfBoughtTickets,
        mail: mail,
        price: price,
        ID: window.sessionStorage.getItem("userID")
    }));

    alert("Kupiono bilet! Możesz sprawdzić zakupione bilety w zakładce Konto użytkownika > Moje bilety!");
}