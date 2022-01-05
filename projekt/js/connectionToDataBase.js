var mysql = require("mysql");

var connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "events.com"
});

connection.connect(function (err){
  if(err) throw err;
  console.log("connected to database: events.com");
    let sql = "INSERT INTO users (name, surname, email, login, password, organizer) VALUES( 'Tomasz', 'Karolak', 'bor.szyc@email.com', 'borysS', 'haslo123', 1)";

    connection.query(sql, function(err, result){
        if(err) throw err;
        console.log("1 record inserted.");
    });

});

