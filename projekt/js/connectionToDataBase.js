var mysql = require("mysql");
var http = require('http');

var connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "events.com"
});

connection.connect(function (err) {
    if (err) throw err;
    console.log("connected to database: events.com");
});


var server = http.createServer(function (request, response) {

    response.writeHead(200, {"Content-Type": "text/plain"});
    if (request.method === "GET") {
        response.end("received GET request.")
        console.log("received GET request.");
    } else if (request.method === "POST") {
        let data = ""
        request.on('data', chunk => {
            data += chunk.toString()
        });
        request.on('end', () => {
            const json = JSON.parse(data)

            let sql;
            if(json.DBTable === "events"){
                sql = `INSERT INTO events (name, city, street, building_number, image, description, date, organizer) VALUES( '${json.name}', 'Krakow', 'Nijaka', '69', null, '${json.description}', '2020-10-10', 'Jakis smiec')`;
            }
            if(json.DBTable === "tickets"){
                sql = `INSERT INTO tickets(event_id, user_id, name, surname, price, numberOfBoughtTickets, mail) VALUES( 1, 1, '${json.name}', '${json.surname}', '${json.price}', '${json.numberOfBoughtTickets}', '${json.mail}' )`;
            }

            connection.query(sql, function(err, result){
                if(err) throw err;
                console.log("1 record inserted.");
            });
            response.end()
        });

    }

    else {
        response.end("Undefined request .");
    }
});

server.listen(8000);
console.log("Server running on port 8000");

