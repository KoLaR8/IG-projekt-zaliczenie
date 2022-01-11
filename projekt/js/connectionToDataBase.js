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

const app = express();
const port = process.env.PORT || 8000;

let sql;
app.use(bodyParser.json())

app.get('/organizerEvents.html', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../organizerEvents.html'));
});

app.get('/addedEvents/:id', function (req, res){
    console.log("otrzymałem");
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
                   '${req.body.organizer}', 0)`;
    insertQuery(sql);
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
    sql = `INSERT INTO users(name, surname, email, login, password, organizer)
           VALUES ('${req.body.name}', '${req.body.surname}', '${req.body.email}', '${req.body.login}',
                   '${req.body.password}',
                   '1')`;
    insertQuery(sql);
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


app.get('/css/styleMyTickets.css', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../css/styleMyTickets.css'));
});

app.get('/css/buyingTicket.css', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../css/buyingTicket.css'));
});
app.get('/css/calendar.css', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../css/calendar.css'));
});
app.get('/css/searchingResult.css', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../css/searchingResult.css'));
});
app.get('/css/style.css', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../css/style.css'));
});
app.get('/css/styleAddEvent.css', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../css/styleAddEvent.css'));
});
app.get('/css/styleLogin.css', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../css/styleLogin.css'));
});
app.get('/css/styleMainPageOrganizer.css', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../css/styleMainPageOrganizer.css'));
});
app.get('/css/styleMap.css', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../css/styleMap.css'));
});
app.get('/css/styleRegisterPage.css', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../css/styleRegisterPage.css'));
});
app.get('/css/styleUser.css', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../css/styleUser.css'));
});
app.get('/js/readTickets.js', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), 'readTickets.js'));
});
app.get('/js/addTicketPool.js', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), 'addTicketPool.js'));
});
app.get('/js/buyTickets.js', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), 'buyTickets.js'));
});
app.get('/js/calendar.js', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), 'calendar.js'));
});
app.get('/js/createAccount.js', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), 'createAccount.js'));
});
app.get('/js/loginScripts.js', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), 'loginScripts.js'));
});
app.get('/js/mapScripts.js', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), 'mapScripts.js'));
});
app.get('/js/readEvents.js', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), 'readEvents.js'));
});
app.get('/js/searching.js', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), 'searching.js'));
});
app.get('/js/ticketNumber.js', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), 'ticketNumber.js'));
});
app.get('/js/readAddedEvents.js', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), 'readAddedEvents.js'));
});
app.get('/', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../mainPage.html'));
});
app.get('/myTickets.html', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../myTickets.html'));
});
app.get('/addEvent.html', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../addEvent.html'));
});
app.get('/addEvent.html', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../addEvent.html'));
});
app.get('/BuyingTicketsForEventPage.html', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../BuyingTicketsForEventPage.html'));
});
app.get('/calendar.html', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../calendar.html'));
});
app.get('/kontakt.html', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../kontakt.html'));
});
app.get('/loginPage.html', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../loginPage.html'));
});
app.get('/mainPageOrganizer.html', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../mainPageOrganizer.html'));
});
app.get('/mainPage.html', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../mainPage.html'));
});
app.get('/map.html', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../map.html'));
});
app.get('/registerPage.html', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../registerPage.html'));
});
app.get('/searchingResults.html', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../searchingResults.html'));
});
app.get('/photos/1.png', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../photos/1.png'));
});
app.get('/photos/2.png', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../photos/2.png'));
});
app.get('/photos/3.png', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../photos/3.png'));
});
app.get('/photos/add-event-photo.jpg', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../photos/add-event-photo.jpg'));
});
app.get('/photos/concertphoto.png', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../photos/concertphoto.png'));
});
app.get('/photos/map.PNG', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../photos/map.PNG'));
});
app.get('/photos/my-events-photo.jpg', function (req, res) {
    res.sendFile(path.join(path.dirname(require.main.filename), '../photos/my-events-photo.jpg'));
});

