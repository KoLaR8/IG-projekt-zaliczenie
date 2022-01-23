

function increaseTicketNumber(i) {
    let counter = parseInt(document.getElementById("numberOfTickets" + i).innerText)
    counter++
    document.getElementById("numberOfTickets" + i).innerText = counter.toString();
    document.getElementById("finalPrice").innerText = (parseInt(document.getElementById("finalPrice").innerText) + parseInt(document.getElementById("poolPrice" + i).innerText)).toString()

}

function decreaseTicketNumber(i){
    let counter = parseInt(document.getElementById("numberOfTickets" + i).innerText)
    if(counter > 0){
        counter--;
        document.getElementById("numberOfTickets" + i).innerText = counter.toString()
        document.getElementById("finalPrice").innerText = (parseInt(document.getElementById("finalPrice").innerText) - parseInt(document.getElementById("poolPrice" + i).innerText)).toString()
    }
}

