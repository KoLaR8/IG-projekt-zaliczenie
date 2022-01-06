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
    let sql;
    if (request.method === "GET") {

    } else if (request.method === "POST") {
        let data = ""
        request.on('data', chunk => {
            data += chunk.toString()
        });
        request.on('end', () => {
            const json = JSON.parse(data)
            console.log(request.url)

            if (request.url === "/events") {
                sql = `INSERT INTO events (name, city, street, building_number, image, description, date, time, organizer)
                       VALUES ('${json.name}', '${json.city}', '${json.street}', '${json.building_number}', null, '${json.description}', '${json.date}','${json.time}',
                               '${json.organizer}')`;
            }
            if (request.url === "/tickets") {
                sql = `INSERT INTO tickets(event_id, user_id, name, surname, price, numberOfBoughtTickets, mail)
                       VALUES (1, 1, "${json.name}", '${json.surname}', '${json.price}', '${json.numberOfBoughtTickets}
                               ', '${json.mail}')`;
            }

            connection.query(sql, function (err, result) {
                if (err) throw err;
                console.log("1 record inserted.");
            });
            response.end()
        });

    } else {
        response.end("Undefined request .");
    }
});

server.listen(8000);
console.log("Server running on port 8000");

