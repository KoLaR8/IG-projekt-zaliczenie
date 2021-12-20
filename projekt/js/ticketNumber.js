let counter = 0;

function increaseTicketNumber() {
    counter ++;
    document.getElementById("ticketNumber").innerHTML = counter;
}

function decreaseTicketNumber(){
    if(counter > 0){
        counter--;
        document.getElementById("ticketNumber").innerHTML = counter;
    }
}