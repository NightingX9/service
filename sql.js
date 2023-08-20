var express = require('express')
var cors = require('cors')
const mysql = require('mysql');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  database: 'mydb'
});

var app = express()
app.use(cors())
app.use(express.json())

app.listen(6000, function () {
  console.log('CORS-enabled web server listening on port 5000')
})

// const mysql = require('mysql');

// var con = mysql.createConnection({
//   host: "localhost",
//   user: "root"
// });

// con.connect(function(err) {
//   if (err) throw err;
//   console.log("Connected!");
//   con.query("CREATE DATABASE mydb", function (err, result) {
//     if (err) throw err;
//     console.log("Database created");
//   });
// });