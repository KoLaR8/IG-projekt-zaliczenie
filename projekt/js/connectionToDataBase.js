const mysql = require("mysql");
const http = require('http');

const connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "events.com"
});

connection.connect(function (err) {
    if (err) throw err;
    console.log("connected to database: events.com");
});


function selectQuery(sql, request, response) {
    connection.query(sql, function (err, result){
        if(err) throw err;
        console.log("Selected " + result.length + "records. ");
        response.end(JSON.stringify(result));
    });
}

function insertQuery(sql) {
    connection.query(sql, function (err, result){
        if(err) throw err;
        console.log("Inserted " + 1 + " record ");
    });
}

const server = http.createServer(function (request, response) {

    response.writeHead(200, {"Content-Type": "text/plain", "Access-Control-Allow-Origin" : "*"});
    let sql;
    if (request.method === "GET") {
        if (request.url === "/events") {
            sql = `SELECT * FROM events`;
            selectQuery(sql, request, response);
        }
        if(request.url === "/events/1"){
            sql = `SELECT * FROM EVENTS WHERE event_id = 12`;
            selectQuery(sql, request, response);
        }


    } else if (request.method === "POST") {
        let data = ""
        request.on('data', chunk => {
            data += chunk.toString()
        });
        request.on('end', () => {
            const json = JSON.parse(data)
            console.log(request.url)
            console.log(json)

            if (request.url === "/events") {
                sql = `INSERT INTO events (name, city, street, building_number, image, description, date, time, organizer)
                       VALUES ('${json.name}', '${json.city}', '${json.street}', '${json.building_number}', null, '${json.description}', '${json.date}','${json.time}',
                               '${json.organizer}')`;
                insertQuery(sql);
            }
            if (request.url === "/tickets") {
                sql = `INSERT INTO tickets(event_id, user_id, name, surname, price, numberOfBoughtTickets, mail)
                       VALUES (1, 1, "${json.name}", '${json.surname}', '${json.price}', '${json.numberOfBoughtTickets}
                               ', '${json.mail}')`;
                insertQuery(sql);
            }

            if (request.url === "/users") {
                sql = `INSERT INTO users(name, surname, email, login, password, organizer)
                       VALUES ('${json.name}', '${json.surname}', '${json.email}', '${json.login}', '${json.password}', '1' )`;
                insertQuery(sql);
            }
            if(request.url === "/artists"){
                for(let i = 0; i < json.len; i++) {
                    let artistName = "name" + i;
                    let artist = json[artistName]
                    sql = `INSERT INTO artists(name)
                       VALUES ('${artist}')`;
                    insertQuery(sql);
                }
            }

            response.end()
        });

    } else {
        response.end("Undefined request .");
    }
});

server.listen(8000);
console.log("Server running on port 8000");

