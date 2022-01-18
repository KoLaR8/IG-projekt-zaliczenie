let counter = 0;

function increaseTicketNumber() {
    counter ++;
    document.getElementById("ticketNumber").innerHTML = counter;
    calculatePrice()
}

function decreaseTicketNumber(){
    if(counter > 0){
        counter--;
        document.getElementById("ticketNumber").innerHTML = counter;
        calculatePrice()
    }
}
function calculatePrice(){
    let price = parseInt(document.getElementById("poolPrice").innerText);
    document.getElementById("finalPrice").innerText = price * counter;
}
