const mysql = require("mysql");
const express = require('express');
const path = require("path");
const bodyParser = require("body-parser")

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


function selectQueryAndSendResponse(sql, request, response) {
    connection.query(sql, function (err, result) {
        if (err) throw err;
        console.log("Selected " + result.length + "records. ");
        response.writeHead(200, {"Content-Type": "text/plain", "Access-Control-Allow-Origin": "*"});
        response.end(JSON.stringify(result));
    });
}

function insertQuery(sql) {
    connection.query(sql, function (err, result) {
        if (err) throw err;
        console.log("Inserted " + 1 + " record ");
    });
}

function updateQuery(sql) {
    connection.query(sql, function (err, result) {
        if (err) throw err;
        console.log("Updated " + 1 + " record ");
    });
}

const app = express();
const port = process.env.PORT || 8000;

let sql;
app.use(bodyParser.json())
app.use(express.static(__dirname + '/public'));

app.get('/', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), 'public/mainPage.html'));
});


app.get('/myAccount/:id', function (req, res) {

    sql = `SELECT *
           FROM users
           WHERE user_id = '${req.params.id}'`;

    selectQueryAndSendResponse(sql, req, res);
});

// app.get('/organizerEvents.html', function (req, res) {
//     res.sendFile(path.join(path.dirname(require.main.filename), '../organizerEvents.html'));
// });

app.get('/addedEvents/:id', function (req, res){
    sql = `SELECT * FROM events WHERE addedBy = '${req.params.id}'`;
    selectQueryAndSendResponse(sql, req, res)
});

app.get('/myTickets/:id', function (req, res){
    sql = `SELECT * FROM tickets WHERE user_id = '${req.params.id}'`;
    selectQueryAndSendResponse(sql, req, res)
});

app.get('/myTickets/event/:id/:usermail', function (req, res){
    sql = `SELECT events.name FROM events join tickets on tickets.event_id = events.event_id WHERE events.event_id = '${req.params.id}' AND tickets.mail = '${req.params.usermail}'`;
    selectQueryAndSendResponse(sql, req, res)
});

app.get('/events', function (req, res) {
    if (req.query.month && req.query.year) {
        sql = `SELECT *
               FROM events
               WHERE MONTH (date) = '${req.query.month}'
                 AND YEAR (date) = '${req.query.year}'`;
        selectQueryAndSendResponse(sql, req, res);
    }

});

app.get('/events/:id', function (req, res) {
    sql = `SELECT *
           FROM events
           WHERE event_id = '${req.params.id}'`;
    selectQueryAndSendResponse(sql, req, res);
});

app.get('/search', function (req, res) {
    if (req.query.name) {
        sql = mysql.format("SELECT * FROM events WHERE name LIKE CONCAT('%', ?,  '%')", req.query.name);
        selectQueryAndSendResponse(sql, req, res);
    }
});

app.get('/artists-in-events/:id', function (req, res) {
    sql = `SELECT DISTINCT(name)
           FROM artists_in_events
                    JOIN artists ON artists_in_events.artist_id = artists.artist_id
           WHERE artists_in_events.event_id = '${req.params.id}'`;
    selectQueryAndSendResponse(sql, req, res);
});

app.post('/events', function (req, res) {

    sql = `INSERT INTO events (name, city, street, building_number, image, description, date, time,
                               organizer, addedBy)
           VALUES ('${req.body.name}', '${req.body.city}', '${req.body.street}', '${req.body.building_number}', null,
                   '${req.body.description}', '${req.body.date}', '${req.body.time}',
                   '${req.body.organizer}', '${req.body.idUser}')`;
    insertQuery(sql);
});

app.post('/editEvent/:id', function (req, res) {
    sql = `UPDATE events 
    SET name = '${req.body.name}', city = '${req.body.city}', street = '${req.body.street}', building_number = '${req.body.building_number}', 
    description = '${req.body.description}', date = '${req.body.date}', time = '${req.body.time}', organizer = '${req.body.organizer}' 
    WHERE event_id = '${req.params.id}'`;
    updateQuery(sql);
});

app.post('/artists', function (req, res) {

    for (let i = 0; i < req.body.len; i++) {
        let artistName = "name" + i;
        let artist = req.body[artistName]
        sql = `INSERT INTO artists(name)
               VALUES ('${artist}')`;
        insertQuery(sql);
    }
});

app.post('/artists-in-events', function (req, res) {
    for (let i = 0; i < req.body.len; i++) {
        let artistName = "name" + i;
        let artist = req.body[artistName]
        sql = `INSERT INTO artists_in_events(artist_id, event_id)
               SELECT artist_id, MAX(event_id)
               FROM artists,
                    events
               WHERE artists.name = '${artist}'`;
        insertQuery(sql);
    }

});

app.post('/tickets', function (req, res) {
    sql = `INSERT INTO tickets(event_id, user_id, name, surname, price, numberOfBoughtTickets, mail)
           VALUES (1, "${req.body.ID}", "${req.body.name}", '${req.body.surname}', '${req.body.price}',
                   '${req.body.numberOfBoughtTickets}
                               ', '${req.body.mail}')`;
    insertQuery(sql);
});

app.post('/users', function (req, res) {
    const accountType = req.body.organizer === true ? 1 : 0;
    sql = `INSERT INTO users(name, surname, email, login, password, organizer)
           VALUES ('${req.body.name}', '${req.body.surname}', '${req.body.email}', '${req.body.login}',
                   '${req.body.password}',
                   '${accountType}')`;
    insertQuery(sql);
    res.writeHead(200, {"Content-Type": "text/plain", "Access-Control-Allow-Origin": "*"});
    res.end();
});

app.post('/login', function (req, res) {
    let loginType = req.body.loginType === "organizerLogin" ? 1 : 0;
    let validLogin = "false";
    let userID = "";
    sql = `SELECT *
           FROM users
           WHERE login = '${req.body.login}'
             AND password = '${req.body.password}'
             AND organizer = '${loginType}'`;

    connection.query(sql, function (err, result) {
        if (err) throw err;
        console.log("Selected " + result.length + "records. ");
        for(let i = 0; i < result.length; i++) {
            if(result[i].organizer === loginType){
                validLogin = "true";
                userID = result[i].user_id
            }
        }
        res.writeHead(200, {"Content-Type": "text/plain", "Access-Control-Allow-Origin": "*"});
        res.end(JSON.stringify({
            validLogin: validLogin,
            userID: userID
        }));
    });

})
app.listen(port);
console.log('Server started at http://localhost:' + port);